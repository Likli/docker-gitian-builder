#!/bin/bash
if [ -z "$1" ] 
then
	echo "ERROR: missing <projectname> parameter. e.g    ./build_builder.sh <projectname>"
	echo "make sure Dockerfile exists in path 'project/<projectname>/Dockerfile'"
else
	docker build -t builder -f project/$1/./Dockerfile .
fi
