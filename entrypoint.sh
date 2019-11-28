#!/bin/sh
while IFS= read -r texfile
do
    latexmk -pdf -interaction=nonstopmode $texfile
done < .fileToCompile
