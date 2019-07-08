include_guard_x()

add_library(vulkan-headers INTERFACE)
target_include_directories(vulkan-headers SYSTEM INTERFACE ${CMAKE_SOURCE_DIR}/deps/vulkan-headers/include)
