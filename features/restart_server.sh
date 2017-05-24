#!/usr/bin/env bash

source ${UTILS_PATH}/log_messages.sh

APACHE_CONF=${APP_PATH}/apache2/conf/httpd.conf

if [ ${SED_BIN} ]; then
  WSGI_PATH=$(find ${PROJECT_PATH} -name "wsgi.py")
  APP_NAME=$(basename ${APP_PATH})
  LOG_FORMAT=$(${SED_BIN} -nE "s|LogFormat \".*\" (.*)|\1|p" ${APACHE_CONF})

  # Update server root
  SERVER_ROOT="s|(ServerRoot ).*|\1\"${APP_PATH}/apache2\"|"
  # Update logs
  CUSTOM_LOG="s|(CustomLog ).*|\1${LOGS_PATH}/app.log ${LOG_FORMAT}|"
  ERROR_LOG="s|(ErrorLog ).*|\1${LOGS_PATH}/error.log|"
  # Update WSGI Daemon process
  DAEMON_PROCESS="s|(WSGIDaemonProcess )[^ ]*( .*)|\1${APP_NAME}\2|"
  PYTHON_PATHS="s|(python-path=).*|\1${PROJECT_PATH} python-home=${APP_PATH}|"
  # Update WSGI process group and script path
  PROCESS_GROUP="s|(WSGIProcessGroup ).*|\1${APP_NAME}|"
  WSGI_PATH="s|(WSGIScriptAlias .* ).*|\1${WSGI_PATH}|"
  # Perform the substitution
  ${SED_BIN} -i.backup -E "${SERVER_ROOT};${CUSTOM_LOG};${ERROR_LOG};${DAEMON_PROCESS};${PYTHON_PATHS};${PROCESS_GROUP};${WSGI_PATH}" ${APACHE_CONF}
else
  log "\"sed\" not found! Apache configuration not changed."
fi

section "Restart Apache server"
${APP_PATH}/apache2/bin/restart || exit 1
