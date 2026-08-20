# Overview
This repository bundles all the [CommsChampion Ecosystem](https://commschamp.github.io/) projects
into a single CMake one. It is expected to be built as a stand-alone CMake project or in another CMake one that has some
[CommsChampion Ecosystem](https://commschamp.github.io/) dependencies and built using
the [ExternalProject_Add()](https://cmake.org/cmake/help/v3.15/module/ExternalProject.html) cmake
function with an appropriate configuration.

For build instructions please read [doc/BUILD.md](doc/BUILD.md) documentation page.

This project can be used to build and/or use CommsChampion Ecosystem projects in different environments.
Please read the relevant documentation page:

- [Docket Support](doc/Docker.md)
- [AppImage Support](doc/AppImage.md)
- [Ubuntu/Debian Packages Support](doc/DebPack.md)
