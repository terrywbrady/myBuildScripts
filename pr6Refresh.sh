#!/bin/sh
export DSPACE_SRC=/c/Users/twb27/Documents/GitHub/DSpace6
cd $DSPACE_SRC

git fetch --all

#delete any local changes
git checkout -- .

#pull PR updates
git fetch DSpace

#reset master from DSpace

git checkout dspace-6_x
git pull DSpace dspace-6_x
git clean -df

#git checkout master
#git pull DSpace master

#delete testing branch
git branch -D test-prs

#recreate testing branch
git checkout -b test-prs

echo "-------------------------------------"
echo "git merge origin/pr/xxxx"
echo "-------------------------------------"

#git pull DSpace tags/dspace-6.0
#git merge origin/pr/1862
#git merge origin/pr/1863
#git merge origin/pr/1854
#git merge origin/pr/1934
#git merge origin/pr/2082

#git checkout tags/dspace-6.0-rc3 -b test-prs-rc3
