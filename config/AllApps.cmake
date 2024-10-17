macro (enable_if_opt_not_set name)
    if (NOT DEFINED ${name})
        set (${name} ON)
    endif ()
endmacro()

enable_if_opt_not_set (OPT_CC_MQTTSN_LIBS)
enable_if_opt_not_set (OPT_CC_MQTT311_LIBS)
enable_if_opt_not_set (OPT_CC_MQTT5_LIBS)
