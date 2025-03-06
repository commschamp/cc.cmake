# Overview
This repository bundles all the [CommsChampion Ecosystem](https://commschamp.github.io/) projects
into a single CMake one. It is expected to be used a stand-alone or in another CMake project that has some
[CommsChampion Ecosystem](https://commschamp.github.io/) dependencies and built using
the [ExternalProject_Add()](https://cmake.org/cmake/help/v3.15/module/ExternalProject.html) cmake
function with an appropriate configuration.

[Docker](https://www.docker.com/) support is also available, see instructions [below](#docker-support)

# Build Instructions

## CMake Configuration
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

## Third Party Dependencies

### Qt Dependency
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

### Boost Dependency
Some projects (mostly command line applications in the libraries projects) depend on [Boost](https://www.boost.org/).
It is expected to use the relevant variables described in the [FindBoost](https://cmake.org/cmake/help/latest/module/FindBoost.html)
documentation to help with finding appropriate boost libraries. All the provided boost configuration variables will be passed
to the relevant projects as well.

For example using CMake built-in scripts to find boost
```
cmake -DCMAKE_POLICY_DEFAULT_CMP0167=OLD -DBOOST_ROOT=C:\boost -DBoost_USE_STATIC_LIBS=ON ...
```

Or using upstream boost configuration:
```
cmake -DCMAKE_POLICY_DEFAULT_CMP0167=NEW -DCMAKE_PREFIX_PATH=/path/to/boost/cmake/config ...
```

# Docker Support

The proficed [Dockerfile](docker/Dockerfile) can be used to build any configuration. When no extra build arguments
are provided all [CommsChampion Ecosystem](https://commschamp.github.io/) applications will end up
in the final image. 

All the artifacts will reside in the `/cc` directory (the binary executables will be in `/cc/bin`) and the 
[cc.sh](docker/cc.sh) script will be a default entrypoint. There is a user defined and all the applications
are executed with the selected user permissions. The expected usage of the entrypoints are:
```
/cc.sh <cmd> <cmd_options...>
``` 
The `<cmd>` is the name of the binary from the `/cc/bin`. When no arguments are provided then the script
will list all the available commands. Every binary in the `/cc/bin` is expected to have `-h` command line
options for help.

Below are the build configuration arguments default value of whic that can be changed with `--build-arg`.

- **CONFIG** (=config/All.cmake) - Path to the configuration to be used with the 
  [CMAKE_PROJECT_INCLUDE](https://cmake.org/cmake/help/latest/variable/CMAKE_PROJECT_INCLUDE.html) cmake parameter.
- **HAS_GUI_APPS** (=true) - Flag to install relevant Qt libraries for the GUI applications.
- **HAS_BOOST_APPS** (=true) - Flag to install relevant Boost libraries for command line applications.
- **HAS_CODE_GENERATORS** (=true) - Flag to install dependencies of the [commsdsl](https://github.com/commschamp/commsdsl)
  code generators.
- **USERNAME** (=cc) - Username to be used for the non-root user.
- **UID** (=1000) - User ID for the non-root user

## All Applications Image

```
docker build --progress=plain -t cc -f docker/Dockerfile .
```
See also [script/docker_build.sh](script/docker_build.sh)

When running the docker images remember to give access to the relevant host hardware / assets if needed. For example:

- Run applications that requires networking:
```
docker run --network host --rm -it cc:latest cc_mqtt5_sub -v -t "#"
```

- Run applications that requires networking and GUI:
```
docker run --network host -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/dri --rm -it cc:latest cc_view
```

## Code Generators Only Image

```
docker build --progress=plain \
    --build-arg CONFIG=config/CodeGenerators.cmake \
    --build-arg HAS_GUI_APPS=false \
    --build-arg HAS_BOOST_APPS=false \
    -t cc_gen -f docker/Dockerfile .
```
See also [script/docker_build_code_gens.sh](script/docker_build_code_gens.sh)


## CommsChampion Tools Only Image

```
docker build --progress=plain \
    --build-arg CONFIG=config/AllTools.cmake \
    --build-arg HAS_BOOST_APPS=false \
    --build-arg HAS_CODE_GENERATORS=false \
    -t cc_tools -f docker/Dockerfile .
```
See also [script/docker_build_tools.sh](script/docker_build_tools.sh)