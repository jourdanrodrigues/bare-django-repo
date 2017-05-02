#!/usr/bin/env bash

source ${UTILS_PATH}/log_messages.sh

if [ -f app.json ]; then
  section "Run commands from \"scripts.webfaction.postdeploy\" list found in \"app.json\""
  cat app.json | ${BIN_PATH}/jq -r '.scripts.webfaction.postdeploy[]?' | while read COMMAND; do
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
