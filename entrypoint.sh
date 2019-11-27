#!/bin/sh
while IFS= read -r line
do
    latexmk -pdf -interaction=nonstopmode -f $line
done < .fileToCompile
