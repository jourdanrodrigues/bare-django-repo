#!/usr/bin/env bash

cd $(dirname ${0}) # Guarantee this file location as the working directory
HERE_PATH=$(pwd)

# "-a" parameter to check for pip
while getopts :a opt; do [ ${opt} == a ] && export CHECK_PIP=true; done

source ${HERE_PATH}/utils/set_paths.sh
source ${UTILS_PATH}/log_messages.sh

# Create a "redeploy.sh" file to manually run the deploy.
echo "`pwd`/$(basename ${0}) -a 2>&1 | ${SAVE_TO_LOG}" > ${APP_PATH}/redeploy.sh && chmod +x ${APP_PATH}/redeploy.sh

if [ ! -f ${PROJECT_PATH}/app.json ]; then
  section "\"app.json\" not found."
  log "Check \"https://github.com/dewayinc/bare-django-repo/blob/master/docs/APPJSON.md\" for more info about \"app.json\" file."
fi

section "Check dependencies"
source ${UTILS_PATH}/check_dependencies.sh || exit 1 # Source because it brings the bin variables

section "Set project's environment variables"
[ ! -f ${APP_PATH}/.env ] && echo "PRODUCTION=1" >> ${APP_PATH}/.env
cp ${APP_PATH}/.env ${PROJECT_PATH} || exit 1

cd ${PROJECT_PATH}
${FEATS_PATH}/prepare_env.sh
section "Activate the virtual environment"
source ${APP_PATH}/env/bin/activate || exit 1
log "$(pip --version)"

${FEATS_PATH}/install_requirements.sh || exit 1

${FEATS_PATH}/run_commands.sh || exit 1

${FEATS_PATH}/restart_server.sh || exit 1

if [ -f ${PROJECT_PATH}/app.json ]; then
  # Put the "app.json" in the app path to keep the last configuration to compare in the next build
  cp ${PROJECT_PATH}/app.json ${APP_PATH}
fi

cp ${HERE}/version ${HERE}/version.backup

success "Deployment performed successfully!"

exit 0
