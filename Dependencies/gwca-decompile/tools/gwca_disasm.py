#!/usr/bin/env python3
"""
Disassemble exported functions from gwca.dll using capstone.
Generates annotated assembly with resolved string/call references.
Outputs per-module disassembly files.
"""

import sys
import json
import struct
from pathlib import Path
from collections import defaultdict

try:
    import pefile
    from capstone import Cs, CS_ARCH_X86, CS_MODE_32
except ImportError:
    print("ERROR: Required packages not installed. Run: pip install pefile capstone")
    sys.exit(1)

GWCA_DIR = Path(__file__).resolve().parent.parent.parent / "GWCA"
DLL_PATH = GWCA_DIR / "bin" / "gwca.dll"
OUTPUT_DIR = Path(__file__).resolve().parent.parent / "disasm"


def load_pe(dll_path):
    """Load PE and extract relevant data."""
    pe = pefile.PE(str(dll_path), fast_load=False)
    pe.parse_data_directories()
    return pe


def get_section_data(pe):
    """Get section name, VA range, and raw data for each section."""
    sections = {}
    for sec in pe.sections:
        name = sec.Name.decode("ascii").rstrip("\x00")
        va_start = pe.OPTIONAL_HEADER.ImageBase + sec.VirtualAddress
        va_end = va_start + sec.Misc_VirtualSize
        data = sec.get_data()
        sections[name] = {
            "va_start": va_start,
            "va_end": va_end,
            "rva_start": sec.VirtualAddress,
            "data": data,
        }
    return sections


def extract_strings(pe, sections):
    """Extract ASCII and wide strings from .rdata section."""
    strings = {}
    if ".rdata" not in sections:
        return strings

    rdata = sections[".rdata"]
    data = rdata["data"]
    base = pe.OPTIONAL_HEADER.ImageBase + rdata["rva_start"]

    # Find null-terminated ASCII strings (min length 4)
    i = 0
    while i < len(data):
        if 0x20 <= data[i] <= 0x7e:
            end = i
            while end < len(data) and 0x20 <= data[end] <= 0x7e:
                end += 1
            if end < len(data) and data[end] == 0 and (end - i) >= 4:
                s = data[i:end].decode("ascii", errors="replace")
                addr = base + i
                strings[addr] = s
            i = end + 1
        else:
            i += 1

    return strings


def extract_exports(pe):
    """Get export name -> RVA mapping."""
    exports = {}
    rva_to_names = defaultdict(list)

    if hasattr(pe, "DIRECTORY_ENTRY_EXPORT"):
        for exp in pe.DIRECTORY_ENTRY_EXPORT.symbols:
            if exp.name:
                name = exp.name.decode("ascii")
                exports[name] = exp.address
                rva_to_names[exp.address].append(name)

    return exports, rva_to_names


def demangle_simple(name):
    """Simple MSVC demangling for display."""
    if not name.startswith("?"):
        return name
    parts = name.split("@")
    if len(parts) >= 3:
        func = parts[0][1:]
        ns = parts[1]
        return f"{ns}::{func}"
    return name


def find_function_end(data, start_offset, max_size=0x10000):
    """
    Heuristic to find function end.
    Look for common function epilogue patterns or next function prologue.
    """
    cs = Cs(CS_ARCH_X86, CS_MODE_32)
    cs.detail = False

    end = min(start_offset + max_size, len(data))
    chunk = data[start_offset:end]

    # Disassemble and look for ret instructions followed by
    # padding (0xCC = int3) or next function prologue
    last_ret = start_offset
    for insn in cs.disasm(chunk, 0):
        offset = start_offset + insn.address
        if insn.mnemonic in ("ret", "retn"):
            last_ret = offset + insn.size
            # Check if followed by int3 padding, nop padding, or another push ebp
            remaining = data[last_ret:last_ret + 16]
            if remaining:
                # int3 padding
                if remaining[0] == 0xCC:
                    return last_ret
                # nop padding (0x90 or multi-byte nops)
                if remaining[0] == 0x90:
                    return last_ret
                # Next function prologue: push ebp; mov ebp, esp
                if len(remaining) >= 3 and remaining[0] == 0x55 and remaining[1] == 0x8B and remaining[2] == 0xEC:
                    return last_ret
                # jmp instruction (tail call or thunk) followed by alignment
                if remaining[0] in (0xE9, 0xEB):
                    return last_ret
        # Unconditional jmp as function ending (tail call)
        if insn.mnemonic == "jmp" and insn.address > 0:
            peek_offset = start_offset + insn.address + insn.size
            if peek_offset < len(data):
                next_byte = data[peek_offset]
                if next_byte in (0xCC, 0x90, 0x55):
                    return peek_offset

    return last_ret if last_ret > start_offset else start_offset + 16


def disassemble_function(pe, sections, text_data, text_base, rva, strings, rva_to_names, image_base):
    """Disassemble a single function and annotate it."""
    cs = Cs(CS_ARCH_X86, CS_MODE_32)
    cs.detail = True

    text_rva_start = sections[".text"]["rva_start"]
    offset = rva - text_rva_start
    if offset < 0 or offset >= len(text_data):
        return None, 0

    func_end = find_function_end(text_data, offset)
    func_size = func_end - offset
    chunk = text_data[offset:func_end]

    lines = []
    func_va = image_base + rva

    for insn in cs.disasm(chunk, func_va):
        addr = insn.address
        mnemonic = insn.mnemonic
        op_str = insn.op_str
        raw = " ".join(f"{b:02x}" for b in insn.bytes)

        comment = ""

        # Resolve call targets
        if mnemonic == "call" and op_str.startswith("0x"):
            try:
                target = int(op_str, 16)
                target_rva = target - image_base
                if target_rva in rva_to_names:
                    names = rva_to_names[target_rva]
                    demangled = [demangle_simple(n) for n in names]
                    comment = f"; {', '.join(demangled)}"
            except ValueError:
                pass

        # Resolve push/mov of string addresses
        if not comment:
            for operand_val in _extract_immediates(insn):
                if operand_val in strings:
                    s = strings[operand_val]
                    if len(s) > 60:
                        s = s[:57] + "..."
                    comment = f'; "{s}"'
                    break

        line = f"  {addr:08X}:  {raw:30s}  {mnemonic:8s} {op_str}"
        if comment:
            line += f"  {comment}"
        lines.append(line)

    return lines, func_size


def _extract_immediates(insn):
    """Extract immediate values from instruction operands."""
    vals = []
    for op in insn.operands:
        if op.type == 2:  # CS_OP_IMM
            vals.append(op.imm & 0xFFFFFFFF)
        elif op.type == 3:  # CS_OP_MEM
            if op.mem.disp:
                vals.append(op.mem.disp & 0xFFFFFFFF)
    return vals


def guess_module(name, rva_to_names):
    """Guess which source file a function belongs to."""
    if not name:
        return "Unknown"

    if name.startswith("?"):
        parts = name.split("@")
        if len(parts) >= 3:
            ns = parts[1]
            ns_map = {
                "Agents": "AgentMgr",
                "CameraMgr": "CameraMgr",
                "Chat": "ChatMgr",
                "Effects": "EffectMgr",
                "EventMgr": "EventMgr",
                "FriendListMgr": "FriendListMgr",
                "GameThread": "GameThreadMgr",
                "GuildMgr": "GuildMgr",
                "Items": "ItemMgr",
                "Map": "MapMgr",
                "MemoryMgr": "MemoryMgr",
                "MemoryPatcher": "MemoryPatcher",
                "Merchant": "MerchantMgr",
                "PartyMgr": "PartyMgr",
                "PlayerMgr": "PlayerMgr",
                "QuestMgr": "QuestMgr",
                "Render": "RenderMgr",
                "SkillbarMgr": "SkillbarMgr",
                "StoC": "StoCMgr",
                "Trade": "TradeMgr",
                "UI": "UIMgr",
                "Scanner": "Scanner",
                "Hook": "Hooker",
                "GW": "GWCA",
                "FramePosition": "Frame",
                "FrameRelation": "Frame",
                "WindowPosition": "UIMgr",
                "ButtonFrame": "Frame",
                "CheckboxFrame": "Frame",
                "TextLabelFrame": "Frame",
                "ProgressBar": "Frame",
                "DropdownFrame": "Frame",
                "TabsFrame": "Frame",
                "ScrollableFrame": "Frame",
                "SliderFrame": "Frame",
                "EditableTextFrame": "Frame",
                "FrameWithValue": "Frame",
            }
            return ns_map.get(ns, "Unknown")
    return "Unknown"


def main():
    if not DLL_PATH.exists():
        print(f"ERROR: DLL not found: {DLL_PATH}")
        sys.exit(1)

    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    print(f"Loading {DLL_PATH}...")
    pe = load_pe(DLL_PATH)
    image_base = pe.OPTIONAL_HEADER.ImageBase
    sections = get_section_data(pe)
    strings = extract_strings(pe, sections)
    exports, rva_to_names = extract_exports(pe)

    text_sec = sections.get(".text")
    if not text_sec:
        print("ERROR: .text section not found")
        sys.exit(1)

    text_data = text_sec["data"]
    text_base = image_base + text_sec["rva_start"]

    print(f"Found {len(exports)} exports, {len(strings)} strings")
    print()

    # Get unique function addresses sorted by RVA
    unique_rvas = sorted(set(exports.values()))
    print(f"Disassembling {len(unique_rvas)} unique functions...")

    # Group by module
    by_module = defaultdict(list)
    for rva in unique_rvas:
        names = rva_to_names[rva]
        # Use first C++ name for classification, or first name
        cpp_names = [n for n in names if n.startswith("?")]
        classify_name = cpp_names[0] if cpp_names else names[0]
        module = guess_module(classify_name, rva_to_names)

        lines, size = disassemble_function(
            pe, sections, text_data, text_base, rva,
            strings, rva_to_names, image_base
        )
        if lines:
            demangled_names = [demangle_simple(n) for n in names]
            by_module[module].append({
                "rva": rva,
                "names": names,
                "demangled": demangled_names,
                "size": size,
                "lines": lines,
            })

    # Write per-module disassembly files
    total_funcs = 0
    total_bytes = 0
    for module in sorted(by_module.keys()):
        funcs = by_module[module]
        out_file = OUTPUT_DIR / f"{module}.asm"
        with open(out_file, "w") as f:
            f.write(f"; Module: {module}\n")
            f.write(f"; Functions: {len(funcs)}\n")
            f.write(f"; Total code size: {sum(fn['size'] for fn in funcs)} bytes\n")
            f.write(f";\n\n")

            for fn in sorted(funcs, key=lambda x: x["rva"]):
                f.write(f"; === {', '.join(fn['demangled'])} ===\n")
                f.write(f"; RVA: 0x{fn['rva']:08X}  Size: {fn['size']} bytes\n")
                f.write(f"; Exports: {', '.join(fn['names'])}\n")
                f.write(f";\n")
                for line in fn["lines"]:
                    f.write(line + "\n")
                f.write(f"\n\n")

        total_funcs += len(funcs)
        total_bytes += sum(fn["size"] for fn in funcs)
        print(f"  {module:25s}  {len(funcs):4d} functions  {sum(fn['size'] for fn in funcs):8d} bytes  -> {out_file.name}")

    print()
    print(f"Total: {total_funcs} functions, {total_bytes} bytes of code")
    print(f"Output directory: {OUTPUT_DIR}")

    # Write summary JSON
    summary = {
        "total_functions": total_funcs,
        "total_bytes": total_bytes,
        "modules": {},
    }
    for module, funcs in by_module.items():
        summary["modules"][module] = {
            "function_count": len(funcs),
            "total_bytes": sum(fn["size"] for fn in funcs),
            "functions": [
                {
                    "rva": fn["rva"],
                    "size": fn["size"],
                    "names": fn["names"],
                    "demangled": fn["demangled"],
                }
                for fn in sorted(funcs, key=lambda x: x["rva"])
            ],
        }

    summary_file = OUTPUT_DIR / "summary.json"
    with open(summary_file, "w") as f:
        json.dump(summary, f, indent=2)
    print(f"Summary written to {summary_file}")


if __name__ == "__main__":
    main()
