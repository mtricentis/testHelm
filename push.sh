#!/bin/sh -ex

GIT_USERNAME=mtricentis
GIT_EMAIL=mtricentis@github.com
DEPLOY_URL=github.com/mtricentis/actions2
      
git clone https://.:$API_TOKEN_GITHUB@github.com/mtricentis/testHelm target
echo ' testHelm directory'
pwd
ls -ltr
git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"
git clone https://.:$API_TOKEN_GITHUB@github.com/mtricentis/actions2 actions2
echo ' After Clone '
cd actions2
ls -ltr
cp /home/runner/work/testHelm/testHelm/target/test2.txt .
git remote set-url origin https://github.com/mtricentis/actions2
git branch -ra
git remote -v
git add --all
git commit -m "Github Actions Automatically Built in `date +"%Y-%m-%d %H:%M"`"
pwd
git push origin main:main --force 
