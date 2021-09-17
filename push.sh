#!/bin/sh -ex

        GIT_USERNAME=mtricentis
        GIT_EMAIL=mtricentis@github.com
        DEPLOY_URL=github.com/mtricentis/actions2
      
        git clone https://.:${{ secrets.TOKEN }}@github.com/mtricentis/testHelm target
        #cp -r /home/runner/work/testHelm/testHelm/* target
        echo ' testHelm directory'
        #cd target
        pwd
        ls -ltr
        git config --global user.name "${{ env.GIT_USERNAME }}"
        git config --global user.email "${{ env.GIT_EMAIL }}"
        #cd /home/runner/work/
        #mkdir actions2
        #chmod 777 *
        #cd actions2
       
        #git remote rm origin
       
        #git clone https://.:${{ secrets.TOKEN }}@github.com/mtricentis/actions2 actions2
        git clone https://.:${{ secrets.TOKEN }}@github.com/mtricentis/actions2 actions2
        
        echo ' After Clone '
        cd actions2
        ls -ltr
        cp /home/runner/work/testHelm/testHelm/target/test2.txt .
        git remote set-url origin https://github.com/mtricentis/actions2
        git branch -ra
        git remote -v
        #git remote add --mirror=push https://github.com/mtricentis/actions2
        git add --all
        git commit -m "Github Actions Automatically Built in `date +"%Y-%m-%d %H:%M"`"
        #ssh -vT git@github.com
        
        pwd
        
        git push origin main:main --force 
        #git push --force --quiet "https://.:${{ secrets.TOKEN }}@${{ env.DEPLOY_URL }}" main:main
                
        #git push --force --quiet "https://github.com/mtricentis/actions2"
