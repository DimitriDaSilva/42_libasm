#!/bin/sh

message="Auto-commit from $USER@$(hostname -s) on $(date)"
GIT=`which git`
#REPO_DIR=~/org
#cd ${REPO_DIR}
${GIT} add --all .
${GIT} commit -m "$message"

gitPush=$(${GIT} push -vvv https://github.com/DimitriDaSilva/42Lisbon_lvl_03_libasm master 2>&1)
echo "$gitPush"
