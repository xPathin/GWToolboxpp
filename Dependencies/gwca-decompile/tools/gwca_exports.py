#!/usr/bin/env python3
"""
Extract and analyze all exported symbols from gwca.dll and gwca.lib.
Identifies aliased exports (C++ and extern "C" sharing same address),
maps exports to header files, and outputs structured data for other tools.
"""

import sys
import json
import struct
from pathlib import Path
from collections import defaultdict

try:
    import pefile
except ImportError:
    print("ERROR: pefile not installed. Run: pip install pefile")
    sys.exit(1)

GWCA_DIR = Path(__file__).resolve().parent.parent.parent / "GWCA"
DLL_PATH = GWCA_DIR / "bin" / "gwca.dll"
LIB_PATH = GWCA_DIR / "lib" / "gwca.lib"
HEADER_DIR = GWCA_DIR / "include" / "GWCA"
OUTPUT_DIR = Path(__file__).resolve().parent.parent


def extract_dll_exports(dll_path):
    """Extract all exports from the DLL with names, ordinals, and RVAs."""
    pe = pefile.PE(str(dll_path))
    exports = []

    if hasattr(pe, "DIRECTORY_ENTRY_EXPORT"):
        for exp in pe.DIRECTORY_ENTRY_EXPORT.symbols:
            name = exp.name.decode("ascii") if exp.name else None
            exports.append({
                "name": name,
                "ordinal": exp.ordinal,
                "rva": exp.address,
                "forwarder": exp.forwarder.decode("ascii") if exp.forwarder else None,
            })

    # Sort by ordinal
    exports.sort(key=lambda e: e["ordinal"])
    return exports, pe


def extract_pe_info(pe):
    """Extract PE header information relevant to matching."""
    info = {
        "image_base": pe.OPTIONAL_HEADER.ImageBase,
        "section_alignment": pe.OPTIONAL_HEADER.SectionAlignment,
        "file_alignment": pe.OPTIONAL_HEADER.FileAlignment,
        "entry_point": pe.OPTIONAL_HEADER.AddressOfEntryPoint,
        "linker_version": f"{pe.OPTIONAL_HEADER.MajorLinkerVersion}.{pe.OPTIONAL_HEADER.MinorLinkerVersion}",
        "os_version": f"{pe.OPTIONAL_HEADER.MajorOperatingSystemVersion}.{pe.OPTIONAL_HEADER.MinorOperatingSystemVersion}",
        "subsystem": pe.OPTIONAL_HEADER.Subsystem,
        "dll_characteristics": pe.OPTIONAL_HEADER.DllCharacteristics,
        "sections": [],
    }

    for section in pe.sections:
        sec_name = section.Name.decode("ascii").rstrip("\x00")
        info["sections"].append({
            "name": sec_name,
            "virtual_address": section.VirtualAddress,
            "virtual_size": section.Misc_VirtualSize,
            "raw_size": section.SizeOfRawData,
            "raw_offset": section.PointerToRawData,
            "characteristics": section.Characteristics,
        })

    return info


def find_aliased_exports(exports):
    """Find exports that share the same RVA (aliased C++/extern C pairs)."""
    by_rva = defaultdict(list)
    for exp in exports:
        if exp["rva"]:
            by_rva[exp["rva"]].append(exp)

    aliased = {}
    unique_addrs = set()
    for rva, exps in by_rva.items():
        if len(exps) > 1:
            names = [e["name"] for e in exps]
            # Typically one mangled C++ name and one plain C name
            cpp_names = [n for n in names if n and n.startswith("?")]
            c_names = [n for n in names if n and not n.startswith("?")]
            aliased[rva] = {"cpp": cpp_names, "c": c_names, "all": names}
        unique_addrs.add(rva)

    return aliased, len(unique_addrs)


def classify_export(name):
    """Classify an export as C++ mangled or extern C."""
    if not name:
        return "unnamed"
    if name.startswith("?"):
        return "cpp_mangled"
    return "extern_c"


def demangle_msvc(name):
    """Basic MSVC name demangling for namespace extraction."""
    if not name or not name.startswith("?"):
        return name

    # Extract namespace hints from mangled name
    # ?FunctionName@Namespace@@...
    parts = name.split("@")
    if len(parts) >= 3:
        func = parts[0][1:]  # Remove leading ?
        ns = parts[1]
        return f"{ns}::{func}"
    return name


def guess_source_file(name):
    """Guess which source file an export belongs to based on namespace."""
    if not name:
        return "Unknown"

    demangled = demangle_msvc(name)

    # Map namespaces to source files
    ns_map = {
        "Agents": "AgentMgr.cpp",
        "CameraMgr": "CameraMgr.cpp",
        "Chat": "ChatMgr.cpp",
        "Effects": "EffectMgr.cpp",
        "EventMgr": "EventMgr.cpp",
        "FriendListMgr": "FriendListMgr.cpp",
        "GameThread": "GameThreadMgr.cpp",
        "GuildMgr": "GuildMgr.cpp",
        "Items": "ItemMgr.cpp",
        "Map": "MapMgr.cpp",
        "MemoryMgr": "MemoryMgr.cpp",
        "MemoryPatcher": "MemoryPatcher.cpp",
        "Merchant": "MerchantMgr.cpp",
        "PartyMgr": "PartyMgr.cpp",
        "PlayerMgr": "PlayerMgr.cpp",
        "QuestMgr": "QuestMgr.cpp",
        "Render": "RenderMgr.cpp",
        "SkillbarMgr": "SkillbarMgr.cpp",
        "StoC": "StoCMgr.cpp",
        "Trade": "TradeMgr.cpp",
        "UI": "UIMgr.cpp",
        "Scanner": "Scanner.cpp",
        "Hook": "Hooker.cpp",
        "GW": "GWCA.cpp",
        # Frame types
        "FramePosition": "Frame.cpp",
        "FrameRelation": "Frame.cpp",
        "WindowPosition": "UIMgr.cpp",
        "ButtonFrame": "Frame.cpp",
        "CheckboxFrame": "Frame.cpp",
        "TextLabelFrame": "Frame.cpp",
        "ProgressBar": "Frame.cpp",
        "DropdownFrame": "Frame.cpp",
        "TabsFrame": "Frame.cpp",
        "ScrollableFrame": "Frame.cpp",
        "SliderFrame": "Frame.cpp",
        "EditableTextFrame": "Frame.cpp",
    }

    if "::" in demangled:
        ns = demangled.split("::")[0]
        if ns in ns_map:
            return ns_map[ns]

    # For extern C functions, try to match by name patterns
    if not name.startswith("?"):
        c_to_module = {
            "SendDialog": "AgentMgr.cpp",
            "GetIsAgentTargettable": "AgentMgr.cpp",
            "GetObservingId": "AgentMgr.cpp",
            "GetControlledCharacterId": "AgentMgr.cpp",
            "GetTargetId": "AgentMgr.cpp",
            "GetAgentByID": "AgentMgr.cpp",
            "GetPlayerByID": "AgentMgr.cpp",
            "GetControlledCharacter": "AgentMgr.cpp",
            "Move": "AgentMgr.cpp",
            "InteractAgent": "AgentMgr.cpp",
            "ChangeTarget": "AgentMgr.cpp",
            "ButtonClick": "UIMgr.cpp",
            "GetRootFrame": "UIMgr.cpp",
            "GetChildFrame": "UIMgr.cpp",
            "GetFrameById": "UIMgr.cpp",
            "SendUIMessage": "UIMgr.cpp",
            "GetPreference": "UIMgr.cpp",
            "SetPreference": "UIMgr.cpp",
            "AcceptTrade": "TradeMgr.cpp",
            "CancelTrade": "TradeMgr.cpp",
            "Initialize": "GWCA.cpp",
            "Terminate": "GWCA.cpp",
        }
        for prefix, module in c_to_module.items():
            if name.startswith(prefix):
                return module

    return "Unknown"


def scan_headers_for_exports(header_dir):
    """Scan header files for GWCA_API declarations to cross-reference."""
    declared = {}
    for h in sorted(header_dir.rglob("*.h")):
        rel = h.relative_to(header_dir)
        with open(h, "r", encoding="utf-8", errors="replace") as f:
            for lineno, line in enumerate(f, 1):
                if "GWCA_API" in line and not line.strip().startswith("//"):
                    declared[f"{rel}:{lineno}"] = line.strip()
    return declared


def main():
    if not DLL_PATH.exists():
        print(f"ERROR: DLL not found at {DLL_PATH}")
        sys.exit(1)

    print(f"Analyzing {DLL_PATH}...")
    print(f"DLL size: {DLL_PATH.stat().st_size:,} bytes")
    print()

    exports, pe = extract_dll_exports(DLL_PATH)
    pe_info = extract_pe_info(pe)
    aliased, unique_count = find_aliased_exports(exports)

    # Print PE info
    print("=== PE Header Info ===")
    print(f"  ImageBase: 0x{pe_info['image_base']:08X}")
    print(f"  Entry point: 0x{pe_info['entry_point']:08X}")
    print(f"  Linker: {pe_info['linker_version']}")
    print(f"  Subsystem: {pe_info['subsystem']}")
    print(f"  DLL characteristics: 0x{pe_info['dll_characteristics']:04X}")
    print()

    print("=== Sections ===")
    for sec in pe_info["sections"]:
        print(f"  {sec['name']:8s}  VA=0x{sec['virtual_address']:08X}  "
              f"VSize=0x{sec['virtual_size']:08X}  "
              f"RawSize=0x{sec['raw_size']:08X}  "
              f"RawOff=0x{sec['raw_offset']:08X}")
    print()

    # Classification
    cpp_count = sum(1 for e in exports if classify_export(e["name"]) == "cpp_mangled")
    c_count = sum(1 for e in exports if classify_export(e["name"]) == "extern_c")
    unnamed_count = sum(1 for e in exports if classify_export(e["name"]) == "unnamed")

    print("=== Export Summary ===")
    print(f"  Total exports: {len(exports)}")
    print(f"  C++ mangled: {cpp_count}")
    print(f"  extern \"C\": {c_count}")
    print(f"  Unnamed: {unnamed_count}")
    print(f"  Unique addresses: {unique_count}")
    print(f"  Aliased pairs: {len(aliased)}")
    print()

    # Group by guessed source file
    by_module = defaultdict(list)
    for exp in exports:
        module = guess_source_file(exp["name"])
        by_module[module].append(exp)

    print("=== Exports by Module ===")
    for module in sorted(by_module.keys()):
        exps = by_module[module]
        cpp = sum(1 for e in exps if classify_export(e["name"]) == "cpp_mangled")
        c = sum(1 for e in exps if classify_export(e["name"]) == "extern_c")
        print(f"  {module:30s}  {len(exps):4d} total ({cpp} C++, {c} C)")

    print()

    # Show aliased exports (shared address)
    print("=== Aliased Exports (C++ and extern C at same address) ===")
    alias_count = 0
    for rva in sorted(aliased.keys()):
        info = aliased[rva]
        if info["cpp"] and info["c"]:
            alias_count += 1
            cpp_demangled = [demangle_msvc(n) for n in info["cpp"]]
            if alias_count <= 20:
                print(f"  RVA 0x{rva:08X}: {', '.join(cpp_demangled)} == {', '.join(info['c'])}")
    if alias_count > 20:
        print(f"  ... and {alias_count - 20} more")
    print(f"  Total aliased: {alias_count}")
    print()

    # Scan headers
    print("=== Header Declarations ===")
    declared = scan_headers_for_exports(HEADER_DIR)
    print(f"  GWCA_API declarations found in headers: {len(declared)}")
    print()

    # Export full data as JSON for other tools
    output_data = {
        "pe_info": pe_info,
        "exports": exports,
        "aliased": {str(k): v for k, v in aliased.items()},
        "by_module": {k: [e["name"] for e in v] for k, v in by_module.items()},
        "unique_addresses": unique_count,
        "header_declarations": len(declared),
    }

    output_file = OUTPUT_DIR / "exports.json"
    with open(output_file, "w") as f:
        json.dump(output_data, f, indent=2)
    print(f"Full export data written to {output_file}")

    # Also write a simple list of all export names
    names_file = OUTPUT_DIR / "export_names.txt"
    with open(names_file, "w") as f:
        for exp in exports:
            if exp["name"]:
                kind = classify_export(exp["name"])
                demangled = demangle_msvc(exp["name"]) if kind == "cpp_mangled" else exp["name"]
                f.write(f"{exp['ordinal']:4d}  0x{exp['rva']:08X}  {kind:12s}  {demangled}\n")
    print(f"Export names written to {names_file}")


if __name__ == "__main__":
    main()
