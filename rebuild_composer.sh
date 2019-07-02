#!/usr/bin/env bash
##
#   Rebuild PHP project.
##
# current directory where from script was launched (to return to in the end)
DIR_CUR="$PWD"
# root directory (relative to the current shell script, not to the execution point)
DIR_ROOT=${DIR_ROOT:=`cd "$( dirname "$0" )/" && pwd`}

echo "Remove installed dependencies and lock file."
rm -fr ${DIR_ROOT}/vendor ${DIR_ROOT}/composer.lock

echo "Re-install PHP project."
cd ${DIR_ROOT}
composer install

cd ${DIR_CUR}
echo "Done."