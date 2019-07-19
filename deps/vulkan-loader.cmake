include_guard_x()

include_vendor_pkg(vulkan-headers)
set(VulkanHeaders_INCLUDE_DIRS ${CMAKE_SOURCE_DIR}/deps/vulkan-headers/include)
add_subdirectory(${CMAKE_SOURCE_DIR}/deps/vulkan-loader ${CMAKE_BINARY_DIR}/vulkan-loader)
add_library(vulkan-loader ALIAS vulkan)

if (APPLE)
    include_vendor_pkg(moltenvk)
    include_vendor_pkg(vulkan-validationlayers)
    add_dependencies(vulkan moltenvk vulkan-validationlayers)
endif(APPLE)
