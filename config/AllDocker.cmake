macro (enable_if_opt_not_set name)
    if (NOT DEFINED ${name})
        set (${name} ON)
    endif ()
endmacro()

enable_if_opt_not_set (OPT_CC_TOOLS_QT)
enable_if_opt_not_set (OPT_COMMSDSL)
enable_if_opt_not_set (OPT_CC_MQTTSN_LIBS)
enable_if_opt_not_set (OPT_CC_MQTT311_LIBS)
enable_if_opt_not_set (OPT_CC_MQTT5_LIBS)
enable_if_opt_not_set (OPT_CC_MQTT311_PROTOCOL_CC_TOOLS_PLUGIN)
enable_if_opt_not_set (OPT_CC_MQTT5_PROTOCOL_CC_TOOLS_PLUGIN)
enable_if_opt_not_set (OPT_CC_MQTTSN_PROTOCOL_CC_TOOLS_PLUGIN)
enable_if_opt_not_set (OPT_CC_UBLOX_PROTOCOL_CC_TOOLS_PLUGIN)
enable_if_opt_not_set (OPT_CC_MQTT311_CLIENT_FILTER_CC_TOOLS_PLUGIN)
enable_if_opt_not_set (OPT_CC_MQTT5_CLIENT_FILTER_CC_TOOLS_PLUGIN)
enable_if_opt_not_set (OPT_CC_MQTTSN_CLIENT_FILTER_CC_TOOLS_PLUGIN)

list (APPEND COMMSDSL_CMAKE_ARGS
    -DCOMMSDSL_BUILD_COMMSDSL2TEST=ON
    -DCOMMSDSL_BUILD_COMMSDSL2TOOLS_QT=ON
    -DCOMMSDSL_BUILD_COMMSDSL2SWIG=ON
    -DCOMMSDSL_BUILD_COMMSDSL2EMSCRIPTEN=ON
    -DCOMMSDSL_BUILD_COMMSDSL2LATEX=ON
    -DCOMMSDSL_BUILD_COMMSDSL2C=ON
)