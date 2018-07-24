#!/bin/sh
export DSPACE_SRC=/c/Users/twb27/Documents/GitHub/DSpace5
cd $DSPACE_SRC

DSPACEBRANCH=${DSPACEBRANCH:-dspace-5_x}
echo "-----------------------------------------"
echo "DSPACEBRANCH=${DSPACEBRANCH}"
echo "  ---"
git fetch --all
git checkout ${DSPACEBRANCH} -f
git clean -df
git pull origin ${DSPACEBRANCH}
echo "-----------------------------------------"
