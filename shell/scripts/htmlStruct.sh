#!/usr/bin/env bash

# Define paths
indexFile="index.html"
cssFile="style.css"
jsFile="app.js"
cssFolder="css"
jsFolder="js"
upDir=".."

mkdir "$cssFolder"
mkdir "$jsFolder"
touch "$indexFile"
cd "$jsFolder"
touch "$jsFile"
cd "$upDir"
cd "$cssFolder"
touch "$cssFile" || exit
echo "File structure setup."
