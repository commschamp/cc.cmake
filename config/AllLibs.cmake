macro (enalbe_if_opt_not_set name)
    if (NOT DEFINED ${name})
        set (${name} ON)
    endif ()
endmacro()

enalbe_if_opt_not_set (OPT_CC_MQTTSN_LIBS)
enalbe_if_opt_not_set (OPT_CC_MQTT311_LIBS)
enalbe_if_opt_not_set (OPT_CC_MQTT5_LIBS)
