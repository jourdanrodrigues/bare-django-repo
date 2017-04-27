#!/usr/bin/env bash

source ${UTILS_PATH}/log_messages.sh

section "Install project's requirements"
pip install -r requirements.txt
check_error $?
