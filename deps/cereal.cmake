include_guard_x()

add_library(cereal INTERFACE)
target_include_directories(cereal SYSTEM INTERFACE ${CMAKE_SOURCE_DIR}/deps/cereal/include)
