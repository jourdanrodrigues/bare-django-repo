#!/usr/bin/env bash

source ${UTILS_PATH}/log_messages.sh

APACHE_CONF=${APP_PATH}/apache2/conf/httpd.conf

# Change old Python path or old Python home to this project configuration
if [ ${SED_BIN} ]; then
  WSGI_PATH=$(find ${PROJECT_PATH} -not -path "*$(basename ${BACKUPS_PATH})*" -name "wsgi.py")

  ${SED_BIN} -ire 's|python-path.*|python-path='${PROJECT_PATH}' python-home='${APP_PATH}'/env|;s|WSGIScriptAlias /.*|WSGIScriptAlias / '${WSGI_PATH}'|' ${APACHE_CONF}
else
  log "\"sed\" not found! Apache configuration not changed."
fi

section "Restart Apache server"
${APP_PATH}/apache2/bin/restart || exit 1
