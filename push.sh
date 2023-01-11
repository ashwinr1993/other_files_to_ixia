#!/bin/sh
cd ixia_presi
git init
git add --all
git commit -m "Initial Commit"
git remote add origin https://bitbucket.itg.ti.com/scm/dp83725_oa_ds/ixia_presi.git
git push -u origin master

git remote set-url origin https://bitbucket.itg.ti.com/scm/dp83725_oa_ds/ixia_presi.git
git push -u origin --all
git push origin --tags
