include_guard_x()

include_vendor_pkg(vulkan-headers)
add_subdirectory(${CMAKE_SOURCE_DIR}/deps/vulkan-validationlayers ${CMAKE_BINARY_DIR}/vulkan-validationlayers)
