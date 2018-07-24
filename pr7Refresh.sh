#!/bin/sh
export DSPACE_SRC=/c/Users/twb27/Documents/GitHub/DSpace7
cd $DSPACE_SRC

git fetch --all

#delete any local changes
git checkout -- .

#pull PR updates
git fetch DSpace

#reset master from DSpace

git checkout master
git pull DSpace master
git clean -df

#delete testing branch
git branch -D test-prs

#recreate testing branch
git checkout -b test-prs

echo "-------------------------------------"
echo "git merge origin/pr/xxxx"
echo "-------------------------------------"

#git merge origin/pr/2041
#git merge origin/pr/1926
