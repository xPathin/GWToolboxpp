cmake_minimum_required(VERSION 3.29)
project(gwca VERSION 3.2.1.1 LANGUAGES CXX)

# Require 32-bit build
if(NOT CMAKE_SIZEOF_VOID_P EQUAL 4)
    message(FATAL_ERROR "GWCA must be built as 32-bit (x86)")
endif()

find_package(minhook CONFIG REQUIRED)

# Collect all source files
file(GLOB GWCA_SOURCES CONFIGURE_DEPENDS "Source/*.cpp")

add_library(gwca SHARED ${GWCA_SOURCES})

# Include the original GWCA headers
set(GWCA_INCLUDE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../GWCA/include")
target_include_directories(gwca PUBLIC "${GWCA_INCLUDE_DIR}")

target_link_libraries(gwca PRIVATE minhook::minhook)

# Build exports
target_compile_definitions(gwca PRIVATE
    GWCA_BUILD_EXPORTS
    _CRT_SECURE_NO_WARNINGS
    NOMINMAX
    WIN32_LEAN_AND_MEAN
)

# Precompiled header (use GWCA's stdafx.h)
target_precompile_headers(gwca PRIVATE "${GWCA_INCLUDE_DIR}/GWCA/stdafx.h")

# C++ standard
target_compile_features(gwca PUBLIC cxx_std_23)

# MSVC-specific flags matching original binary
if(MSVC)
    target_compile_options(gwca PRIVATE
        /W4             # Warning level 4
        /permissive-    # Standard conformance
        /utf-8          # Source/execution charset
        /O2             # Optimize for speed
        /Ob2            # Inline expansion (compiler decides)
        /Gy             # Function-level linking
        /GS             # Buffer security checks
        /EHsc           # C++ exceptions
        /Zc:inline      # Remove unreferenced COMDAT
        /Gd             # __cdecl calling convention (default)
    )

    # Linker flags matching original binary
    target_link_options(gwca PRIVATE
        /SAFESEH:NO
        /INCREMENTAL:NO
        /OPT:REF
        /OPT:ICF
        /BASE:0x10000000
        /DYNAMICBASE
        /NXCOMPAT
        /SUBSYSTEM:CONSOLE,6.00
    )

    # Static CRT
    set_target_properties(gwca PROPERTIES
        MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>"
    )
endif()

# Output to bin/ for easy comparison
set_target_properties(gwca PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/bin"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/bin"
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/lib"
)
