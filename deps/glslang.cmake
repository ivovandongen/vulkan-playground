include_guard_x()

# set the correct spirv-headers dir
include_vendor_pkg(spirv-headers)
set(SPIRV-Headers_SOURCE_DIR ${SPIRV_HEADERS_SOURCE_DIR})

# No need to test
set(BUILD_TESTING OFF)

include_vendor_pkg(spirv-tools)

add_subdirectory(${CMAKE_SOURCE_DIR}/deps/glslang ${CMAKE_BINARY_DIR}/glslang)

# install files in non-standard location for moltenVK
file(GLOB files RELATIVE ${CMAKE_SOURCE_DIR}/deps/glslang/glslang "${CMAKE_SOURCE_DIR}/deps/glslang/glslang/**/*.h")
foreach (file ${files})
    configure_file(${CMAKE_SOURCE_DIR}/deps/glslang/glslang/${file} ${CMAKE_BINARY_DIR}/glslang/include/glslang/${file} COPYONLY)
endforeach ()

file(GLOB spirv_files RELATIVE ${CMAKE_SOURCE_DIR}/deps/glslang "${CMAKE_SOURCE_DIR}/deps/glslang/SPIRV/*.h")
foreach (file ${spirv_files})
    configure_file(${CMAKE_SOURCE_DIR}/deps/glslang/${file} ${CMAKE_BINARY_DIR}/glslang/include/glslang/${file} COPYONLY)
endforeach ()

target_include_directories(glslang PUBLIC ${CMAKE_BINARY_DIR}/glslang/include)
