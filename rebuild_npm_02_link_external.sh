#!/usr/bin/env bash
##
#   Rebuild JS project with modules being placed to outer folders.
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

echo "Remove cloned dependencies (sources)."
rm -fr ${DIR_ROOT}/../habr-cvsn-mod-func
rm -fr ${DIR_ROOT}/../habr-cvsn-mod-base

echo "Clone dependencies from github to outer folders."
git clone https://github.com/flancer64/habr-cvsn-mod-func.git ${DIR_ROOT}/../habr-cvsn-mod-func
git clone https://github.com/flancer64/habr-cvsn-mod-base.git ${DIR_ROOT}/../habr-cvsn-mod-base

echo "Link dependencies to '/usr/lib/node_modules/'."
cd ${DIR_ROOT}/../habr-cvsn-mod-base
sudo npm link
cd ${DIR_ROOT}/../habr-cvsn-mod-func
sudo npm link


echo "Link dependencies to the project."
cd ${DIR_ROOT}
npm link habr-cvsn-mod-base
npm link habr-cvsn-mod-func

cd ${DIR_CUR}
echo "Done."