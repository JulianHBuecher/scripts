#!/bin/sh
set -euo pipefail

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

bold=$(tput bold)
normal=$(tput sgr0)

while getopts f:c:a: flag
do
	case "${flag}" in
		f) file=${OPTARG};;
		c) checksum=${OPTARG};;
		a) algorithm=${echo OPTARG | tr '[:lower:]' '[:upper:]'};;
	esac
done

# echo 'Enter file(-path) for the file to verify checksum and press [enter]:'

# echo 'Enter checksum and press [enter]:'

# echo 'Select verification algorithm and press [enter] (default: SHA256):'

echo "${bold}File:${normal} $file";
echo "${bold}Provided Checksum:${normal} $checksum"

if [[ -z ${algorithm+x} ]]
then
	algorithm='SHA256'
fi

echo "${bold}Algorithm:${normal} $algorithm"

file_checksum="$(openssl $algorithm $file | awk '{ print $2 }')"

if [[ $checksum = $file_checksum ]]
then
	echo "${bold}${Green}Checksums are equal!!!${Color_Off}${normal}"
else
	echo "${bold}${Red}Checksums are not equal!!!${Color_Off}${normal}"
fi
