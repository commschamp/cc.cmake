cmake_minimum_required (VERSION 3.15)
project ("cc_bundle")

# Use CMAKE_PROJECT_INCLUDE variable to include file with proper configurations
option (OPT_COMMS "Forcefully add COMMS library" OFF)
option (OPT_CC_TOOLS_QT "Forcefully add cc_tools_qt" OFF)
option (OPT_COMMSDSL "Forcefully add commsdsl" OFF)


include(ExternalProject)
include(${CMAKE_CURRENT_SOURCE_DIR}/Funcs.cmake)

cc_add_project (comms)
cc_add_project (cc_tools_qt)
cc_add_project (commsdsl)