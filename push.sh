#!/bin/sh

# Check if message supplied
if [ -z "$1" ]; then
	message="Auto-commit from $USER@$(hostname -s) on $(date)"
else
	message="$1"
fi
	
# Git add / commit / push
GIT=`which git`
${GIT} config --global user.name "DimitriDaSilva"
${GIT} config --global user.email dimitri.gomes.da.silva@gmail.com
${GIT} add --all .
${GIT} commit -m "$message"

gitPush=$(${GIT} push -vvv https://github.com/DimitriDaSilva/42Lisbon_lvl_03_libasm master 2>&1)
echo "$gitPush"
