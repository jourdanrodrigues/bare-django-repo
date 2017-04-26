#!/usr/bin/env bash
NC='\033[0m'
ERROR='\033[0;31m'
SUCCESS='\033[0;32m'
SECTION='\033[1;33m'

function space () {
    echo ""
    printf -- "-----> ${1}${NC}\n"
    echo ""
}

function section () {
    space "${SECTION}${1}"
}

function success () {
    space "${SUCCESS}${1}"
}

function check_error () {
    if [ $1 -ne 0 ]; then
        space "${ERROR}Something went wrong"
    else
        space "${SUCCESS}OK"
    fi
}
