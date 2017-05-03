#!/usr/bin/env bash

source ${UTILS_PATH}/log_messages.sh

APP_JSON=${PROJECT_PATH}/app.json

if [ -f ${APP_JSON} ]; then
  section "Run commands from \"scripts.webfaction.postdeploy\" list found in \"app.json\""
  cat ${APP_JSON} | ${BIN_PATH}/jq -r '.scripts.webfaction.postdeploy[]?' | while read COMMAND; do
    if [ "${COMMAND}" != "" ]; then
      log "Run \"${COMMAND}\""
      ${COMMAND}
      check_error $?
    fi
  done
else
  log "\"app.json\" not found."
  log "Check \"https://github.com/dewayinc/bare-django-repo\" for more info about \"app.json\" file."
fi
