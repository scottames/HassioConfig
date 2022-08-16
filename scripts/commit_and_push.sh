#!/bin/bash

_LOG_FILE="/config/commit_and_push.log"
_DATE="$(date +'%d-%m-%Y %H:%M:%S')"

[[ -z "$(git status -uno --porcelain)" ]] && echo "-- ${_DATE}: branch is clean, no need to commit any changes" >> "${_LOG_FILE}" && exit 0;

echo "-- ${_DATE}: changes detected. committing and pushing" >> "${_LOG_FILE}"

cd /config
git add .
git commit -m "config update - ${_DATE}" >> /config/commit_changes.log
git push -u origin main >> "${_LOG_FILE}"

# TODO: send notification
echo "-- ${_DATE}: changes committed & pushed" >> "${_LOG_FILE}"
