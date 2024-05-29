#!/bin/bash

git add -u
git add pages
git commit -m "Update"
git branch -D backup
git checkout -b backup
git branch -D master
git checkout --orphan master
git add .
git commit -m "Update"

