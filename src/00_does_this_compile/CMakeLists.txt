include_vendor_pkg(glfw)
include_vendor_pkg(glm)
include_vendor_pkg(vulkan-headers)
include_vendor_pkg(vulkan-loader)

# Get executable name
get_filename_component(EXECUTABLE ${CMAKE_CURRENT_SOURCE_DIR} NAME)

add_executable(${EXECUTABLE} main.cpp)

target_link_libraries(${EXECUTABLE} PRIVATE Vulkan::Vulkan Vulkan::Headers glfw glm)
