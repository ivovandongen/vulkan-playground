include_vendor_pkg(glfw)
include_vendor_pkg(glm)
include_vendor_pkg(vulkan-loader)
include_vendor_pkg(vulkan-headers)
include_vendor_pkg(glslang)

# Get executable name
get_filename_component(EXECUTABLE ${CMAKE_CURRENT_SOURCE_DIR} NAME)

add_executable(${EXECUTABLE} main.cpp)

target_link_libraries(${EXECUTABLE} PRIVATE glfw glm)

if (APPLE)
    include_vendor_pkg(vulkan-validationlayers)
    get_target_property(VK_ICD_FILENAMES moltenvk VK_ICD_FILENAMES)
    get_target_property(VK_LAYER_PATH vulkan-validationlayers VK_LAYER_PATH)
    target_compile_definitions(${EXECUTABLE} PRIVATE VK_ICD_FILENAMES=\"${VK_ICD_FILENAMES}\")
    target_compile_definitions(${EXECUTABLE} PRIVATE VK_LAYER_PATH=\"${VK_LAYER_PATH}\")
endif (APPLE)

# Compile shaders

function (compile_shader INPUT OUTPUT)
    add_custom_command(
            OUTPUT ${OUTPUT}
            COMMAND "${CMAKE_BINARY_DIR}/glslang/StandAlone/glslangValidator" "-V" "${INPUT}" "-o" "${OUTPUT}"
            WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
            DEPENDS ${INPUT}
            COMMENT "Compiling shader ${INPUT}"
            VERBATIM
            )

    file(RELATIVE_PATH TARGET ${PROJECT_SOURCE_DIR} ${INPUT})
    string(REPLACE "/" "_" TARGET ${TARGET})
    add_custom_target(compile-${TARGET} DEPENDS ${OUTPUT})
    add_dependencies(compile-${TARGET} glslangValidator)
    add_dependencies(${EXECUTABLE} compile-${TARGET} )
endfunction(compile_shader)

file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/resources)
compile_shader(${CMAKE_CURRENT_LIST_DIR}/resources/shader.vert.glsl ${CMAKE_CURRENT_BINARY_DIR}/resources/vert.spv)
compile_shader(${CMAKE_CURRENT_LIST_DIR}/resources/shader.frag.glsl ${CMAKE_CURRENT_BINARY_DIR}/resources/frag.spv)
