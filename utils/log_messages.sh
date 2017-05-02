#!/usr/bin/env bash

NC="\033[0m"
LOG="\033[0;36m"
ERROR="\033[0;31m"
SUCCESS="\033[0;32m"
SECTION="\033[1;33m"

function print_to_screen () {
  printf -- "-----> ${1}${NC}\n"
}

function log () {
  print_to_screen "${LOG}${1}"
}

function section () {
  echo ""
  print_to_screen "${SECTION}${1}"
}

function success () {
  print_to_screen "${SUCCESS}${1}"
}

function error () {
  print_to_screen "${ERROR}${1}"
  exit 1
}

function check_error () {
  if [ ${1} -ne 0 ]; then
    print_to_screen "${ERROR}Something went wrong"
    exit ${1}
  else
    print_to_screen "${SUCCESS}OK"
  fi
}
