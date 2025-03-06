#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR=$( dirname ${SCRIPT_DIR} )

docker build --progress=plain \
    --build-arg CONFIG=config/AllMqtt.cmake \
    --build-arg HAS_GUI_APPS=false \
    --build-arg HAS_CODE_GENERATORS=false \
    -t cc_mqtt -f docker/Dockerfile ${ROOT_DIR}