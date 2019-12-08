#!/bin/sh
if [ "${INPUT_BUILD}" == true ]; then
  mkdir Documents
fi
while IFS= read -r path
do
    docName="${path%"${path##*[!/]}"}"
    docName="${docName##*/}"
    w_dir=${PWD}
    cd $path && latexmk -pdf -interaction=nonstopmode main.tex
    cd $w_dir;
    if [ "${INPUT_BUILD}" == true ]; then
      mv $path/main.pdf ./Documents/$docName.pdf
    fi
done < .fileToCompile

if [ "${INPUT_BUILD}" == true ]; then
  tar -czvf Documents.tar.gz Documents/*
fi
