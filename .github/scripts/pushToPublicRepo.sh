#!/bin/sh -ex

# Inspired from
#https://github.com/johno/actions-push-subdirectories/blob/master/entrypoint.sh#L10

FOLDER="$1"
GITHUB_USERNAME="$2"
GITHUB_REPO="$3"
GITHUB_TAG="$4"
#API_TOKEN_GITHUB="$4"


CLONE_DIR=output_clone
echo 'check current directory'
#make directory
mkdir /home/runner/work/$GITHUB_USERNAME
#chmod 777 *
cd /home/runner/work/$GITHUB_USERNAME
pwd
apt-get update && apt-get install git
#apt-get add --no-cache git


git config --global user.email "mtricentis@g.com"
git config --global user.name "$GITHUB_USERNAME"
git clone "https://$API_TOKEN_GITHUB@github.com/$GITHUB_USERNAME/$GITHUB_REPO.git" $CLONE_DIR

echo 'check current directory after Clone'

cd $CLONE_DIR
echo "After cd $CLONE_DIR"
git checkout -b newbranch
cp -r $FOLDER/* .
#cp -r . $CLONE_DIR

pwd
ls -ltr
sed -i 's/\(.*version:.*\)/version: 1.0/g' chart.yml


#git remote set-url origin2 https://$API_TOKEN_GITHUB@github.com/$GITHUB_USERNAME/$GITHUB_REPO.git
#git branch -ra
#git remote -v

#git tag $GITHUB_TAG

git add --all
git commit --message "Update from $GITHUB_REPOSITORY"

git push origin newbranch --force
#git push origin --tags

cd ..
echo "Done!"
