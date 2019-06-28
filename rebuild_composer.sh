#!/usr/bin/env bash
# root directory (relative to the current shell script, not to the execution point)
# http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_02
DIR_ROOT=${DIR_ROOT:=`cd "$( dirname "$0" )/" && pwd`}

echo "Remove installed dependencies and lock file."
rm -fr ${DIR_ROOT}/vendor ${DIR_ROOT}/composer.lock

echo "Re-install dependencies."
composer install