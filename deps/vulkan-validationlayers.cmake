include_guard_x()

include_vendor_pkg(vulkan-headers)
add_subdirectory(${CMAKE_SOURCE_DIR}/deps/vulkan-validationlayers ${CMAKE_BINARY_DIR}/vulkan-validationlayers)

add_custom_target(vulkan-validationlayers)
add_dependencies(vulkan-validationlayers
        VkLayer_khronos_validation
        VkLayer_khronos_validation-json
        VkLayer_core_validation
        VkLayer_core_validation-json
        VkLayer_object_lifetimes
        VkLayer_object_lifetimes-json
        VkLayer_unique_objects
        VkLayer_unique_objects-json
        VkLayer_stateless_validation
        VkLayer_stateless_validation-json
        VkLayer_thread_safety
        VkLayer_thread_safety-json)

set_target_properties(vulkan-validationlayers PROPERTIES VK_LAYER_PATH ${CMAKE_BINARY_DIR}/vulkan-validationlayers/layers)