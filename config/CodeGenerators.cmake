macro (enable_if_opt_not_set name)
    if (NOT DEFINED ${name})
        set (${name} ON)
    endif ()
endmacro()

enable_if_opt_not_set (OPT_COMMSDSL)

list (APPEND COMMSDSL_CMAKE_ARGS
    -DCOMMSDSL_BUILD_COMMSDSL2TEST=ON
    -DCOMMSDSL_BUILD_COMMSDSL2TOOLS_QT=ON
    -DCOMMSDSL_BUILD_COMMSDSL2SWIG=ON
    -DCOMMSDSL_BUILD_COMMSDSL2EMSCRIPTEN=ON
)