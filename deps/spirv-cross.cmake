include_guard_x()

set(CORE_SRC_DIR ${CMAKE_SOURCE_DIR}/deps/spirv-cross)

set(spirv-cross-core-sources
        ${CORE_SRC_DIR}/GLSL.std.450.h
        ${CORE_SRC_DIR}/spirv_common.hpp
        ${CORE_SRC_DIR}/spirv_cross_containers.hpp
        ${CORE_SRC_DIR}/spirv_cross_error_handling.hpp
        ${CORE_SRC_DIR}/spirv.hpp
        ${CORE_SRC_DIR}/spirv_cross.hpp
        ${CORE_SRC_DIR}/spirv_cross.cpp
        ${CORE_SRC_DIR}/spirv_parser.hpp
        ${CORE_SRC_DIR}/spirv_parser.cpp
        ${CORE_SRC_DIR}/spirv_cross_parsed_ir.hpp
        ${CORE_SRC_DIR}/spirv_cross_parsed_ir.cpp
        ${CORE_SRC_DIR}/spirv_cfg.hpp
        ${CORE_SRC_DIR}/spirv_cfg.cpp)

set(spirv-cross-glsl-sources
        ${CORE_SRC_DIR}/spirv_glsl.cpp
        ${CORE_SRC_DIR}/spirv_glsl.hpp)

set(spirv-cross-cpp-sources
        ${CORE_SRC_DIR}/spirv_cpp.cpp
        ${CORE_SRC_DIR}/spirv_cpp.hpp)

set(spirv-cross-msl-sources
        ${CORE_SRC_DIR}/spirv_msl.cpp
        ${CORE_SRC_DIR}/spirv_msl.hpp)

set(spirv-cross-hlsl-sources
        ${CORE_SRC_DIR}/spirv_hlsl.cpp
        ${CORE_SRC_DIR}/spirv_hlsl.hpp)

set(spirv-cross-reflect-sources
        ${CORE_SRC_DIR}/spirv_reflect.cpp
        ${CORE_SRC_DIR}/spirv_reflect.hpp)

set(spirv-cross-util-sources
        ${CORE_SRC_DIR}/spirv_cross_util.cpp
        ${CORE_SRC_DIR}/spirv_cross_util.hpp)

add_library(spirv-cross STATIC
        ${spirv-cross-core-sources}
        ${spirv-cross-glsl-sources}
        ${spirv-cross-cpp-sources}
        ${spirv-cross-msl-sources}
        ${spirv-cross-hlsl-sources}
        ${spirv-cross-reflect-sources}
        ${spirv-cross-util-sources}
        )


file(GLOB files RELATIVE ${CMAKE_SOURCE_DIR}/deps/spirv-cross/ "${CMAKE_SOURCE_DIR}/deps/spirv-cross/*.hpp")
foreach (file ${files})
    configure_file(${CMAKE_SOURCE_DIR}/deps/spirv-cross/${file} ${CMAKE_BINARY_DIR}/spirv-cross/include/SPIRV-Cross/${file} COPYONLY)
endforeach ()

file(WRITE ${CMAKE_BINARY_DIR}/spirv-cross/include/SPIRV-Cross/mvkSpirvCrossRevisionDerived.h
        "static const char* spirvCrossRevisionString = \"0\";"
        )

target_include_directories(spirv-cross PUBLIC ${CMAKE_BINARY_DIR}/spirv-cross/include ${CORE_SRC_DIR})
