include_vendor_pkg(googletest)

add_executable(test ${CMAKE_CURRENT_LIST_DIR}/common/main.cpp)
target_link_libraries(test googletest)
