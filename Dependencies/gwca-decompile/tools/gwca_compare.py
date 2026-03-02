#!/usr/bin/env python3
"""
Compare two gwca.dll binaries for byte-level matching.
Supports per-function comparison with relocation awareness.
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
                    # Convert RVA to file offset
                    offset = pe.get_offset_from_rva(rva)
                    if offset:
                        # Mark 4 bytes at this offset as relocation targets
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


def compare_sections(pe1, pe2, section_name, relocs1, relocs2):
    """Compare a section between two PEs, ignoring relocation fixups."""
    data1, rva1, raw1 = get_section_data(pe1, section_name)
    data2, rva2, raw2 = get_section_data(pe2, section_name)

    if data1 is None or data2 is None:
        return {"error": f"Section {section_name} not found in one or both files"}

    min_len = min(len(data1), len(data2))
    max_len = max(len(data1), len(data2))

    matching_bytes = 0
    different_bytes = 0
    reloc_skipped = 0
    first_diffs = []

    for i in range(min_len):
        file_off1 = raw1 + i if raw1 else i
        file_off2 = raw2 + i if raw2 else i

        # Skip bytes that are relocation targets
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


def compare_functions(pe1, pe2, relocs1, relocs2):
    """Compare each exported function byte-by-byte."""
    exp1, rva_to_names1 = get_exports(pe1)
    exp2, rva_to_names2 = get_exports(pe2)

    text1, text_rva1, text_raw1 = get_section_data(pe1, ".text")
    text2, text_rva2, text_raw2 = get_section_data(pe2, ".text")

    if text1 is None or text2 is None:
        return {"error": ".text section not found"}

    common_names = set(exp1.keys()) & set(exp2.keys())

    # Get unique RVAs from original
    unique_rvas = sorted(set(exp1[n] for n in common_names))

    results = []
    matching = 0
    different = 0

    for rva in unique_rvas:
        names = rva_to_names1.get(rva, ["unknown"])

        # Find corresponding RVA in rebuilt (by first common name)
        common_at_rva = [n for n in names if n in common_names]
        if not common_at_rva:
            continue
        rva2 = exp2.get(common_at_rva[0])
        if rva2 is None:
            continue

        # Get function data from both
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

        # Compare with relocation awareness
        min_size = min(size1, size2)
        func_match = True
        diff_offset = -1

        for i in range(min_size):
            foff1 = text_raw1 + off1 + i
            foff2 = text_raw2 + off2 + i

            if foff1 in relocs1 or foff2 in relocs2:
                continue

            if func1[i] != func2[i]:
                func_match = False
                diff_offset = i
                break

        if size1 != size2:
            func_match = False

        demangled = []
        for n in names:
            if n.startswith("?"):
                parts = n.split("@")
                if len(parts) >= 3:
                    demangled.append(f"{parts[1]}::{parts[0][1:]}")
                else:
                    demangled.append(n)
            else:
                demangled.append(n)

        if func_match:
            matching += 1
        else:
            different += 1

        results.append({
            "rva1": rva,
            "rva2": rva2,
            "names": common_at_rva[:3],
            "demangled": demangled[:3],
            "size1": size1,
            "size2": size2,
            "match": func_match,
            "first_diff_offset": diff_offset if not func_match else -1,
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


def main():
    if len(sys.argv) < 3:
        print(f"Usage: {sys.argv[0]} <original.dll> <rebuilt.dll>")
        print(f"  or: {sys.argv[0]} <original.dll> <rebuilt.dll> --json")
        sys.exit(1)

    original_path = Path(sys.argv[1])
    rebuilt_path = Path(sys.argv[2])
    output_json = "--json" in sys.argv

    if not original_path.exists():
        print(f"ERROR: Original DLL not found: {original_path}")
        sys.exit(1)
    if not rebuilt_path.exists():
        print(f"ERROR: Rebuilt DLL not found: {rebuilt_path}")
        sys.exit(1)

    print(f"Original: {original_path} ({original_path.stat().st_size:,} bytes)")
    print(f"Rebuilt:  {rebuilt_path} ({rebuilt_path.stat().st_size:,} bytes)")
    print()

    pe1 = load_pe(original_path)
    pe2 = load_pe(rebuilt_path)

    relocs1 = get_relocations(pe1)
    relocs2 = get_relocations(pe2)

    # Compare exports
    print("=== Export Comparison ===")
    exp_result = compare_exports(pe1, pe2)
    print(f"  Original exports: {exp_result['exports_in_original']}")
    print(f"  Rebuilt exports:  {exp_result['exports_in_rebuilt']}")
    print(f"  Common:           {exp_result['common']}")
    if exp_result["missing_from_rebuilt"]:
        print(f"  Missing ({len(exp_result['missing_from_rebuilt'])}):")
        for name in exp_result["missing_from_rebuilt"][:10]:
            print(f"    - {name}")
        if len(exp_result["missing_from_rebuilt"]) > 10:
            print(f"    ... and {len(exp_result['missing_from_rebuilt']) - 10} more")
    if exp_result["extra_in_rebuilt"]:
        print(f"  Extra ({len(exp_result['extra_in_rebuilt'])}):")
        for name in exp_result["extra_in_rebuilt"][:10]:
            print(f"    - {name}")
    print()

    # Compare sections
    print("=== Section Comparison ===")
    section_results = {}
    for sec_name in [".text", ".rdata", ".data"]:
        result = compare_sections(pe1, pe2, relocs1, relocs2, sec_name) if False else compare_sections(pe1, pe2, sec_name, relocs1, relocs2)
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
    func_result = compare_functions(pe1, pe2, relocs1, relocs2)
    if "error" in func_result:
        print(f"  Error: {func_result['error']}")
    else:
        print(f"  Total functions compared: {func_result['total_functions']}")
        print(f"  Matching: {func_result['matching']} ({func_result['match_pct']}%)")
        print(f"  Different: {func_result['different']}")

        if func_result["different"] > 0:
            print(f"\n  Non-matching functions:")
            diff_funcs = [f for f in func_result["details"] if not f["match"]]
            for fn in diff_funcs[:30]:
                name = fn["demangled"][0] if fn["demangled"] else fn["names"][0]
                print(f"    {name}: size {fn['size1']} vs {fn['size2']}, first diff at +0x{fn['first_diff_offset']:X}")
            if len(diff_funcs) > 30:
                print(f"    ... and {len(diff_funcs) - 30} more")

    if output_json:
        report = {
            "exports": exp_result,
            "sections": section_results,
            "functions": func_result,
        }
        report_path = Path(sys.argv[2]).parent / "comparison_report.json"
        with open(report_path, "w") as f:
            json.dump(report, f, indent=2)
        print(f"\nFull report written to {report_path}")


if __name__ == "__main__":
    main()
