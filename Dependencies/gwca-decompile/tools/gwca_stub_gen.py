#!/usr/bin/env python3
"""
Generate skeleton C++ source files from GWCA headers.
Creates compilable stubs for all exported functions.
"""

import re
import sys
from pathlib import Path
from collections import defaultdict

GWCA_DIR = Path(__file__).resolve().parent.parent.parent / "GWCA"
HEADER_DIR = GWCA_DIR / "include" / "GWCA"
OUTPUT_DIR = Path(__file__).resolve().parent.parent / "Source"


# Map header files to source files
HEADER_TO_SOURCE = {
    "GWCA.h": "GWCA.cpp",
    "GWCAVersion.h": "GWCAVersion.cpp",
    "Managers/AgentMgr.h": "AgentMgr.cpp",
    "Managers/CameraMgr.h": "CameraMgr.cpp",
    "Managers/ChatMgr.h": "ChatMgr.cpp",
    "Managers/EffectMgr.h": "EffectMgr.cpp",
    "Managers/EventMgr.h": "EventMgr.cpp",
    "Managers/FriendListMgr.h": "FriendListMgr.cpp",
    "Managers/GameThreadMgr.h": "GameThreadMgr.cpp",
    "Managers/GuildMgr.h": "GuildMgr.cpp",
    "Managers/ItemMgr.h": "ItemMgr.cpp",
    "Managers/MapMgr.h": "MapMgr.cpp",
    "Managers/MemoryMgr.h": "MemoryMgr.cpp",
    "Managers/MerchantMgr.h": "MerchantMgr.cpp",
    "Managers/PartyMgr.h": "PartyMgr.cpp",
    "Managers/PlayerMgr.h": "PlayerMgr.cpp",
    "Managers/QuestMgr.h": "QuestMgr.cpp",
    "Managers/RenderMgr.h": "RenderMgr.cpp",
    "Managers/SkillbarMgr.h": "SkillbarMgr.cpp",
    "Managers/StoCMgr.h": "StoCMgr.cpp",
    "Managers/TradeMgr.h": "TradeMgr.cpp",
    "Managers/UIMgr.h": "UIMgr.cpp",
    "Utilities/Hooker.h": "Hooker.cpp",
    "Utilities/Scanner.h": "Scanner.cpp",
    "Utilities/MemoryPatcher.h": "MemoryPatcher.cpp",
    "Utilities/Debug.h": "Debug.cpp",
    "Utilities/FileScanner.h": "FileScanner.cpp",
}

# Headers that contain GWCA_API declarations that belong to Frame.cpp
FRAME_HEADERS = [
    "Managers/UIMgr.h",  # FramePosition, FrameRelation, WindowPosition methods
]


def parse_gwca_api_declarations(header_path):
    """Parse a header file for GWCA_API function/method declarations."""
    declarations = []
    with open(header_path, "r", encoding="utf-8", errors="replace") as f:
        content = f.read()

    # Find all GWCA_API declarations
    lines = content.split("\n")
    in_extern_c = False
    current_namespace = []
    current_class = None
    brace_depth = 0

    for i, line in enumerate(lines):
        stripped = line.strip()

        # Track extern "C" blocks
        if 'extern "C"' in stripped:
            in_extern_c = True
            continue
        if in_extern_c and stripped == "}":
            in_extern_c = False
            continue

        # Track namespace depth (simplified)
        if stripped.startswith("namespace ") and "{" in stripped:
            ns = stripped.split("namespace ")[1].split("{")[0].strip()
            if ns:
                current_namespace.append(ns)
        elif stripped.startswith("namespace ") and not "{" in stripped:
            ns = stripped.split("namespace ")[1].strip().rstrip("{").strip()
            if ns:
                current_namespace.append(ns)

        # Track class/struct for member functions
        if re.match(r"^\s*(class|struct)\s+(\w+)", stripped) and not stripped.endswith(";"):
            m = re.match(r"^\s*(class|struct)\s+(\w+)", stripped)
            if m:
                current_class = m.group(2)

        if "GWCA_API" in stripped and not stripped.startswith("//") and not stripped.startswith("#"):
            declarations.append({
                "line": i + 1,
                "text": stripped,
                "extern_c": in_extern_c,
                "namespace": list(current_namespace),
                "class": current_class,
            })

    return declarations


def extract_return_type(decl_text):
    """Extract return type from a GWCA_API declaration."""
    # Remove GWCA_API
    text = decl_text.replace("GWCA_API", "").strip()
    # Remove [[nodiscard]]
    text = text.replace("[[nodiscard]]", "").strip()
    # Remove static
    text = text.replace("static ", "").strip()

    # Find the function name (first identifier before '(')
    paren_idx = text.find("(")
    if paren_idx < 0:
        return "void"

    prefix = text[:paren_idx].strip()
    # Split into tokens; last token is function name, rest is return type
    tokens = prefix.split()
    if len(tokens) <= 1:
        return "void"

    ret_type = " ".join(tokens[:-1])
    return ret_type


def get_default_return(ret_type):
    """Get a default return value for a type."""
    rt = ret_type.strip()
    if rt == "void":
        return ""
    if rt == "bool" or rt == "_Bool":
        return "return false;"
    if rt in ("int", "uint32_t", "uint16_t", "uint8_t", "DWORD", "size_t", "unsigned int", "unsigned"):
        return "return 0;"
    if rt == "float":
        return "return 0.0f;"
    if rt == "double":
        return "return 0.0;"
    if rt in ("int32_t",):
        return "return 0;"
    if rt == "uintptr_t":
        return "return 0;"
    if "*" in rt:
        return "return nullptr;"
    # For struct/class return by value
    return "return {};"


def generate_source_file(source_name, headers_for_source, all_decls):
    """Generate a source file from header declarations."""
    lines = []
    lines.append(f"// {source_name}")
    lines.append(f"// Auto-generated stubs - replace with decompiled implementations")
    lines.append("")
    lines.append('#include <GWCA/stdafx.h>')
    lines.append("")

    # Add necessary includes based on source file
    source_base = source_name.replace(".cpp", "")
    includes_added = set()

    for header_rel in headers_for_source:
        inc = f"#include <GWCA/{header_rel}>"
        if inc not in includes_added:
            lines.append(inc)
            includes_added.add(inc)

    # Add common includes based on module type
    if source_base.endswith("Mgr") or source_base in ("GWCA",):
        if "#include <GWCA/Managers/Module.h>" not in includes_added:
            lines.append("#include <GWCA/Managers/Module.h>")
            includes_added.add("#include <GWCA/Managers/Module.h>")

    lines.append("")

    # Collect all declarations grouped by context
    cpp_decls = []
    c_decls = []

    for header_rel in headers_for_source:
        for decl in all_decls.get(header_rel, []):
            if decl["extern_c"]:
                c_decls.append(decl)
            else:
                cpp_decls.append(decl)

    # Write a note about what to implement
    if cpp_decls:
        lines.append(f"// {len(cpp_decls)} C++ exported functions")
        lines.append(f"// {len(c_decls)} extern \"C\" exported functions")
        lines.append("")

    # For manager modules, add Module extern declaration
    module_map = {
        "AgentMgr": "AgentModule",
        "CameraMgr": "CameraModule",
        "ChatMgr": "ChatModule",
        "EffectMgr": "EffectModule",
        "EventMgr": "EventModule",
        "FriendListMgr": "FriendListModule",
        "GameThreadMgr": "GameThreadModule",
        "GuildMgr": "GuildModule",
        "ItemMgr": "ItemModule",
        "MapMgr": "MapModule",
        "MemoryMgr": "MemoryModule",
        "MerchantMgr": "MerchantModule",
        "PartyMgr": "PartyModule",
        "PlayerMgr": "PlayerModule",
        "QuestMgr": "QuestModule",
        "RenderMgr": "RenderModule",
        "SkillbarMgr": "SkillbarModule",
        "StoCMgr": "StoCModule",
        "TradeMgr": "TradeModule",
        "UIMgr": "UIModule",
    }

    if source_base in module_map:
        module_name = module_map[source_base]
        lines.append("namespace {")
        lines.append("    // Static data: pointers found by Scanner during init")
        lines.append("    // TODO: Add static variables discovered during decompilation")
        lines.append("")
        lines.append("    void Init() {")
        lines.append("        // TODO: Scanner::Find calls to locate game functions")
        lines.append("    }")
        lines.append("")
        lines.append("    void Exit() {")
        lines.append("        // TODO: Cleanup")
        lines.append("    }")
        lines.append("")
        lines.append("    void EnableHooks() {")
        lines.append("        // TODO: Hook::CreateHook calls")
        lines.append("    }")
        lines.append("")
        lines.append("    void DisableHooks() {")
        lines.append("        // TODO: Hook::RemoveHook calls")
        lines.append("    }")
        lines.append("}")
        lines.append("")
        lines.append(f"namespace GW {{")
        lines.append(f"    Module {module_name} = {{")
        lines.append(f'        "{source_base}",')
        lines.append(f"        nullptr,")
        lines.append(f"        Init,")
        lines.append(f"        Exit,")
        lines.append(f"        EnableHooks,")
        lines.append(f"        DisableHooks,")
        lines.append(f"    }};")
        lines.append(f"}}")
        lines.append("")

    # Write stub for each C++ declaration
    # (This is a simplified version - actual implementations come from decompilation)
    lines.append("// ============================================================")
    lines.append("// Stub implementations - replace with decompiled code")
    lines.append("// ============================================================")
    lines.append("")

    for decl in cpp_decls:
        text = decl["text"]
        lines.append(f"// TODO: Decompile from binary")
        lines.append(f"// Header line {decl['line']}: {text}")
        lines.append("")

    return "\n".join(lines) + "\n"


def main():
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    # Parse all header files
    all_decls = {}
    total_decls = 0

    for header_rel_str, source_name in HEADER_TO_SOURCE.items():
        header_path = HEADER_DIR / header_rel_str
        if not header_path.exists():
            print(f"WARNING: Header not found: {header_path}")
            continue

        decls = parse_gwca_api_declarations(header_path)
        all_decls[header_rel_str] = decls
        total_decls += len(decls)

    print(f"Parsed {total_decls} GWCA_API declarations from {len(all_decls)} headers")
    print()

    # Group headers by source file
    source_to_headers = defaultdict(list)
    for header_rel, source_name in HEADER_TO_SOURCE.items():
        source_to_headers[source_name].append(header_rel)

    # Generate source files
    for source_name in sorted(source_to_headers.keys()):
        headers = source_to_headers[source_name]
        content = generate_source_file(source_name, headers, all_decls)

        out_path = OUTPUT_DIR / source_name
        with open(out_path, "w") as f:
            f.write(content)

        decl_count = sum(len(all_decls.get(h, [])) for h in headers)
        print(f"  {source_name:30s}  ({decl_count} declarations)")

    # Also generate Frame.cpp stub
    frame_content = """// Frame.cpp
// UI Frame type implementations (ButtonFrame, CheckboxFrame, etc.)
// Auto-generated stubs - replace with decompiled implementations

#include <GWCA/stdafx.h>
#include <GWCA/Managers/UIMgr.h>

// TODO: Decompile Frame type implementations from binary
// These include: FramePosition methods, FrameRelation methods,
// WindowPosition methods, and all Frame subtype factories
// (ButtonFrame, CheckboxFrame, TabsFrame, etc.)
"""
    frame_path = OUTPUT_DIR / "Frame.cpp"
    with open(frame_path, "w") as f:
        f.write(frame_content)
    print(f"  {'Frame.cpp':30s}  (frame types)")

    print()
    print(f"Generated {len(source_to_headers) + 1} source files in {OUTPUT_DIR}")
    print()
    print("Next steps:")
    print("  1. Decompile function bodies using disasm/*.asm as reference")
    print("  2. Replace TODO stubs with actual implementations")
    print("  3. Build on Windows VM and compare against original")


if __name__ == "__main__":
    main()
