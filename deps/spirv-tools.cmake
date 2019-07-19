include_guard_x()

# set the correct spirv-headers dir
include_vendor_pkg(spirv-headers)
set(SPIRV-Headers_SOURCE_DIR ${SPIRV_HEADERS_SOURCE_DIR})

# Install headers
set(ENABLE_SPIRV_TOOLS_INSTALL ON)

add_subdirectory(${CMAKE_SOURCE_DIR}/deps/spirv-tools ${CMAKE_BINARY_DIR}/spirv-tools)

add_library(spirv-tools ALIAS SPIRV-Tools)