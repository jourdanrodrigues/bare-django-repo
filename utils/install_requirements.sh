#!/usr/bin/env bash

source ${UTILS_PATH}/log_messages.sh

section "Install project's requirements"
if [ -f setup.py ]; then
  pip install -e .
elif [ -f requirements.txt ]; then
  pip install -r requirements.txt
fi
check_error $?
