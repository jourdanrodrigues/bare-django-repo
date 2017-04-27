#!/usr/bin/env bash

command -v jq > /dev/null # Check for JQ https://stedolan.github.io/jq/
if [[ ${?} -ne 0 ]]; then
  ORIGINAL_PATH=`pwd` # Save current directory
  source ${UTILS_PATH}/log_messages.sh
  log "Install \"jq\""

  JQ=jq-1.5 # See https://github.com/stedolan/jq/releases/ for new releases
  if [ -d /tmp/${JQ} ]; then
    log "Using cached"
    cd /tmp/${JQ}
  else
    cd /tmp/
    curl -OL https://github.com/stedolan/jq/releases/download/${JQ}/${JQ}.tar.gz > /dev/null
    tar xfz ${JQ}.tar.gz
    rm -rf ${JQ}.tar.gz
    cd ${JQ}
    ./configure --disable-maintainer-mode > /dev/null
    make > /dev/null
  fi
  make install > /dev/null
  check_error $?

  cd ${ORIGINAL_PATH}
fi
