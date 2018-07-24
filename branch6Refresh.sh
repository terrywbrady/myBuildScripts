#!/bin/sh
export DSPACE_SRC=/c/Users/twb27/Documents/GitHub/DSpace6
cd $DSPACE_SRC

DSPACEBRANCH=${DSPACEBRANCH:-dspace-6_x}
echo "-----------------------------------------"
echo "DSPACEBRANCH=${DSPACEBRANCH}"
echo "  ---"
git fetch --all
git checkout ${DSPACEBRANCH} -f
git clean -df
git pull origin ${DSPACEBRANCH}
echo "-----------------------------------------"
