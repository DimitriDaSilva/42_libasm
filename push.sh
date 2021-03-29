#!/bin/sh

message="Auto-commit from $USER@$(hostname -s) on $(date)"
GIT=`which git`
#REPO_DIR=~/org
#cd ${REPO_DIR}
${GIT} config --global user.name "dda-silv"
${GIT} config --global user.email dda-silv@student.42lisboa.com
${GIT} add --all .
${GIT} commit -m "$message"

gitPush=$(${GIT} push -vvv https://github.com/DimitriDaSilva/42Lisbon_lvl_03_libasm master 2>&1)
echo "$gitPush"
