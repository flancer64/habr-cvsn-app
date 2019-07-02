#!/usr/bin/env bash
##
#   Rebuild JS project (w/o VCS).
##
# current directory where from script was launched (to return to in the end)
DIR_CUR="$PWD"
# root directory (relative to the current shell script, not to the execution point)
DIR_ROOT=${DIR_ROOT:=`cd "$( dirname "$0" )/" && pwd`}

echo "Remove installed dependencies and lock file."
rm -fr ${DIR_ROOT}/node_modules ${DIR_ROOT}/package-lock.json

echo "Re-install JS project."
cd ${DIR_ROOT}
npm install

cd ${DIR_CUR}
echo "Done."