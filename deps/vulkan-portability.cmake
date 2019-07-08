include_guard_x()

add_library(vulkan-portability INTERFACE)
configure_file(${CMAKE_SOURCE_DIR}/deps/vulkan-portability/include/vulkan/vk_extx_portability_subset.h ${CMAKE_BINARY_DIR}/vulkan-portability/include/vulkan-portability/vk_extx_portability_subset.h COPYONLY)
target_include_directories(vulkan-portability SYSTEM INTERFACE ${CMAKE_BINARY_DIR}/vulkan-portability/include)
