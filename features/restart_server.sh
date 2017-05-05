#!/usr/bin/env bash

source ${UTILS_PATH}/log_messages.sh

APACHE_CONF=${APP_PATH}/apache2/conf/httpd.conf

# Change old Python path or old Python home to this project configuration
if [ ${SED_BIN} ]; then
  ${SED_BIN} -ire 's|python-path.*|python-path='${PROJECT_PATH}' python-home='${APP_PATH}'/env|;s|WSGIScriptAlias /.*|WSGIScriptAlias / '$(find ${PROJECT_PATH} -name "wsgi.py")'|' ${APACHE_CONF}
else
  log "\"sed\" not found! Apache configuration not changed."
fi

section "Restart Apache server"
${APP_PATH}/apache2/bin/restart || exit 1
