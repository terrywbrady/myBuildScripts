#!/bin/sh
export DSPACE_SRC=/c/Users/twb27/Documents/GitHub/DSpace7
cd $DSPACE_SRC
DSPACEBRANCH=${DSPACEBRANCH:-master}

echo "-----------------------------------------"
echo "DSPACEBRANCH=${DSPACEBRANCH}"
echo "  ---"
git fetch --all
git checkout ${DSPACEBRANCH} -f
git clean -df
git pull origin ${DSPACEBRANCH}
echo "-----------------------------------------"
