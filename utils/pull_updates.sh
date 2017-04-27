#!/usr/bin/env bash

source ./utils/log_messages.sh

log "Pull possible updates for deployment automation"
git --git-dir=./.git/ pull
echo "" # Leave a space for the deployment log
