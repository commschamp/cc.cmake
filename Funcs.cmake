function (cc_add_project name)
    string(TOUPPER "${name}" cap_name)
    string(REPLACE "." "_" cap_name "${cap_name}")

    set (source_dir ${OPT_EXTERNALS_DIR}/${name})
    set (source_dir_var "${cap_name}_SOURCE_DIR")
    if (NOT "${${source_dir_var}}" STREQUAL "")
        set (source_dir ${${source_dir_var}})
    endif ()

    set (git_repo_param)
    set (git_repo_var "${cap_name}_GIT_REPOSITORY")
    if ("${${git_repo_var}}" STREQUAL "")
        set (${git_repo_var} "https://github.com/commschamp/${name}.git")
    endif ()

    if (NOT "${${git_repo_var}}" STREQUAL "_")
        set (git_repo_param GIT_REPOSITORY ${${git_repo_var}})
    endif ()

    set (git_tag_param)
    set (git_tag_var "${cap_name}_GIT_TAG")
    if ("${${git_tag_var}}" STREQUAL "")
        set (${git_tag_var} "${${cap_name}_DEFAULT_TAG}")
    endif ()

    if (NOT "${git_repo_param}" STREQUAL "")
        set (git_tag_param GIT_TAG ${${git_tag_var}})
    endif ()

    set (dep_param)
    set (dep_var "${cap_name}_DEPENDS")
    if (NOT "${${dep_var}}" STREQUAL "")
        set (dep_param DEPENDS ${${dep_var}})
    endif ()

    set (exclude_from_all TRUE)
    set (opt_var "OPT_${cap_name}")
    if (${${opt_var}})
        set (exclude_from_all FALSE)
    endif ()

    set (combined_prefix_path ${CMAKE_PREFIX_PATH} ${CMAKE_INSTALL_PREFIX})
    string (REPLACE ";" "|" combined_prefix_path "${combined_prefix_path}")

    ExternalProject_Add(
        ${name}
        SOURCE_DIR ${source_dir}
        BINARY_DIR ${PROJECT_BINARY_DIR}/${name}
        ${git_repo_param}
        ${git_tag_param}
        GIT_PROGRESS TRUE
        CMAKE_GENERATOR ${CMAKE_GENERATOR}
        CMAKE_GENERATOR_PLATFORM ${CMAKE_GENERATOR_PLATFORM}
        CMAKE_GENERATOR_TOOLSET ${CMAKE_GENERATOR_TOOLSET}
        CMAKE_ARGS
            -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER} -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
            -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
            -DCMAKE_PREFIX_PATH=${combined_prefix_path}
            -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
            -DCMAKE_CXX_STANDARD=${CMAKE_CXX_STANDARD}
            ${${cap_name}_DEFAULT_CMAKE_ARGS}
            ${${cap_name}_CMAKE_ARGS}
        LIST_SEPARATOR |
        ${dep_param}
        EXCLUDE_FROM_ALL ${exclude_from_all}
    )

endfunction ()

