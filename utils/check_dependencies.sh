#!/usr/bin/env bash

TMP_PATH=${HOME}/tmp
mkdir -p ${TMP_PATH} # Create it if does not exist

command -v ${BIN_PATH}/jq > /dev/null # Check for JQ https://stedolan.github.io/jq/
if [[ ${?} -ne 0 ]]; then
  ORIGINAL_PATH=`pwd` # Save current directory
  source ${UTILS_PATH}/log_messages.sh
  log "Install \"jq\""
  JQ=jq-1.5 # See https://github.com/stedolan/jq/releases/ for new releases
  if [ -d ${TMP_PATH}/${JQ} ]; then
    log "Using cached"
    cd ${TMP_PATH}/${JQ}
  else
    cd ${TMP_PATH}/
    curl -OL https://github.com/stedolan/jq/releases/download/${JQ}/${JQ}.tar.gz
    tar xfz ${JQ}.tar.gz
    rm -rf ${JQ}.tar.gz
    cd ${JQ}
  fi
  ./configure --disable-maintainer-mode --prefix=$(dirname ${BIN_PATH}) > /dev/null
  make > /dev/null
  make install > /dev/null
  check_error $?

  cd ${ORIGINAL_PATH}
fi
