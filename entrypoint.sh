#!/bin/sh
[ -d "/github/workspace" ] && cd "/github/workspace"
while IFS= read -r line
do
    latexmk -pdf -interaction=nonstopmode ${line}/main.tex
done < .fileToCompile