#!/bin/sh
mkdir Documents
while IFS= read -r path
do
    docName="${path%"${path##*[!/]}"}"
    docName="${docName##*/}"
    w_dir=${PWD}
    cd $path && latexmk -pdf -interaction=nonstopmode main.tex
    cd $w_dir;
    if [ "$1" == "-r" ]; then
      mv $path/main.pdf ./Documents/$docName.pdf
    fi
done < .fileToCompile

if [ "$1" == "-r" ]; then
  tar -czvf Documents.tar.gz Documents/*
fi
