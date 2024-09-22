cmake_minimum_required (VERSION 3.15)
project ("cc_cmake")

# Use CMAKE_PROJECT_INCLUDE variable to include file with proper configurations
option (OPT_COMMS "Forcefully add COMMS library" OFF)
option (OPT_CC_TOOLS_QT "Forcefully add cc_tools_qt" OFF)
option (OPT_COMMSDSL "Forcefully add commsdsl" OFF)
option (OPT_CC_DEMO1_GENERATED "Forcefully add cc.demo1.generated" OFF)
option (OPT_CC_DEMO2_GENERATED "Forcefully add cc.demo2.generated" OFF)
option (OPT_CC_DEMO3_GENERATED "Forcefully add cc.demo3.generated" OFF)
option (OPT_CC_MQTT311_GENERATED "Forcefully add cc.mqtt311.generated" OFF)
option (OPT_CC_MQTTSN_GENERATED "Forcefully add cc.mqttsn.generated" OFF)
option (OPT_CC_MQTT5_GENERATED "Forcefully add cc.mqtt5.generated" OFF)
option (OPT_CC_UBLOX_GENERATED "Forcefully add cc.ublox.generated" OFF)
option (OPT_CC_X509_GENERATED "Forcefully add cc.x509.generated" OFF)
option (OPT_CC_MQTTSN_LIBS "Forcefully add cc.mqttsn.libs" OFF)
option (OPT_CC_MQTT311_LIBS "Forcefully add cc.mqtt311.libs" OFF)
option (OPT_CC_MQTT5_LIBS "Forcefully add cc.mqtt5.libs" OFF)
option (OPT_CC_DEMO1_PROTOCOL_CC_TOOLS_PLUGIN "Forcefully add cc.demo1_protocol.cc_tools_plugin" OFF)
option (OPT_CC_DEMO2_PROTOCOL_CC_TOOLS_PLUGIN "Forcefully add cc.demo2_protocol.cc_tools_plugin" OFF)
option (OPT_CC_DEMO3_PROTOCOL_CC_TOOLS_PLUGIN "Forcefully add cc.demo3_protocol.cc_tools_plugin" OFF)
option (OPT_CC_MQTT311_PROTOCOL_CC_TOOLS_PLUGIN "Forcefully add cc.mqtt311_protocol.cc_tools_plugin" OFF)
option (OPT_CC_MQTT5_PROTOCOL_CC_TOOLS_PLUGIN "Forcefully add cc.mqtt5_protocol.cc_tools_plugin" OFF)
option (OPT_CC_MQTTSN_PROTOCOL_CC_TOOLS_PLUGIN "Forcefully add cc.mqttsn_protocol.cc_tools_plugin" OFF)
option (OPT_CC_UBLOX_PROTOCOL_CC_TOOLS_PLUGIN "Forcefully add cc.ublox_protocol.cc_tools_plugin" OFF)
option (OPT_CC_MQTT311_CLIENT_FILTER_CC_TOOLS_PLUGIN "Forcefully add cc.mqtt311_client_filter.cc_tools_plugin" OFF)
option (OPT_CC_MQTT5_CLIENT_FILTER_CC_TOOLS_PLUGIN "Forcefully add cc.mqtt5_client_filter.cc_tools_plugin" OFF)
option (OPT_ALLOW_BOOST "Build applications requiring boost if the latter is found" ON)
option (OPT_USE_CCACHE "Use ccache" OFF)

# Other configuration variables
# OPT_QT_MAJOR_VERSION - Major Qt version, required by various projects. Defaults to 5.
# OPT_EXTERNALS_DIR - Directory where accumulate externals. Defaults to ${PROJECT_SOURCE_DIR}/externals
# OPT_CCACHE_EXECUTABLE - Path to ccache executable
# CMAKE_CXX_VERSION - C++ version to use. Defaults to 17.

################################################################################################

if ("${OPT_EXTERNALS_DIR}" STREQUAL "")
    set (OPT_EXTERNALS_DIR "${PROJECT_SOURCE_DIR}/externals")
endif ()    

include(ExternalProject)
include(${CMAKE_CURRENT_SOURCE_DIR}/Funcs.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/DefaultConfig.cmake)

cc_add_project (comms)
cc_add_project (cc_tools_qt)
cc_add_project (commsdsl)
cc_add_project (cc.demo1.generated)
cc_add_project (cc.demo2.generated)
cc_add_project (cc.demo3.generated)
cc_add_project (cc.mqtt311.generated)
cc_add_project (cc.mqttsn.generated)
cc_add_project (cc.mqtt5.generated)
cc_add_project (cc.ublox.generated)
cc_add_project (cc.x509.generated)
cc_add_project (cc.mqttsn.libs)
cc_add_project (cc.mqtt311.libs)
cc_add_project (cc.mqtt5.libs)
cc_add_project (cc.demo1_protocol.cc_tools_plugin)
cc_add_project (cc.demo2_protocol.cc_tools_plugin)
cc_add_project (cc.demo3_protocol.cc_tools_plugin)
cc_add_project (cc.mqtt311_protocol.cc_tools_plugin)
cc_add_project (cc.mqtt5_protocol.cc_tools_plugin)
cc_add_project (cc.mqttsn_protocol.cc_tools_plugin)
cc_add_project (cc.ublox_protocol.cc_tools_plugin)
cc_add_project (cc.mqtt311_client_filter.cc_tools_plugin)
cc_add_project (cc.mqtt5_client_filter.cc_tools_plugin)
cc_add_project (cc.mqttsn_client_filter.cc_tools_plugin)

if (WIN32 AND OPT_CC_TOOLS_QT)
    add_custom_target ("deploy_qt"
        COMMAND ${CMAKE_COMMAND} --build ${PROJECT_BINARY_DIR}/cc_tools_qt --target deploy_qt)    
endif ()
