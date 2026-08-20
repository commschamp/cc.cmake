# AppImage Support

The x86_64 [AppImage](https://appimage.org/) binary containing all the [CommsChampion Ecosystem](https://commschamp.github.io/)
applications can be downloaded from the relevant [release artefacts](https://github.com/commschamp/cc.cmake/releases).

The [AppRun](../appimage/AppRun) script is the entrypoint. The expected usage of the entrypoint is:
```
/path/to/cc-<arch>.AppImage <cmd> [<options>...]
```
The `<cmd>` is the name of the binary from the `/cc/bin`. When no arguments are provided then the script
will list all the available commands. Every binary in the `/cc/bin` is expected to have `-h` command line
options for help.
```
/path/to/cc-<arch>.AppImage cc_mqtt5_client_sub -h
```

Not specifying any `cmd` parameter to run will result in output of all the available binaries in the `/cc/bin`.

## How to Build

The provided [script/appimage_create.sh](../script/appimage_create.sh) script can be used to create
an AppImage binary when the relevant configuration has already been built.
```
./script/appimage_create.sh /path/to/install /path/to/AppDir
```
Please open the script's code and note the requirement for the `~/bin/linuxdeploy-<arch>.AppImage`
(and `linuxdeploy-plugin-qt-<arch>.AppImage` alongside it when Qt based applications are included).
The default path to the `linuxdeploy` can be changed using `LINUXDEPLOY` environment variable.
```
LINUXDEPLOY=/some/othe/path/to/linuxdeploy ./script/appimage_create.sh /path/to/install /path/to/AppDir
```
The provided [script/appimage_build.sh](../script/appimage_build.sh) script can be used to
both build and create an AppImage binary.
```
./script/appimage_build.sh
```
Please open the script's code to see the environment variables that can be used to change the default
configuration. Note an ability to select the build configuration using the `PROJ_INCLUDE` environment
variable.

