#!/bin/bash

[[ -z "$(git status -uno --porcelain)" ]] && echo "-- branch is clean, no need to commit any changes" >> /config/commit_changes.log && exit 0;

echo "-- changes detected. committing and pushing"

cd /config
git add .
git commit -m "config update - $(date +'%d-%m-%Y %H:%M:%S')" >> /config/commit_changes.log
git push -u origin main >> /config/commit_changes.log

# TODO: send notification
echo "-- changes committed & pushed" >> /config/commit_changes.log
