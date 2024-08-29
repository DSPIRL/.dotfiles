#!/usr/bin/env bash

# set -x
#^ Debug
read -p "Enter your name: " varName
read -p "Enter your email: " varEmail
read -p "Enter default branch name (main/master): " varBranchName
read -p 'Are you using MacOS, Linux, or Windows? (M/L/W): ' varOS
read -p "Enter path to default editor: " varEditorPath

if [ "$varOS" = "M" ] || [ "$varOS" = "m" ]; then
    git config --global core.autocrlf input
elif [ "$varOS" = "L" ] || [ "$varOS" = "l" ]; then
    git config --global core.autocrlf input
elif [ "$varOS" = "W" ] || [ "$varOS" = "w" ]; then
    git config --global core.autocrlf true
else
    echo "No OS provided"
fi





if [[ $varName = "" ]]; then
    echo "No name provided"
else
    git config --global user.name "$varName"
fi


if [[ $varEmail = "" ]]; then
    echo "No email provided"
else
    git config --global user.email "$varEmail"
fi


if [[ $varBranchName = "" ]]; then
    echo "No branch name provided"
else
    git config --global init.defaultBranch "$varBranchName"
fi


if [[ $varEditorPath = "" ]]; then
    echo "No editor path provided"
else
    git config --global core.editor "$varEditorPath"
fi

