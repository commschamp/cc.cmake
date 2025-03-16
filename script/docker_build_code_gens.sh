#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR=$( dirname ${SCRIPT_DIR} )

docker build --progress=plain \
    --build-arg CONFIG=config/CodeGenerators.cmake \
    --build-arg HAS_GUI_APPS=false \
    --build-arg HAS_BOOST_APPS=false \
    -t cc_gen -f docker/Dockerfile ${ROOT_DIR}