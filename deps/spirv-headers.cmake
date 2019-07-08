include_guard_x()

set(SPIRV_HEADERS_SOURCE_DIR ${CMAKE_SOURCE_DIR}/deps/spirv-headers)
set(SPIRV_HEADERS_INCLUDE_DIR ${SPIRV_HEADERS_SOURCE_DIR}/include)

add_library(spirv-headers INTERFACE)
target_include_directories(spirv-headers SYSTEM INTERFACE ${SPIRV_HEADERS_INCLUDE_DIR})

mark_as_advanced(SPIRV_HEADERS_SOURCE_DIR)
mark_as_advanced(SPIRV_HEADERS_INCLUDE_DIR)
