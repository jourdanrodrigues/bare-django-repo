#!/usr/bin/env bash

source ${UTILS_PATH}/log_messages.sh

APACHE_CONF=${APP_PATH}/apache2/conf/httpd.conf

if [ ${SED_BIN} ]; then
  WSGI_PATH=$(find ${PROJECT_PATH} -not -path "*$(basename ${BACKUPS_PATH})*" -name "wsgi.py")
  LOG_FORMAT=$(${SED_BIN} -nE "s|LogFormat \".*\" (.*)|\1|p" ${APACHE_CONF})

  # Redirect logs
  CUSTOM_LOG="s|(CustomLog ).*|\1${LOGS_PATH}/app.log ${LOG_FORMAT}|"
  ERROR_LOG="s|(ErrorLog ).*|\1${LOGS_PATH}/error.log|"
  # Change old Python path and home to this project configuration
  PYTHON_PATHS="s|(python-path=).*|\1${PROJECT_PATH} python-home=${APP_PATH}/env|"
  # Redefine WSGI script path
  WSGI_PATH="s|(WSGIScriptAlias .* ).*|\1${WSGI_PATH}|"
  ${SED_BIN} -i .backup -E "${CUSTOM_LOG};${ERROR_LOG};${PYTHON_PATHS};${WSGI_PATH}" ${APACHE_CONF}
else
  log "\"sed\" not found! Apache configuration not changed."
fi

section "Restart Apache server"
${APP_PATH}/apache2/bin/restart || exit 1
