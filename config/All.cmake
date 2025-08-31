macro (enable_if_opt_not_set name)
    if (NOT DEFINED ${name})
        set (${name} ON)
    endif ()
endmacro()

enable_if_opt_not_set (OPT_COMMS)
enable_if_opt_not_set (OPT_CC_TOOLS_QT)
enable_if_opt_not_set (OPT_COMMSDSL)
enable_if_opt_not_set (OPT_CC_DEMO1_GENERATED)
enable_if_opt_not_set (OPT_CC_DEMO2_GENERATED)
enable_if_opt_not_set (OPT_CC_DEMO3_GENERATED)
enable_if_opt_not_set (OPT_CC_MQTT311_GENERATED)
enable_if_opt_not_set (OPT_CC_MQTT5_GENERATED)
enable_if_opt_not_set (OPT_CC_MQTTSN_GENERATED)
enable_if_opt_not_set (OPT_CC_UBLOX_GENERATED)
enable_if_opt_not_set (OPT_CC_X509_GENERATED)
enable_if_opt_not_set (OPT_CC_MQTTSN_LIBS)
enable_if_opt_not_set (OPT_CC_MQTT311_LIBS)
enable_if_opt_not_set (OPT_CC_MQTT5_LIBS)
enable_if_opt_not_set (OPT_CC_DEMO1_PROTOCOL_CC_TOOLS_PLUGIN)
enable_if_opt_not_set (OPT_CC_DEMO2_PROTOCOL_CC_TOOLS_PLUGIN)
enable_if_opt_not_set (OPT_CC_DEMO3_PROTOCOL_CC_TOOLS_PLUGIN)
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
)