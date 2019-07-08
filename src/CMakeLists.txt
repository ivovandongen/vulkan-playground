include_vendor_pkg(glfw)
include_vendor_pkg(glm)
include_vendor_pkg(vulkan-headers)

add_executable(main main.cpp)

if (APPLE)
    include_vendor_pkg(moltenvk)
    target_link_libraries(main PRIVATE moltenvk)
endif(APPLE)

target_link_libraries(main PRIVATE vulkan-headers glfw glm)
