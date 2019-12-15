#!/bin/sh
if [ "${INPUT_ARTIFACT}" == true ]; then
  mkdir Documents
fi

declare -A failed
i=0
while IFS= read -r path || [ -n "$path" ]
do
    docName="${path%"${path##*[!/]}"}"
    docName="${docName##*/}"
    w_dir=${PWD}
    cd $path
    latexmk -pdf -interaction=nonstopmode main.tex
    result=$?
    if [ $result != 0 ]; then
       failed[i]=$docName
	     i=i+1
    fi
    cd $w_dir;
    if [ "${INPUT_ARTIFACT}" == true ]; then
          mv $path/main.pdf ./Documents/$docName.pdf
    fi
done < "${INPUT_PATH_TO_LIST}"

if [ "${INPUT_ARTIFACT}" == true ]; then
    tar -czvf Documents.tar.gz Documents/*
fi

if [ $i != 0 ]; then
    echo -e "\n The following documents could not be produced:"
    for x in "${failed[*]}"; do echo "- $x"; done
    exit 1
fi
exit 0
