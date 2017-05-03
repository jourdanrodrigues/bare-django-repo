#!/usr/bin/env bash

source ${UTILS_PATH}/log_messages.sh

log "Pull possible updates for deployment automation"
git --git-dir=$(pwd)/.git/ pull
