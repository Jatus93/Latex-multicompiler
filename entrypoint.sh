#!/bin/sh
cd "/github/home"
while IFS= read -r line
do
    latexmk -pdf -interaction=nonstopmode /github/home/${line}/main.tex
done < /github/home/.fileToCompile
