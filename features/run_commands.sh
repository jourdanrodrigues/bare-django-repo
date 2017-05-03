#!/usr/bin/env bash

source ${UTILS_PATH}/log_messages.sh

APP_JSON=${PROJECT_PATH}/app.json

section "Run commands from \"scripts.webfaction.postdeploy\" in \"app.json\""

if [ -f ${APP_JSON} ]; then
  cat ${APP_JSON} | ${BIN_PATH}/jq -r '.scripts.webfaction.postdeploy[]?' | while read COMMAND; do
    if [ "${COMMAND}" != "" ]; then
      log "Run \"${COMMAND}\""
      ${COMMAND}
      [ $? -eq 0 ] && exit 0 || exit 1
    fi
  done
fi
