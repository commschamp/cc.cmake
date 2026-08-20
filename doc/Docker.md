# Docker Support

The [Docker](https://www.docker.com/) image of all CommsChampion Ecosystem applications is available
for download from the [DockerHub](https://hub.docker.com/r/commschamp/cc).

```
docker pull commschamp/cc:latest
```

See the [tags](https://hub.docker.com/r/commschamp/cc/tags) page for available tags to pull.

All the artifacts reside in the `/cc` directory (the binary executables are in `/cc/bin`) and the
[cc.sh](../docker/cc.sh) script is the default entrypoint. There is a user defined and all the applications
are executed with the selected user permissions. The expected usage of the entrypoint is:
```
/cc.sh <cmd> <cmd_options...>
```
The `<cmd>` is the name of the binary from the `/cc/bin`. When no arguments are provided then the script
will list all the available commands. Every binary in the `/cc/bin` is expected to have `-h` command line
options for help.

Not specifying any `cmd` parameter to run will result in output of all the available binaries in the `/cc/bin`.

## How to Customize and Build
The provided [Dockerfile](../docker/Dockerfile) can be used to build any configuration. When no extra build arguments
are provided all [CommsChampion Ecosystem](https://commschamp.github.io/) applications will end up
in the final image. Please read [build instructions](BUILD.md) as prerequisite to further instructions.

Below are the build configuration arguments, default value of which that can be changed with `--build-arg`.

- **CONFIG** (=config/AllDocker.cmake) - Path to the configuration to be used with the
  [CMAKE_PROJECT_INCLUDE](https://cmake.org/cmake/help/latest/variable/CMAKE_PROJECT_INCLUDE.html) cmake parameter.
- **HAS_GUI_APPS** (=true) - Flag to install relevant Qt libraries for the GUI applications.
- **HAS_BOOST_APPS** (=true) - Flag to install relevant Boost libraries for command line applications.
- **HAS_CODE_GENERATORS** (=true) - Flag to install dependencies of the [commsdsl](https://github.com/commschamp/commsdsl)
  code generators.
- **USERNAME** (=cc) - Username to be used for the non-root user.
- **UID** (=1000) - User ID for the non-root user

## All Applications Image

```
docker build --progress=plain -t cc -f docker/Dockerfile /path/to/this/repo
```
See also [script/docker_build.sh](../script/docker_build.sh)

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

## MQTT Applications Only Image

```
docker build --progress=plain \
    --build-arg CONFIG=config/AllMqtt.cmake \
    --build-arg HAS_GUI_APPS=false \
    --build-arg HAS_CODE_GENERATORS=false \
    -t cc_mqtt -f docker/Dockerfile .
```

# Running Tips

When running the docker images remember to give access to the relevant host hardware / assets if needed. For example:

- Run applications that requires networking:
```
docker run --network host --rm -it cc:latest cc_mqtt5_client_sub -v -t "#"
```

- Run applications that requires networking and GUI:
```
docker run --network host -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/dri --rm -it cc:latest cc_view
```

