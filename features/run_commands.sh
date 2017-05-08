#!/usr/bin/env bash

source ${UTILS_PATH}/log_messages.sh

APP_JSON=${PROJECT_PATH}/app.json

section "Run commands from \"scripts.webfaction.postdeploy\" in \"app.json\""

if [ -f ${APP_JSON} ]; then
  cat ${APP_JSON} | ${JQ_BIN} -r '.scripts.webfaction.postdeploy[]?' | while read COMMAND; do
    if [ "${COMMAND}" != "" ]; then
      log "Run \"${COMMAND}\""
      ${COMMAND} || exit 1
    fi
  done
fi

exit ${?}
