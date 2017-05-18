#!/usr/bin/env bash

if [ ! ${PATHS_SET} ]; then
  export PATHS_SET=true

  # "./<this_file> -b" to perform the backup
  while getopts :b opt; do [ ${opt} == b ] && BACKUP=true; done

  export UTILS_PATH=${HERE_PATH}/utils
  export FEATS_PATH=${HERE_PATH}/features

  export BIN_PATH=${HOME}/bin
  mkdir -p ${BIN_PATH}

  CURRENT_DIRECTORY=$(dirname ${HERE_PATH})
  export APP_PATH=$(dirname ${CURRENT_DIRECTORY})

  export BACKUPS_PATH=${APP_PATH}/backups && mkdir -p ${BACKUPS_PATH}

  PROJECT_DIRECTORY=$(basename ${CURRENT_DIRECTORY%.git}) # Trick to get directory name without ".git"
  export PROJECT_PATH=${APP_PATH}/${PROJECT_DIRECTORY}
  if [ ${BACKUP} ] && [ -d ${PROJECT_PATH} ]; then # Perfoms a simple backup
    rm -rf ${BACKUPS_PATH}/${PROJECT_DIRECTORY} && mv ${PROJECT_PATH} ${BACKUPS_PATH}
  fi
  mkdir -p ${PROJECT_PATH}

  export LOGS_PATH=${APP_PATH}/logs && mkdir -p ${LOGS_PATH}

  export SAVE_TO_LOG="/usr/bin/tee -a ${LOGS_PATH}/build.log"

  export DATETIME_FORMAT="+%d/%m/%Y %H:%M:%S"

  if [ -f /usr/bin/sed ]; then export SED_BIN=/usr/bin/sed
  elif [ -f /bin/sed ]; then export SED_BIN=/bin/sed
  fi

  export DATE_BIN=/bin/date
fi
