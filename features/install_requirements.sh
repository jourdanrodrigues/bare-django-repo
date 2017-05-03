#!/usr/bin/env bash

source ${UTILS_PATH}/log_messages.sh

section "Install project's requirements"
if [ -f setup.py ]; then
  pip install -e .
  [ $? -eq 0 ] && exit 0 || exit 1
elif [ -f requirements.txt ]; then
  pip install -r requirements.txt
  [ $? -eq 0 ] && exit 0 || exit 1
else
  log "The project does not have a \"requirements.txt\" or a \"setup.py\"."
fi
