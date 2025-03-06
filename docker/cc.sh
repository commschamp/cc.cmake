#!/bin/bash

function usage {
    echo "Usage: ${0} <cmd> <options...>"
    echo
    echo "Available cmds:"
    for f in /cc/bin/*; do
        cmd=$(basename ${f})
        echo "    ${cmd}"
    done
    echo 
    echo "Use \"${0} <cmd> -h\" to inquire about command options"
}

CMD=${1}
if [ -z "${CMD}" ]; then
    usage
    exit 0
fi

APP="/cc/bin/${CMD}"
if [ ! -e "${APP}" ]; then
    echo "ERROR: Command ${CMD} is not available"
    usage
    exit 1
fi

shift

exec ${APP} "$@"