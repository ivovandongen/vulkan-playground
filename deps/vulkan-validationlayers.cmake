include_guard_x()

# Work around broken find_package
find_package(Python3 COMPONENTS Interpreter)
set(PYTHON_EXECUTABLE ${Python3_EXECUTABLE})

include_vendor_pkg(vulkan-headers)
add_subdirectory(${CMAKE_SOURCE_DIR}/deps/vulkan-validationlayers ${CMAKE_BINARY_DIR}/vulkan-validationlayers)
