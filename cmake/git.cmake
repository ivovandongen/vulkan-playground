
macro(GIT_RESOLVE_EXECUTABLE)
    if (NOT GIT_FOUND)

        message(STATUS "GIT: Trying to locate git executable")

        # First try preferred GIT
        if (GIT_EXECUTABLE)
            if (EXISTS ${GIT_EXECUTABLE})
                set(GIT_FOUND TRUE)
            else ()
                message(STATUS "GIT: Could not find git at specified location: ${GIT_EXECUTABLE}")
                unset(GIT_EXECUTABLE CACHE)
                set(GIT_FOUND FALSE)
            endif ()
        endif ()

        # Try with find_package
        if (NOT GIT_FOUND)
            unset(GIT_EXECUTABLE CACHE)
            message(STATUS "GIT: Trying to locate with find_package")
            find_package(Git QUIET)
        endif ()

        # Try with find_program
        if (NOT GIT_FOUND)
            unset(GIT_EXECUTABLE CACHE)
            message(STATUS "GIT: Trying to locate with find_program")
            find_program(GIT_EXECUTABLE git)
            if (EXISTS ${GIT_EXECUTABLE})
                set(GIT_FOUND TRUE)
            endif ()
        endif ()


        # Try some alternate paths for macos installs
        if (NOT GIT_FOUND)
            unset(GIT_EXECUTABLE CACHE)
            message(STATUS "GIT: git not found. Trying alternatives")
            if (EXISTS "/usr/local/bin/git")
                set(GIT_EXECUTABLE "/usr/local/bin/git")
                set(GIT_FOUND TRUE)
            elseif (EXISTS "/usr/bin/git")
                set(GIT_EXECUTABLE "/usr/bin/git")
                set(GIT_FOUND TRUE)
            else ()
                message(STATUS "GIT: No alternative path could be found for git")
            endif ()
        endif ()

    endif ()

endmacro(GIT_RESOLVE_EXECUTABLE)

macro(GIT_UPDATE MODULE_NAME)

    git_resolve_executable()

    if (NOT GIT_FOUND)
        message(FATAL_ERROR "GIT: Could not find git
        Try setting the path to the executable with -DGIT_EXECUTABLE=/path/to/git.
        ")
    endif()

    # Check if this is a git submodule
    execute_process(COMMAND ${GIT_EXECUTABLE} submodule status ${CMAKE_SOURCE_DIR}/deps/${MODULE_NAME}
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
            RESULT_VARIABLE GIT_STATUS_RESULT)

    if (${GIT_STATUS_RESULT} STREQUAL "0")
        message(STATUS "GIT: Using git from ${GIT_EXECUTABLE}")
        message(STATUS "GIT: Submodule update ${MODULE_NAME}")
        execute_process(COMMAND ${GIT_EXECUTABLE} submodule update --init --recursive ${CMAKE_SOURCE_DIR}/deps/${MODULE_NAME}
                WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                RESULT_VARIABLE GIT_SUBMOD_RESULT)
        if (NOT GIT_SUBMOD_RESULT EQUAL "0")
            message(FATAL_ERROR "GIT: git submodule update --init --recursive ${CMAKE_SOURCE_DIR}/deps/${MODULE_NAME} failed with ${GIT_SUBMOD_RESULT}, please checkout submodules")
        endif ()
    else()
        message(STATUS "GIT: Not a git module ${MODULE_NAME}")
    endif ()

endmacro(GIT_UPDATE)