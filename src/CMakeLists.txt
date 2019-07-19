
file(GLOB lessons "${CMAKE_CURRENT_SOURCE_DIR}/*")
foreach(lesson ${lessons})
    if(IS_DIRECTORY ${lesson})
        add_subdirectory(${lesson})
    endif()
endforeach()
