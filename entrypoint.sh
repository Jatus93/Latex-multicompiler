#!/bin/sh
cd /github/workspace
mkdir Documents
while IFS= read -r texfile
do
    docName="$(dirname $texfile)"
    latexmk -pdf -interaction=nonstopmode $texfile
    if [ "$1" == "-r" ]; then
      mv main.pdf ./Documents/$docName.pdf
    fi
done < .fileToCompile

if [ "$1" == "-r" ]; then
  tar -czvf Documents.tar.gz Documents/*
fi
