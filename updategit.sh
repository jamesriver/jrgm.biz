#!/bin/bash
clear
git remote -v
git remote set-url origin /c/inetpub/websites/jrgm.biz
git stash
git pull origin master
git remote set-url origin https://github.com/jamesriver/jrgm.biz
