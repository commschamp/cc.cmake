macro (enable_if_opt_not_set name)
    if (NOT DEFINED ${name})
        set (${name} ON)
    endif ()
endmacro()

enable_if_opt_not_set (OPT_CC_MQTTSN_LIBS)
enable_if_opt_not_set (OPT_CC_MQTT311_LIBS)
enable_if_opt_not_set (OPT_CC_MQTT5_LIBS)

list (APPEND CC_MQTT311_LIBS_CMAKE_ARGS -DCC_MQTT311_CLIENT_APPS=ON)
list (APPEND CC_MQTT5_LIBS_CMAKE_ARGS -DCC_MQTT5_CLIENT_APPS=ON)
list (APPEND CC_MQTTSN_LIBS_CMAKE_ARGS -DCC_MQTTSN_CLIENT_APPS=ON -DCC_MQTTSN_GATEWAY_APPS=ON)