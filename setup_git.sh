#!/usr/bin/env bash

# set -x
#^ Debug
read -p "Enter your name: " varName
read -p "Enter your email: " varEmail
read -p "Enter default branch name: (main/master)" varBranchName
read -p 'Are you using MacOS or Linux? (M/L): ' varOS
read -p "Enter path to default editor: " varEditorPath

if [ "$varOS" = "M" ] || [ "$varOS" = "m" ]; then
    git config --global core.autocrlf input
elif [ "$varOS" = "L" ] || [ "$varOS" = "l" ]; then
    git config --global core.autocrlf input
else
    git config --global core.autocrlf true
fi

git config --global user.name "$varName"
git config --global user.email "$varEmail"
git config --global init.defaultBranch "$varBranchName"
git config --global core.editor "$varEditorPath"

