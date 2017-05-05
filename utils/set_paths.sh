#!/usr/bin/env bash

export UTILS_PATH=`pwd`/utils
export FEATS_PATH=`pwd`/features

export BIN_PATH=${HOME}/bin
mkdir -p ${BIN_PATH}

CURRENT_DIRECTORY=$(dirname `pwd`)
export APP_PATH=$(dirname ${CURRENT_DIRECTORY})

PROJECT_DIRECTORY=$(basename ${CURRENT_DIRECTORY}) # Trick to get directory name without ".git"
export PROJECT_PATH=${APP_PATH}/${PROJECT_DIRECTORY%.git}
mkdir -p ${PROJECT_PATH}

if [ -f /usr/bin/sed ]; then export SED_BIN=/usr/bin/sed
elif [ -f /bin/sed ]; then export SED_BIN=/bin/sed
fi
