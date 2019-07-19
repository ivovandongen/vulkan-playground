include_vendor_pkg(glfw)
include_vendor_pkg(glm)
include_vendor_pkg(vulkan-loader)
include_vendor_pkg(vulkan-headers)
include_vendor_pkg(vulkan-validationlayers)

# Get executable name
get_filename_component(EXECUTABLE ${CMAKE_CURRENT_SOURCE_DIR} NAME)

add_executable(${EXECUTABLE} main.cpp)

target_link_libraries(${EXECUTABLE} PRIVATE Vulkan::Vulkan Vulkan::Headers glfw glm VkLayer_core_validation)

if (APPLE)
    get_target_property(VK_ICD_FILENAMES moltenvk VK_ICD_FILENAMES)
    get_target_property(VK_LAYER_PATH vulkan-validationlayers VK_LAYER_PATH)
    target_compile_definitions(${EXECUTABLE} PRIVATE VK_ICD_FILENAMES=\"${VK_ICD_FILENAMES}\")
    target_compile_definitions(${EXECUTABLE} PRIVATE VK_LAYER_PATH=\"${VK_LAYER_PATH}\")
endif (APPLE)