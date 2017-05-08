#!/usr/bin/env bash

if [ ! ${PATHS_SET} ]; then
  export PATHS_SET=true

  # "./<this_file> -b" to perform the backup
  while getopts :b opt; do [ ${opt} == b ] && BACKUP=true; done

  export UTILS_PATH=`pwd`/utils
  export FEATS_PATH=`pwd`/features

  export BIN_PATH=${HOME}/bin
  mkdir -p ${BIN_PATH}

  CURRENT_DIRECTORY=$(dirname `pwd`)
  export APP_PATH=$(dirname ${CURRENT_DIRECTORY})

  PROJECT_DIRECTORY=$(basename ${CURRENT_DIRECTORY}) # Trick to get directory name without ".git"
  export PROJECT_PATH=${APP_PATH}/${PROJECT_DIRECTORY%.git}
  if [ ${BACKUP} ] && [ -d ${PROJECT_PATH} ]; then # Perfoms a simple backup
    rm -rf ${PROJECT_PATH}.backup
    mv ${PROJECT_PATH} ${PROJECT_PATH}.backup
  fi
  mkdir -p ${PROJECT_PATH}

  export SAVE_TO_LOG="/usr/bin/tee -a ${APP_PATH}/build.log"

  export DATETIME_FORMAT="+%d/%m/%Y %H:%M:%S"

  if [ -f /usr/bin/sed ]; then export SED_BIN=/usr/bin/sed
  elif [ -f /bin/sed ]; then export SED_BIN=/bin/sed
  fi
fi
