include_guard_x()

include_vendor_pkg(vulkan-headers)
include_vendor_pkg(vulkan-portability)
include_vendor_pkg(spirv-cross)
include_vendor_pkg(spirv-tools)
include_vendor_pkg(cereal)
include_vendor_pkg(glslang)

set(COMMON_SRC_DIR ${CMAKE_SOURCE_DIR}/deps/moltenvk/Common)
set(MAIN_SRC_DIR ${CMAKE_SOURCE_DIR}/deps/moltenvk/MoltenVK/MoltenVK)
set(SHADER_CVTR_SRC_DIR ${CMAKE_SOURCE_DIR}/deps/moltenvk/MoltenVKShaderConverter)

file(GLOB_RECURSE HEADER_FILES
        "${COMMON_SRC_DIR}/*.h"
        "${MAIN_SRC_DIR}/*.h")

file(GLOB_RECURSE SRC_FILES
        "${COMMON_SRC_DIR}/*.mm"
        "${MAIN_SRC_DIR}/*.mm"
        "${MAIN_SRC_DIR}/*.m"
        "${MAIN_SRC_DIR}/*.cpp")


file(GLOB_RECURSE DEF_FILES
        "${SRC_DIR}/src/*.def")


file(GLOB_RECURSE SHADER_CVTR_SRC_FILES
        "${SHADER_CVTR_SRC_DIR}/*.mm"
        "${SHADER_CVTR_SRC_DIR}/*.m"
        "${SHADER_CVTR_SRC_DIR}/*.cpp")

add_library(moltenvk STATIC

        ${DEF_FILES}
        ${HEADER_FILES}
        ${SRC_FILES}
        ${SHADER_CVTR_SRC_FILES}
        )

target_include_directories(moltenvk
        PUBLIC ${CMAKE_SOURCE_DIR}/deps/moltenvk/MoltenVK/include
        PRIVATE
        ${MAIN_SRC_DIR}/API
        ${MAIN_SRC_DIR}/Commands
        ${MAIN_SRC_DIR}/GPUObjects
        ${MAIN_SRC_DIR}/Layers
        ${MAIN_SRC_DIR}/OS
        ${MAIN_SRC_DIR}/Utility
        ${MAIN_SRC_DIR}/Vulkan
        ${COMMON_SRC_DIR}
        ${SHADER_CVTR_SRC_DIR}
        ${SHADER_CVTR_SRC_DIR}/Common
        ${SHADER_CVTR_SRC_DIR}/MoltenVKSPIRVToMSLConverter
        ${SHADER_CVTR_SRC_DIR}/MoltenVKGLSLToSPIRVConverter
        ${SHADER_CVTR_SRC_DIR}/MoltenVKShaderConverterTool
        )

target_link_libraries(moltenvk PRIVATE vulkan-headers vulkan-portability spirv-cross spirv-tools SPIRV cereal glslang)
target_link_libraries(moltenvk INTERFACE "-framework AppKit -framework Metal -framework MetalKit -framework ModelIO -framework IOSurface -framework QuartzCore -framework CoreFoundation")
