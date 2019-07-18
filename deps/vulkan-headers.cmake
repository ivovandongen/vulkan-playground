include_guard_x()

add_subdirectory(${CMAKE_SOURCE_DIR}/deps/vulkan-headers ${CMAKE_BINARY_DIR}/vulkan-headers)
add_library(vulkan-headers ALIAS Vulkan-Headers)

set(VULKAN_HEADERS_INSTALL_DIR "${CMAKE_SOURCE_DIR}/deps/vulkan-headers")
set($ENV{VULKAN_HEADERS_INSTALL_DIR} "${CMAKE_SOURCE_DIR}/deps/vulkan-headers")
mark_as_advanced(VULKAN_HEADERS_INSTALL_DIR $ENV{VULKAN_HEADERS_INSTALL_DIR})
