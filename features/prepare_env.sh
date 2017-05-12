#!/usr/bin/env bash

source ${UTILS_PATH}/log_messages.sh

function create_env () {
  APP_NAME=$(basename ${APP_PATH})

  section "Create virtual environment with Python ${PYTHON_VERSION} for \"${APP_NAME}\""
  PYTHONPATH=${VENV_PYTHONPATH} ${VENV_BIN} -p /usr/local/bin/python${PYTHON_VERSION} --prompt="(${APP_NAME} Python${PYTHON_VERSION}) " ${ENV_PATH} || exit 1

  # Solution source: https://community.webfaction.com/questions/18791/why-can-my-virtualenv-still-see-system-site-packages/18792
  touch ${APP_PATH}/env/lib/python${PYTHON_VERSION}/sitecustomize.py
}

function backup () {
  rm -rf ${BACKUPS_PATH}/env && mv ${APP_PATH}/env ${BACKUPS_PATH}
}

ENV_PATH=${APP_PATH}/env

PYTHON_VERSION=2.7

if [ ! -d ${ENV_PATH} ]; then
  # If the env does not exist, create it
  if [ -f ${PROJECT_PATH}/app.json ]; then
    CUSTOM_PYTHON_VERSION=$(cat ${PROJECT_PATH}/app.json | ${JQ_BIN} -r '.environments.webfaction.python?')
  fi

  if [[ "${PYTHON_VERSION}" == "null" ]] || [[ "${PYTHON_VERSION}" == "" ]]; then
    PYTHON_VERSION=CUSTOM_PYTHON_VERSION
  fi

  create_env

elif [ -f ${PROJECT_PATH}/app.json ]; then
  # If the project has an "app.json", look for a Python version there
  PYTHON_VERSION=$(cat ${PROJECT_PATH}/app.json | ${JQ_BIN} -r '.environments.webfaction.python?')

  if [ -f ${APP_PATH}/app.json ]; then
    OLD_PYTHON_VERSION=$(cat ${APP_PATH}/app.json | ${JQ_BIN} -r '.environments.webfaction.python?')
    # Check if the Python version is updated and recreate the env
    if [[ "${PYTHON_VERSION}" != "null" ]] && [[ "${OLD_PYTHON_VERSION}" != "${PYTHON_VERSION}" ]]; then
      backup
      create_env
    fi
  else
    # If app's "app.json" does not exist, update the env. This is probably the
    # first push or the addition of the "app.json" file into the project
    backup
    create_env
  fi
elif [ -f ${APP_PATH}/app.json ]; then
  # If the app's "app.json" and the environment exists but the project's
  # "app.json" does not exist anymore, remove the app's "app.json" and recreate
  # the environment
  rm -rf ${APP_PATH}/app.json
  backup
  create_env
fi
