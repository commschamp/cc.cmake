# Overview
This repository bundles all the [CommsChampion Ecosystem](https://commschamp.github.io/) projects
into a single CMake one. It is expected to be used in another CMake project that has some
[CommsChampion Ecosystem](https://commschamp.github.io/) dependencies and built using
the [ExternalProject_Add()](https://cmake.org/cmake/help/v3.15/module/ExternalProject.html) cmake
function with an appropriate configuration.

# CMake Configuration
The major [CMakeLists.txt](CMakeLists.txt) contains a list of supported options and other
configuration variables. All the projects are disabled by default. The CMake invocation is
expected to use [CMAKE_PROJECT_INCLUDE](https://cmake.org/cmake/help/v3.15/variable/CMAKE_PROJECT_INCLUDE.html)
variable pointing to a file, which lists all the required projects to get compiled.

If one of the selected project depends on another (see [DefaultConfig.cmake](DefaultConfig.cmake) for details),
the latter gets built even if it was not explicitly enabled.

The configuration file provided via the [CMAKE_PROJECT_INCLUDE](https://cmake.org/cmake/help/v3.15/variable/CMAKE_PROJECT_INCLUDE.html)
variable can also override / update the default configuration provided by this project by
setting appropriate variables.

The supported variables are:

- `<PROJ_NAME>_SOURCE_DIR` - Override the default source directory.
- `<PROJ_NAME>_GIT_REPOSITORY` - Override the default project repository URL. To
  disable usage of the repository and use source directory (set by the `<PROJ_NAME>_SOURCE_DIR`)
  instead, set the `<PROJ_NAME>_GIT_REPOSITORY` value to `_`.
- `<PROJ_NAME>_GIT_TAG` - Override the default tag.
- `<PROJ_NAME>_CMAKE_ARGS` - Extra CMake arguments to be passed to the project. Use
  only project specific configuration, no need to set variables like
  [CMAKE_GENERATOR](https://cmake.org/cmake/help/v3.15/variable/CMAKE_GENERATOR.html),
  [CMAKE_BUILD_TYPE](https://cmake.org/cmake/help/v3.15/variable/CMAKE_BUILD_TYPE.html), or
  [CMAKE_CXX_STANDARD](https://cmake.org/cmake/help/v3.15/variable/CMAKE_CXX_STANDARD.html). They
  are all automatically inherited from this project.

The `<PROJ_NAME>` prefix is combined by the project name capitalized and every `.` (dot) character
replaced with the `_` (underscore). For example:

- [cc_tools_qt](https://github.com/commschamp/cc_tools_qt) becomes `CC_TOOLS_QT`.
- [cc.mqtt5.generated](https://github.com/commschamp/cc.mqtt5.generated) becomes `CC_MQTT5_GENERATED`.
- [cc.mqtt5_client_filter.cc_tools_plugin](https://github.com/commschamp/cc.mqtt5_client_filter.cc_tools_plugin)
  becomes `CC_MQTT5_CLIENT_FILTER_CC_TOOLS_PLUGIN`


For example, to enable the MQTT5 client library
(see [cc.mqtt5.libs](https://github.com/commschamp/cc.mqtt5.libs))
while disabling build of provided client applications, the
configuration file can have the following lines:
```
set (OPT_CC_MQTT5_LIBS ON)
list (APPEND CC_MQTT5_LIBS_CMAKE_ARGS -DCC_MQTT5_CLIENT_APPS=OFF)
```

In case a value of one of the variables provided via the `<PROJ_NAME>_CMAKE_ARGS` needs to
contain a CMake list, then the separation of the values needs to be performed using the
`|` character instead of usual `;`.

```
list (APPEND CC_MQTT5_LIBS_CMAKE_ARGS -DCC_MQTT5_CUSTOM_CLIENT_CONFIG_FILES="/path/to/config1|/path/to/config2")
```

This project contains various configuration files for use and reference, please
see the contents of the [config](config) folder.
```
cmake -DCMAKE_PROJECT_INCLUDE=config/All.cmake ...
```

# Third Party Dependencies

## Qt Dependency
Some projects (mostly [cc_tools_qt](https://github.com/commschamp/cc_tools_qt) and the relevant plugins) depend
on the [Qt](https://www.qt.io/) library. To provide a path to the compiled libraries (required mostly on Windows platform) use
standard [CMAKE_PREFIX_PATH](https://cmake.org/cmake/help/v3.15/variable/CMAKE_PREFIX_PATH.html) variable
passed to this project. It will be propagated to all other projects.
```
cmake -DCMAKE_PREFIX_PATH=C:\Qt6 ...
```

All the projects in the [CommsChampion Ecosystem](https://commschamp.github.io/) are expected
to support both Qt5 and Qt6. To overwrite the default Qt major version (currently Qt5) use the
`OPT_QT_MAJOR_VERSION` CMake variable.
```
cmake -DOPT_QT_MAJOR_VERSION=6 ...
```

## Boost Dependency
Some projects (mostly command line applications in the libraries projects) depend on [Boost](https://www.boost.org/).
It is expected to use the relevant variables described in the [FindBoost](https://cmake.org/cmake/help/v3.15/module/FindBoost.html)
documentation to help with finding appropriate boost libraries. All the provided boost configuration variables will be passed
to the relevant projects as well.
```
cmake -DBOOST_ROOT=C:\boost -DBoost_USE_STATIC_LIBS=ON ...
```
