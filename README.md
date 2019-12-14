# Latex multicompiler
This action compiles multiple latex files in your project

## Inputs
**required** `pathToList: <<listOfDocuments>>` is the path to your documents list.
[Here](#Example-of-listOfDocuments) an example

## Options
**build** `artifact: true` used to create a package, with the documents.

## Outputs
Result of the command latexmk -pdf -interaction=nonstopmode main.tex
if the build option is enabled, there would be a Documents.tar.gz

## Example of basic workflow

```yaml
name: Latex-multicompiler

on:
  push:
    branches:
      - 'master'
jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository contents
      uses: actions/checkout@v1

    - name: Latex compiler
      uses: Jatus93/Latex-multicompiler@master
      with:
        path_to_list: <<listOfDocuments>>
```
### To create an archive you need to add to after pathToList
```yaml
        artifact: true

```
## Example of listOfDocuments

```
Dir/subdir/DocumentName
Dir/subdir/DocumentName1
Dir/subdir/DocumentName2
ecc
```
# N.B. The directory structure should be Dir/subdir/DocumentName/main.tex

### Docker image based on on [danteev/texlive](https://github.com/dante-ev/docker-texlive)
