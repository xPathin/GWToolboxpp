#!/usr/bin/env python3
"""
Compare two gwca.dll binaries for byte-level matching.
Supports per-function comparison with relocation awareness and call operand masking.

Usage:
  gwca_compare.py <original.dll> <rebuilt.dll> [options]

Options:
  --json              Write full report to comparison_report.json
  --module MODULE     Filter to a specific module (e.g., AgentMgr, UIMgr)
  --mask-calls        Mask near call/jmp operands (E8/E9) to ignore code layout diffs
  --diff N            Show hex diff context for first N non-matching functions (default: 0)
  --show-matching     Also list matching functions
"""

import sys
import argparse
import json
import struct
from pathlib import Path
from collections import defaultdict

try:
    import pefile
except ImportError:
    print("ERROR: pefile not installed. Run: pip install pefile")
    sys.exit(1)

# Module classification map (shared with gwca_disasm.py)
NS_MODULE_MAP = {
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


def guess_module(name):
    """Guess which source module a function belongs to based on its mangled name."""
    if not name or not name.startswith("?"):
        return "Unknown"
    parts = name.split("@")
    if len(parts) >= 3:
        ns = parts[1]
        return NS_MODULE_MAP.get(ns, "Unknown")
    return "Unknown"


def demangle_simple(name):
    """Simple MSVC demangling for display."""
    if not name.startswith("?"):
        return name
    parts = name.split("@")
    if len(parts) >= 3:
        return f"{parts[1]}::{parts[0][1:]}"
    return name


def load_pe(path):
    pe = pefile.PE(str(path), fast_load=False)
    pe.parse_data_directories()
    return pe


def get_relocations(pe):
    """Get set of file offsets that are relocation targets (4-byte absolute addresses)."""
    reloc_offsets = set()
    if hasattr(pe, "DIRECTORY_ENTRY_BASERELOC"):
        for reloc_block in pe.DIRECTORY_ENTRY_BASERELOC:
            for entry in reloc_block.entries:
                if entry.type == 3:  # IMAGE_REL_BASED_HIGHLOW
                    rva = entry.rva
                    offset = pe.get_offset_from_rva(rva)
                    if offset:
                        for i in range(4):
                            reloc_offsets.add(offset + i)
    return reloc_offsets


def get_exports(pe):
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


def get_section_data(pe, section_name):
    """Get section data and RVA."""
    for sec in pe.sections:
        name = sec.Name.decode("ascii").rstrip("\x00")
        if name == section_name:
            return sec.get_data(), sec.VirtualAddress, sec.PointerToRawData
    return None, None, None


def find_function_boundaries(data, start_offset, max_len=0x10000):
    """Simple heuristic to find function end offset."""
    end = min(start_offset + max_len, len(data))
    i = start_offset
    while i < end:
        # ret (C3) or retn (C2 xx xx) followed by padding or next prologue
        if data[i] == 0xC3:
            next_off = i + 1
            if next_off < end and data[next_off] in (0xCC, 0x90, 0x55):
                return next_off
        if data[i] == 0xC2 and i + 2 < end:
            next_off = i + 3
            if next_off < end and data[next_off] in (0xCC, 0x90, 0x55):
                return next_off
        i += 1
    return min(start_offset + 256, end)


def find_near_call_offsets(data):
    """
    Find byte offsets of near call (E8) and near jmp (E9) operands.
    Returns a set of offsets that are the 4-byte relative displacement.
    Uses simple linear scan; accurate enough for compiled x86 code.
    """
    mask_offsets = set()
    try:
        from capstone import Cs, CS_ARCH_X86, CS_MODE_32
        cs = Cs(CS_ARCH_X86, CS_MODE_32)
        cs.detail = False
        for insn in cs.disasm(bytes(data), 0):
            if insn.mnemonic in ("call", "jmp") and len(insn.bytes) == 5:
                if insn.bytes[0] in (0xE8, 0xE9):
                    for j in range(1, 5):
                        mask_offsets.add(insn.address + j)
        return mask_offsets
    except ImportError:
        # Fallback: simple byte scan (less accurate but no dependency)
        i = 0
        while i < len(data) - 4:
            if data[i] in (0xE8, 0xE9):
                for j in range(1, 5):
                    mask_offsets.add(i + j)
                i += 5
            else:
                i += 1
        return mask_offsets


def compare_sections(pe1, pe2, section_name, relocs1, relocs2):
    """Compare a section between two PEs, ignoring relocation fixups."""
    data1, rva1, raw1 = get_section_data(pe1, section_name)
    data2, rva2, raw2 = get_section_data(pe2, section_name)

    if data1 is None or data2 is None:
        return {"error": f"Section {section_name} not found in one or both files"}

    matching_bytes = 0
    different_bytes = 0
    reloc_skipped = 0
    first_diffs = []

    min_len = min(len(data1), len(data2))
    for i in range(min_len):
        file_off1 = raw1 + i if raw1 else i
        file_off2 = raw2 + i if raw2 else i

        if file_off1 in relocs1 or file_off2 in relocs2:
            reloc_skipped += 1
            continue

        if data1[i] == data2[i]:
            matching_bytes += 1
        else:
            different_bytes += 1
            if len(first_diffs) < 20:
                first_diffs.append({
                    "offset": i,
                    "rva": rva1 + i if rva1 else i,
                    "byte1": f"0x{data1[i]:02X}",
                    "byte2": f"0x{data2[i]:02X}",
                })

    total_compared = matching_bytes + different_bytes
    pct = (matching_bytes / total_compared * 100) if total_compared > 0 else 0

    return {
        "section": section_name,
        "size1": len(data1),
        "size2": len(data2),
        "compared_bytes": total_compared,
        "matching_bytes": matching_bytes,
        "different_bytes": different_bytes,
        "reloc_skipped": reloc_skipped,
        "match_pct": round(pct, 2),
        "size_match": len(data1) == len(data2),
        "first_diffs": first_diffs,
    }


def compare_exports(pe1, pe2):
    """Compare export tables between two PEs."""
    exp1, _ = get_exports(pe1)
    exp2, _ = get_exports(pe2)

    names1 = set(exp1.keys())
    names2 = set(exp2.keys())

    missing = names1 - names2
    extra = names2 - names1
    common = names1 & names2

    rva_match = sum(1 for n in common if exp1[n] == exp2[n])

    return {
        "exports_in_original": len(exp1),
        "exports_in_rebuilt": len(exp2),
        "missing_from_rebuilt": sorted(missing),
        "extra_in_rebuilt": sorted(extra),
        "common": len(common),
        "rva_matching": rva_match,
    }


def compare_functions(pe1, pe2, relocs1, relocs2, mask_calls=False, module_filter=None):
    """Compare each exported function byte-by-byte."""
    exp1, rva_to_names1 = get_exports(pe1)
    exp2, rva_to_names2 = get_exports(pe2)

    text1, text_rva1, text_raw1 = get_section_data(pe1, ".text")
    text2, text_rva2, text_raw2 = get_section_data(pe2, ".text")

    if text1 is None or text2 is None:
        return {"error": ".text section not found"}

    common_names = set(exp1.keys()) & set(exp2.keys())
    unique_rvas = sorted(set(exp1[n] for n in common_names))

    results = []
    matching = 0
    different = 0

    for rva in unique_rvas:
        names = rva_to_names1.get(rva, ["unknown"])

        # Module filtering
        if module_filter:
            cpp_names = [n for n in names if n.startswith("?")]
            classify_name = cpp_names[0] if cpp_names else names[0]
            module = guess_module(classify_name)
            if module.lower() != module_filter.lower():
                continue

        common_at_rva = [n for n in names if n in common_names]
        if not common_at_rva:
            continue
        rva2 = exp2.get(common_at_rva[0])
        if rva2 is None:
            continue

        off1 = rva - text_rva1
        off2 = rva2 - text_rva2

        if off1 < 0 or off1 >= len(text1) or off2 < 0 or off2 >= len(text2):
            continue

        end1 = find_function_boundaries(text1, off1)
        end2 = find_function_boundaries(text2, off2)

        size1 = end1 - off1
        size2 = end2 - off2

        func1 = text1[off1:end1]
        func2 = text2[off2:end2]

        # Build call/jmp operand masks if requested
        call_mask1 = find_near_call_offsets(func1) if mask_calls else set()
        call_mask2 = find_near_call_offsets(func2) if mask_calls else set()

        # Compare with relocation + call masking awareness
        min_size = min(size1, size2)
        func_match = True
        diff_offset = -1
        diff_count = 0
        call_masked = 0
        diff_bytes = []

        for i in range(min_size):
            foff1 = text_raw1 + off1 + i
            foff2 = text_raw2 + off2 + i

            # Skip relocation bytes
            if foff1 in relocs1 or foff2 in relocs2:
                continue

            # Skip call/jmp operand bytes
            if i in call_mask1 or i in call_mask2:
                call_masked += 1
                continue

            if func1[i] != func2[i]:
                diff_count += 1
                if func_match:
                    diff_offset = i
                    func_match = False
                if len(diff_bytes) < 64:
                    diff_bytes.append({
                        "offset": i,
                        "orig": func1[i],
                        "rebuilt": func2[i],
                    })

        if size1 != size2:
            func_match = False

        demangled = []
        for n in names:
            demangled.append(demangle_simple(n))

        # Classify module
        cpp_names = [n for n in names if n.startswith("?")]
        classify_name = cpp_names[0] if cpp_names else names[0]
        module = guess_module(classify_name)

        if func_match:
            matching += 1
        else:
            different += 1

        results.append({
            "rva1": rva,
            "rva2": rva2,
            "names": common_at_rva[:3],
            "demangled": demangled[:3],
            "module": module,
            "size1": size1,
            "size2": size2,
            "match": func_match,
            "first_diff_offset": diff_offset,
            "diff_count": diff_count,
            "call_masked": call_masked,
            "diff_bytes": diff_bytes,
        })

    total = matching + different
    pct = (matching / total * 100) if total > 0 else 0

    return {
        "total_functions": total,
        "matching": matching,
        "different": different,
        "match_pct": round(pct, 2),
        "details": results,
    }


def print_hex_diff(func_data, diff_bytes, func1_data, func2_data, size1, size2, max_regions=3):
    """Print hex diff context around differing bytes."""
    if not diff_bytes:
        if size1 != size2:
            print(f"        Size mismatch only: {size1} vs {size2} bytes")
        return

    # Group consecutive diffs into regions
    regions = []
    current_region = [diff_bytes[0]["offset"]]
    for db in diff_bytes[1:]:
        if db["offset"] - current_region[-1] <= 8:
            current_region.append(db["offset"])
        else:
            regions.append(current_region)
            current_region = [db["offset"]]
    regions.append(current_region)

    for idx, region in enumerate(regions[:max_regions]):
        start = max(0, region[0] - 4)
        end = min(min(size1, size2), region[-1] + 5)

        print(f"        Diff region {idx+1} at +0x{region[0]:X}:")

        # Original
        orig_hex = []
        for i in range(start, end):
            if i < size1:
                marker = ">" if i in region else " "
                orig_hex.append(f"{marker}{func1_data[i]:02X}")
            else:
                orig_hex.append(" --")
        print(f"          orig:  {' '.join(orig_hex)}")

        # Rebuilt
        rbuilt_hex = []
        for i in range(start, end):
            if i < size2:
                marker = ">" if i in region else " "
                rbuilt_hex.append(f"{marker}{func2_data[i]:02X}")
            else:
                rbuilt_hex.append(" --")
        print(f"          built: {' '.join(rbuilt_hex)}")

    if len(regions) > max_regions:
        print(f"        ... and {len(regions) - max_regions} more diff regions")


def print_module_summary(func_result):
    """Print per-module summary statistics."""
    module_stats = defaultdict(lambda: {"matching": 0, "different": 0})

    for fn in func_result["details"]:
        mod = fn["module"]
        if fn["match"]:
            module_stats[mod]["matching"] += 1
        else:
            module_stats[mod]["different"] += 1

    print("  Per-module breakdown:")
    print(f"    {'Module':<20s} {'Match':>5s} {'Diff':>5s} {'Total':>5s} {'Rate':>6s}")
    print(f"    {'-'*20} {'-'*5} {'-'*5} {'-'*5} {'-'*6}")

    for mod in sorted(module_stats.keys()):
        s = module_stats[mod]
        total = s["matching"] + s["different"]
        rate = (s["matching"] / total * 100) if total > 0 else 0
        print(f"    {mod:<20s} {s['matching']:>5d} {s['different']:>5d} {total:>5d} {rate:>5.1f}%")

    total_m = sum(s["matching"] for s in module_stats.values())
    total_d = sum(s["different"] for s in module_stats.values())
    total_all = total_m + total_d
    total_rate = (total_m / total_all * 100) if total_all > 0 else 0
    print(f"    {'-'*20} {'-'*5} {'-'*5} {'-'*5} {'-'*6}")
    print(f"    {'TOTAL':<20s} {total_m:>5d} {total_d:>5d} {total_all:>5d} {total_rate:>5.1f}%")


def print_missing_by_module(missing_names):
    """Print missing exports grouped by module."""
    by_module = defaultdict(list)
    for name in missing_names:
        module = guess_module(name)
        by_module[module].append(name)

    print(f"  Missing exports by module ({len(missing_names)} total):")
    for mod in sorted(by_module.keys()):
        names = by_module[mod]
        print(f"    {mod} ({len(names)}):")
        for n in sorted(names)[:5]:
            print(f"      - {demangle_simple(n)}")
        if len(names) > 5:
            print(f"      ... and {len(names) - 5} more")


def main():
    parser = argparse.ArgumentParser(description="Compare gwca.dll binaries for bytecode parity")
    parser.add_argument("original", type=Path, help="Original gwca.dll")
    parser.add_argument("rebuilt", type=Path, help="Rebuilt gwca.dll")
    parser.add_argument("--json", action="store_true", help="Write full JSON report")
    parser.add_argument("--module", type=str, default=None, help="Filter to specific module")
    parser.add_argument("--mask-calls", action="store_true", help="Mask near call/jmp operands")
    parser.add_argument("--diff", type=int, default=0, metavar="N",
                        help="Show hex diff for first N non-matching functions")
    parser.add_argument("--show-matching", action="store_true", help="List matching functions too")

    args = parser.parse_args()

    if not args.original.exists():
        print(f"ERROR: Original DLL not found: {args.original}")
        sys.exit(1)
    if not args.rebuilt.exists():
        print(f"ERROR: Rebuilt DLL not found: {args.rebuilt}")
        sys.exit(1)

    print(f"Original: {args.original} ({args.original.stat().st_size:,} bytes)")
    print(f"Rebuilt:  {args.rebuilt} ({args.rebuilt.stat().st_size:,} bytes)")
    if args.mask_calls:
        print(f"Call/jmp operand masking: ENABLED")
    if args.module:
        print(f"Module filter: {args.module}")
    print()

    pe1 = load_pe(args.original)
    pe2 = load_pe(args.rebuilt)

    relocs1 = get_relocations(pe1)
    relocs2 = get_relocations(pe2)

    # Compare exports
    print("=== Export Comparison ===")
    exp_result = compare_exports(pe1, pe2)
    print(f"  Original exports: {exp_result['exports_in_original']}")
    print(f"  Rebuilt exports:  {exp_result['exports_in_rebuilt']}")
    print(f"  Common:           {exp_result['common']}")
    if exp_result["missing_from_rebuilt"]:
        print_missing_by_module(exp_result["missing_from_rebuilt"])
    if exp_result["extra_in_rebuilt"]:
        print(f"  Extra ({len(exp_result['extra_in_rebuilt'])}):")
        for name in exp_result["extra_in_rebuilt"][:10]:
            print(f"    - {demangle_simple(name)}")
    print()

    # Compare sections (skip if module-filtered since it's whole-DLL)
    if not args.module:
        print("=== Section Comparison ===")
        section_results = {}
        for sec_name in [".text", ".rdata", ".data"]:
            result = compare_sections(pe1, pe2, sec_name, relocs1, relocs2)
            section_results[sec_name] = result
            if "error" in result:
                print(f"  {sec_name}: {result['error']}")
            else:
                print(f"  {sec_name}:")
                print(f"    Size: {result['size1']:,} vs {result['size2']:,} {'(match)' if result['size_match'] else '(DIFFER)'}")
                print(f"    Compared: {result['compared_bytes']:,} bytes (skipped {result['reloc_skipped']:,} reloc bytes)")
                print(f"    Matching: {result['matching_bytes']:,} / {result['compared_bytes']:,} ({result['match_pct']}%)")
                if result["first_diffs"]:
                    print(f"    First differences:")
                    for d in result["first_diffs"][:5]:
                        print(f"      RVA 0x{d['rva']:08X}: {d['byte1']} vs {d['byte2']}")
        print()

    # Compare functions
    print("=== Per-Function Comparison ===")
    func_result = compare_functions(pe1, pe2, relocs1, relocs2,
                                    mask_calls=args.mask_calls,
                                    module_filter=args.module)
    if "error" in func_result:
        print(f"  Error: {func_result['error']}")
    else:
        print(f"  Total functions compared: {func_result['total_functions']}")
        print(f"  Matching: {func_result['matching']} ({func_result['match_pct']}%)")
        print(f"  Different: {func_result['different']}")
        if args.mask_calls:
            total_masked = sum(fn.get("call_masked", 0) for fn in func_result["details"])
            print(f"  Call/jmp bytes masked: {total_masked}")
        print()

        # Per-module summary
        if not args.module:
            print_module_summary(func_result)
            print()

        # Show matching functions if requested
        if args.show_matching:
            match_funcs = [f for f in func_result["details"] if f["match"]]
            if match_funcs:
                print(f"  Matching functions ({len(match_funcs)}):")
                for fn in match_funcs:
                    name = fn["demangled"][0] if fn["demangled"] else fn["names"][0]
                    print(f"    OK  {fn['module']:<16s} {name} ({fn['size1']} bytes)")
                print()

        # Show non-matching functions
        if func_result["different"] > 0:
            diff_funcs = [f for f in func_result["details"] if not f["match"]]

            # Retrieve .text data for hex diffs
            text1, text_rva1, _ = get_section_data(pe1, ".text")
            text2, text_rva2, _ = get_section_data(pe2, ".text")

            print(f"  Non-matching functions ({len(diff_funcs)}):")
            for idx, fn in enumerate(diff_funcs):
                name = fn["demangled"][0] if fn["demangled"] else fn["names"][0]
                size_info = f"{fn['size1']} vs {fn['size2']}"
                if fn["size1"] == fn["size2"]:
                    size_info = f"{fn['size1']} (same size)"
                diff_info = f"diffs: {fn['diff_count']}" if fn["diff_count"] > 0 else "size only"
                masked_info = f", masked: {fn['call_masked']}" if fn.get("call_masked", 0) > 0 else ""
                print(f"    DIFF {fn['module']:<16s} {name}: {size_info}, {diff_info}{masked_info}")

                # Hex diff detail
                if idx < args.diff and text1 and text2:
                    off1 = fn["rva1"] - text_rva1
                    off2 = fn["rva2"] - text_rva2
                    func1_data = text1[off1:off1 + fn["size1"]]
                    func2_data = text2[off2:off2 + fn["size2"]]
                    print_hex_diff(fn, fn["diff_bytes"], func1_data, func2_data,
                                   fn["size1"], fn["size2"])

            if len(diff_funcs) > 50:
                # Already printed all, but note the count
                pass

    if args.json:
        report = {
            "exports": exp_result,
            "functions": func_result,
        }
        if not args.module:
            report["sections"] = section_results
        report_path = args.rebuilt.parent / "comparison_report.json"
        with open(report_path, "w") as f:
            json.dump(report, f, indent=2)
        print(f"\nFull report written to {report_path}")


if __name__ == "__main__":
    main()
