#!/bin/bash

##########################################################################
# A simple script for launching Docker Gitian Builder with options
# maintainer: mammix2@protonmail.com
##########################################################################

function fHeader() {
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "@ A simple script for launching Docker Gitian Builder with options @"
	echo "@ maintainer: mammix2@protonmail.com                               @"
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
	echo " "
}
function fStartInfo() {
	echo " "
	echo ">> Starting project: $1"
	echo ">> Building for platform: $2"
	echo " "
}
function fName_Error() {
	echo "@@@ Error @@@"
	echo "Missing <projectname> parameter. make sure project Dockerfile exists in path 'project/<projectname>/Dockerfile-<target platform>'"
	echo "Options: ./build_builder.sh <projectname> <target platform>"
	echo "Usage: ./build_builder.sh boostcoin win"
}
function fPlat_Error() {
	echo "@@@ Error @@@"
	echo "Missing <target platform> parameter."
	echo "Options: ./build_builder.sh <projectname> <target platform> [osx, win, linux]"
	echo "Example: ./build_builder.sh boostcoin win"
}
function fPlat_Incorrect() {
	echo "@@@ Error @@@"
	echo "Incorrect <target platform> parameter. make sure to specify [osx, win or linux] target platform"
	echo "Format: ./build_builder.sh <projectname> <target platform> [osx, win, linux]"
	echo "Example: ./build_builder.sh boostcoin win"
}
function fRun_Builder() {
	fHeader
	fStartInfo  $1 $2
	docker build -t builder -f project/$1/Dockerfile_$2 .	
}


if [ -z "$1" ]
then
	fName_Error
elif [ -z "$2" ]
then
	fPlat_Error
elif [[ $2 != "win" && $2 != "osx" && $2 != "linux" ]]
then
	fPlat_Incorrect
else
	fRun_Builder $1 $2
fi






