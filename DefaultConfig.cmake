# Default versions
set (COMMS_DEFAULT_TAG "v5.3")
set (CC_TOOLS_QT_DEFAULT_TAG "v6.0")
set (COMMSDSL_DEFAULT_TAG "v7.0.2")
set (CC_DEMO1_GENERATED_DEFAULT_TAG "v3.0.1")
set (CC_DEMO2_GENERATED_DEFAULT_TAG "v3.0.1")
set (CC_DEMO3_GENERATED_DEFAULT_TAG "v3.0.1")
set (CC_MQTT311_GENERATED_DEFAULT_TAG "v3.0.1")
set (CC_MQTT5_GENERATED_DEFAULT_TAG "v3.0.1")
set (CC_MQTTSN_GENERATED_DEFAULT_TAG "v3.0.1")
set (CC_UBLOX_GENERATED_DEFAULT_TAG "v3.0.1")
set (CC_X509_GENERATED_DEFAULT_TAG "v1.1.1")
set (CC_MQTTSN_LIBS_DEFAULT_TAG "v2.0.8")
set (CC_MQTT311_LIBS_DEFAULT_TAG "v1.0.4")
set (CC_MQTT5_LIBS_DEFAULT_TAG "v1.0.4")
set (CC_DEMO1_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_TAG "${CC_DEMO1_GENERATED_DEFAULT_TAG}")
set (CC_DEMO2_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_TAG "${CC_DEMO2_GENERATED_DEFAULT_TAG}")
set (CC_DEMO3_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_TAG "${CC_DEMO3_GENERATED_DEFAULT_TAG}")
set (CC_MQTT311_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_TAG "${CC_MQTT311_GENERATED_DEFAULT_TAG}")
set (CC_MQTT5_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_TAG "${CC_MQTT5_GENERATED_DEFAULT_TAG}")
set (CC_MQTTSN_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_TAG "${CC_MQTTSN_GENERATED_DEFAULT_TAG}")
set (CC_UBLOX_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_TAG "${CC_UBLOX_GENERATED_DEFAULT_TAG}")
set (CC_MQTT311_CLIENT_FILTER_CC_TOOLS_PLUGIN_DEFAULT_TAG "v1.0.1")
set (CC_MQTT5_CLIENT_FILTER_CC_TOOLS_PLUGIN_DEFAULT_TAG "v1.0.1")
set (CC_MQTTSN_CLIENT_FILTER_CC_TOOLS_PLUGIN_DEFAULT_TAG "v1.0.1")
set (QT_MAJOR_DEFAULT_VERSION 5)

########################################################################

# Dependencies
list (APPEND CC_TOOLS_QT_DEPENDS comms)
list (APPEND CC_DEMO1_GENERATED_DEPENDS comms)
list (APPEND CC_DEMO2_GENERATED_DEPENDS comms)
list (APPEND CC_DEMO3_GENERATED_DEPENDS comms)
list (APPEND CC_MQTT311_GENERATED_DEPENDS comms)
list (APPEND CC_MQTT5_GENERATED_DEPENDS comms)
list (APPEND CC_MQTTSN_GENERATED_DEPENDS comms)
list (APPEND CC_UBLOX_GENERATED_DEPENDS comms)
list (APPEND CC_X509_GENERATED_DEPENDS comms)
list (APPEND CC_MQTTSN_LIBS_DEPENDS cc.mqttsn.generated cc.mqtt311.generated comms)
list (APPEND CC_MQTT311_LIBS_DEPENDS cc.mqtt311.generated comms)
list (APPEND CC_MQTT5_LIBS_DEPENDS cc.mqtt5.generated comms)
list (APPEND CC_DEMO1_PROTOCOL_CC_TOOLS_PLUGIN_DEPENDS cc.demo1.generated cc_tools_qt)
list (APPEND CC_DEMO2_PROTOCOL_CC_TOOLS_PLUGIN_DEPENDS cc.demo2.generated cc_tools_qt)
list (APPEND CC_DEMO3_PROTOCOL_CC_TOOLS_PLUGIN_DEPENDS cc.demo3.generated cc_tools_qt)
list (APPEND CC_MQTT311_PROTOCOL_CC_TOOLS_PLUGIN_DEPENDS cc.mqtt311.generated cc_tools_qt)
list (APPEND CC_MQTT5_PROTOCOL_CC_TOOLS_PLUGIN_DEPENDS cc.mqtt5.generated cc_tools_qt)
list (APPEND CC_MQTTSN_PROTOCOL_CC_TOOLS_PLUGIN_DEPENDS cc.mqttsn.generated cc_tools_qt)
list (APPEND CC_UBLOX_PROTOCOL_CC_TOOLS_PLUGIN_DEPENDS cc.ublox.generated cc_tools_qt)
list (APPEND CC_MQTT311_CLIENT_FILTER_CC_TOOLS_PLUGIN_DEPENDS cc.mqtt311.libs cc_tools_qt)
list (APPEND CC_MQTT5_CLIENT_FILTER_CC_TOOLS_PLUGIN_DEPENDS cc.mqtt5.libs cc_tools_qt)
list (APPEND CC_MQTTSN_CLIENT_FILTER_CC_TOOLS_PLUGIN_DEPENDS cc.mqttsn.libs cc_tools_qt)

########################################################################

# ccache flags
list (APPEND CC_TOOLS_QT_DEFAULT_CMAKE_ARGS -DCC_TOOLS_QT_USE_CCACHE=${OPT_USE_CCACHE} -DCC_TOOLS_QT_CCACHE_EXECUTABLE=${OPT_CCACHE_EXECUTABLE})
list (APPEND CC_MQTT311_LIBS_DEFAULT_CMAKE_ARGS -DCC_MQTT311_USE_CCACHE=${OPT_USE_CCACHE} -DCC_MQTT311_CCACHE_EXECUTABLE=${OPT_CCACHE_EXECUTABLE})
list (APPEND CC_MQTT5_LIBS_DEFAULT_CMAKE_ARGS -DCC_MQTT5_USE_CCACHE=${OPT_USE_CCACHE} -DCC_MQTT5_CCACHE_EXECUTABLE=${OPT_CCACHE_EXECUTABLE})
list (APPEND CC_MQTTSN_LIBS_DEFAULT_CMAKE_ARGS -DCC_MQTTSN_USE_CCACHE=${OPT_USE_CCACHE} -DCC_MQTTSN_CCACHE_EXECUTABLE=${OPT_CCACHE_EXECUTABLE})
list (APPEND CC_DEMO1_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_USE_CCACHE=${OPT_USE_CCACHE} -DOPT_CCACHE_EXECUTABLE=${OPT_CCACHE_EXECUTABLE})
list (APPEND CC_DEMO2_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_USE_CCACHE=${OPT_USE_CCACHE} -DOPT_CCACHE_EXECUTABLE=${OPT_CCACHE_EXECUTABLE})
list (APPEND CC_DEMO3_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_USE_CCACHE=${OPT_USE_CCACHE} -DOPT_CCACHE_EXECUTABLE=${OPT_CCACHE_EXECUTABLE})
list (APPEND CC_MQTT311_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_USE_CCACHE=${OPT_USE_CCACHE} -DOPT_CCACHE_EXECUTABLE=${OPT_CCACHE_EXECUTABLE})
list (APPEND CC_MQTT5_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_USE_CCACHE=${OPT_USE_CCACHE} -DOPT_CCACHE_EXECUTABLE=${OPT_CCACHE_EXECUTABLE})
list (APPEND CC_MQTTSN_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_USE_CCACHE=${OPT_USE_CCACHE} -DOPT_CCACHE_EXECUTABLE=${OPT_CCACHE_EXECUTABLE})
list (APPEND CC_UBLOX_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_USE_CCACHE=${OPT_USE_CCACHE} -DOPT_CCACHE_EXECUTABLE=${OPT_CCACHE_EXECUTABLE})
list (APPEND CC_MQTT311_CLIENT_FILTER_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_USE_CCACHE=${OPT_USE_CCACHE} -DOPT_CCACHE_EXECUTABLE=${OPT_CCACHE_EXECUTABLE})
list (APPEND CC_MQTT5_CLIENT_FILTER_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_USE_CCACHE=${OPT_USE_CCACHE} -DOPT_CCACHE_EXECUTABLE=${OPT_CCACHE_EXECUTABLE})
list (APPEND CC_MQTTSN_CLIENT_FILTER_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_USE_CCACHE=${OPT_USE_CCACHE} -DOPT_CCACHE_EXECUTABLE=${OPT_CCACHE_EXECUTABLE})

########################################################################

# Sanitizers flags
list (APPEND CC_TOOLS_QT_DEFAULT_CMAKE_ARGS -DCC_TOOLS_QT_WITH_DEFAULT_SANITIZERS=${OPT_WITH_DEFAULT_SANITIZERS})
list (APPEND CC_MQTT311_LIBS_DEFAULT_CMAKE_ARGS -DCC_MQTT311_WITH_DEFAULT_SANITIZERS=${OPT_WITH_DEFAULT_SANITIZERS})
list (APPEND CC_MQTT5_LIBS_DEFAULT_CMAKE_ARGS -DCC_MQTT5_WITH_DEFAULT_SANITIZERS=${OPT_WITH_DEFAULT_SANITIZERS})
list (APPEND CC_MQTTSN_LIBS_DEFAULT_CMAKE_ARGS -DCC_MQTTSN_WITH_DEFAULT_SANITIZERS=${OPT_WITH_DEFAULT_SANITIZERS})
list (APPEND CC_DEMO1_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_WITH_DEFAULT_SANITIZERS=${OPT_WITH_DEFAULT_SANITIZERS})
list (APPEND CC_DEMO2_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_WITH_DEFAULT_SANITIZERS=${OPT_WITH_DEFAULT_SANITIZERS})
list (APPEND CC_DEMO3_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_WITH_DEFAULT_SANITIZERS=${OPT_WITH_DEFAULT_SANITIZERS})
list (APPEND CC_MQTT311_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_WITH_DEFAULT_SANITIZERS=${OPT_WITH_DEFAULT_SANITIZERS})
list (APPEND CC_MQTT5_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_WITH_DEFAULT_SANITIZERS=${OPT_WITH_DEFAULT_SANITIZERS})
list (APPEND CC_MQTTSN_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_WITH_DEFAULT_SANITIZERS=${OPT_WITH_DEFAULT_SANITIZERS})
list (APPEND CC_UBLOX_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_WITH_DEFAULT_SANITIZERS=${OPT_WITH_DEFAULT_SANITIZERS})
list (APPEND CC_MQTT311_CLIENT_FILTER_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_WITH_DEFAULT_SANITIZERS=${OPT_WITH_DEFAULT_SANITIZERS})
list (APPEND CC_MQTT5_CLIENT_FILTER_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_WITH_DEFAULT_SANITIZERS=${OPT_WITH_DEFAULT_SANITIZERS})
list (APPEND CC_MQTTSN_CLIENT_FILTER_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_WITH_DEFAULT_SANITIZERS=${OPT_WITH_DEFAULT_SANITIZERS})

########################################################################

# Shared libs flags
list (APPEND CC_MQTT311_LIBS_DEFAULT_CMAKE_ARGS -DBUILD_SHARED_LIBS=${BUILD_SHARED_LIBS})
list (APPEND CC_MQTT5_LIBS_DEFAULT_CMAKE_ARGS -DBUILD_SHARED_LIBS=${BUILD_SHARED_LIBS})
list (APPEND CC_MQTTSN_LIBS_DEFAULT_CMAKE_ARGS -DBUILD_SHARED_LIBS=${BUILD_SHARED_LIBS})

########################################################################

# Extra flags
if (OPT_CC_MQTT311_CLIENT_FILTER_CC_TOOLS_PLUGIN)
    # cc.mqtt311.libs requires PIC compilation when linked to the shared module.
    list (APPEND CC_MQTT311_LIBS_DEFAULT_CMAKE_ARGS -DCC_MQTT311_CLIENT_LIB_FORCE_PIC=ON)
endif ()

if (OPT_CC_MQTT5_CLIENT_FILTER_CC_TOOLS_PLUGIN)
    # cc.mqtt5.libs requires PIC compilation when linked to the shared module.
    list (APPEND CC_MQTT5_LIBS_DEFAULT_CMAKE_ARGS -DCC_MQTT5_CLIENT_LIB_FORCE_PIC=ON)
endif ()

if (OPT_CC_MQTTSN_CLIENT_FILTER_CC_TOOLS_PLUGIN)
    # cc.mqttsn.libs requires PIC compilation when linked to the shared module.
    list (APPEND CC_MQTTSN_LIBS_DEFAULT_CMAKE_ARGS -DCC_MQTTSN_CLIENT_LIB_FORCE_PIC=ON)
endif ()

########################################################################

# Boost configuration
set (boost_enabled OFF)
set (boost_params)

macro (add_boost_param name)
    if (DEFINED ${name})
        list (APPEND boost_params -D${name}=${${name}}) 
    endif ()
endmacro ()

if (OPT_ALLOW_BOOST)
    find_package (Boost QUIET)
    
    if (TARGET Boost::boost)
        set (boost_enabled ON)
        add_boost_param(BOOST_ROOT)
        add_boost_param(BOOST_INCLUDEDIR)
        add_boost_param(BOOST_LIBRARYDIR)
        add_boost_param(Boost_NO_SYSTEM_PATHS)
        add_boost_param(Boost_ADDITIONAL_VERSIONS)
        add_boost_param(Boost_USE_DEBUG_LIBS)
        add_boost_param(Boost_USE_RELEASE_LIBS)
        add_boost_param(Boost_USE_MULTITHREADED)
        add_boost_param(Boost_USE_STATIC_LIBS)
        add_boost_param(Boost_USE_STATIC_RUNTIME)
        add_boost_param(Boost_LIB_PREFIX)
        add_boost_param(CMAKE_POLICY_DEFAULT_CMP0167)

        list (APPEND CC_MQTT311_LIBS_DEFAULT_CMAKE_ARGS ${boost_params})
        list (APPEND CC_MQTT5_LIBS_DEFAULT_CMAKE_ARGS ${boost_params})
        list (APPEND CC_MQTTSN_LIBS_DEFAULT_CMAKE_ARGS ${boost_params})
    endif ()
endif ()

list (APPEND CC_MQTT311_LIBS_DEFAULT_CMAKE_ARGS -DCC_MQTT311_CLIENT_APPS=${boost_enabled})
list (APPEND CC_MQTT5_LIBS_DEFAULT_CMAKE_ARGS -DCC_MQTT5_CLIENT_APPS=${boost_enabled})
list (APPEND CC_MQTTSN_LIBS_DEFAULT_CMAKE_ARGS -DCC_MQTTSN_CLIENT_APPS=${boost_enabled} -DCC_MQTTSN_GATEWAY_APPS=${boost_enabled})

########################################################################

# Qt configuration
if ("${OPT_QT_MAJOR_VERSION}" STREQUAL "")
    set (OPT_QT_MAJOR_VERSION ${QT_MAJOR_DEFAULT_VERSION})
endif ()

list (APPEND CC_TOOLS_QT_DEFAULT_CMAKE_ARGS -DCC_TOOLS_QT_MAJOR_QT_VERSION=${OPT_QT_MAJOR_VERSION})
list (APPEND CC_DEMO1_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_QT_MAJOR_VERSION=${OPT_QT_MAJOR_VERSION})
list (APPEND CC_DEMO2_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_QT_MAJOR_VERSION=${OPT_QT_MAJOR_VERSION})
list (APPEND CC_DEMO3_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_QT_MAJOR_VERSION=${OPT_QT_MAJOR_VERSION})
list (APPEND CC_MQTT311_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_QT_MAJOR_VERSION=${OPT_QT_MAJOR_VERSION})
list (APPEND CC_MQTT5_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_QT_MAJOR_VERSION=${OPT_QT_MAJOR_VERSION})
list (APPEND CC_MQTTSN_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_QT_MAJOR_VERSION=${OPT_QT_MAJOR_VERSION})
list (APPEND CC_UBLOX_PROTOCOL_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_QT_MAJOR_VERSION=${OPT_QT_MAJOR_VERSION})
list (APPEND CC_MQTT311_CLIENT_FILTER_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_QT_MAJOR_VERSION=${OPT_QT_MAJOR_VERSION})
list (APPEND CC_MQTT5_CLIENT_FILTER_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_QT_MAJOR_VERSION=${OPT_QT_MAJOR_VERSION})
list (APPEND CC_MQTTSN_CLIENT_FILTER_CC_TOOLS_PLUGIN_DEFAULT_CMAKE_ARGS -DOPT_QT_MAJOR_VERSION=${OPT_QT_MAJOR_VERSION})

########################################################################

# C++ standard
if ("${CMAKE_CXX_STANDARD}" STREQUAL "")
    set (CMAKE_CXX_STANDARD 17)
endif ()

# The value above is passed to every project in cc_add_project() function.
