#!/usr/bin/env bash

# Solution source: https://community.webfaction.com/questions/18791/why-can-my-virtualenv-still-see-system-site-packages/18792
touch ${APP_PATH}/env/lib/python2.7/sitecustomize.py
