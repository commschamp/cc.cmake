#!/bin/bash

# Configuration variables
GPG_KEY_ID="${GPG_KEY_ID:-01074C7569CEB615B71EB00C50A3CDEF129863DF}"
ASC_SIGN_NAME="${ASC_SIGN_NAME:-commschamp}"
# DISTROS - Use colon separation, such as `export DISTROS="noble:resolute`

set -e
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR=$( dirname ${SCRIPT_DIR} )

BUILD_DIR=${ROOT_DIR}/build.deb
APTLY_CONFIG="${BUILD_DIR}/aptly.conf"
APTLY_DIR="${BUILD_DIR}/aptly"

if [ -z "${DISTROS:-}" ]; then
    DISTROS=("noble")
else
    IFS=: read -ra DISTROS <<< "${DISTROS}"
fi

if [ ! -e "${BUILD_DIR}" ]; then
    echo "ERROR: Build directory \"${BUILD_DIR}\" does not exist, run ${SCRIPTS_DIR}/deb_build.sh first."
    exit 1
fi

cat > "${APTLY_CONFIG}" <<EOF
{
    "rootDir": "${APTLY_DIR}",
    "gpgProvider": "gpg"
}
EOF

rm -rf ${APTLY_DIR}
rm -rf ${BUILD_DIR}/publish
aptly -config="${APTLY_CONFIG}" repo create cc

SIGN_PARAM=
if [ -n "${GPG_KEY_ID}" ]; then
    SIGN_PARAM="-gpg-key=${GPG_KEY_ID}"
fi

for d in ${DISTROS[@]}; do
    if [ ! -d "${BUILD_DIR}/${d}/src" ]; then
        echo "ERROR: No previous ${d} build is detected, use DISTROS environment variable to specify what has been built"
        exit 1
    fi

    aptly -config="${APTLY_CONFIG}" repo add cc ${BUILD_DIR}/${d}/src/*.deb
    aptly -config="${APTLY_CONFIG}" publish repo -distribution=${d} -component=main ${SIGN_PARAM} cc
done

ln -sf ${APTLY_DIR}/public ${BUILD_DIR}/publish
gpg --armor --export ${GPG_KEY_ID} > ${BUILD_DIR}/publish/${ASC_SIGN_NAME}.asc
