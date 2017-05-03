#!/usr/bin/env bash

cd $(dirname ${0})

source `pwd`/utils/set_paths.sh
source ${UTILS_PATH}/log_messages.sh

if [ ! -f ${PROJECT_PATH}/app.json ]; then
  log "\"app.json\" not found."
  log "Check \"https://github.com/dewayinc/bare-django-repo/blob/master/docs/APPJSON.md\" for more info about \"app.json\" file."
fi

section "Check dependencies"
${UTILS_PATH}/check_dependencies.sh
check_error $?

section "Set project's environment variables"
touch ${APP_PATH}/.env
cp ${APP_PATH}/.env ${PROJECT_PATH}
check_error $?

section "Activate the virtual environment"
cd ${PROJECT_PATH}
${UTILS_PATH}/prepare_env.sh
source ${APP_PATH}/env/bin/activate
check_error $?
log $(python --version 2>&1) # Solution source: http://stackoverflow.com/a/23862813/4694834
log "$(pip --version)"

${UTILS_PATH}/install_requirements.sh
check_error $?

${UTILS_PATH}/run_commands.sh
check_error $?

${UTILS_PATH}/restart_server.sh
check_error $?

success "Deployment performed successfully!"
