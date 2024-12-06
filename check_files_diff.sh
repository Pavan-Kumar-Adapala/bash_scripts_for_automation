#!/bin/bash

# Prompt for first file
read -p "Enter the path to the first file: " file1

if [[ ! -f "${file1}" ]]
then
	echo "${file1} not existed."
	exit 1
fi

# Prompt for second file
read -p "Enter the path of the second file: " file2
if [[ ! -f "${file2}" ]]
then
	echo "${file2} not existed."
	exit 1
fi

# if [[ ! -f "${file1}" || ! -f "${file2}" ]]
# then
#	echo "Files not existed."
#	exit 1
# fi

# Prompt for the output file
read -p "Enter the path to the output file: " output_file

# compare both files
output_diff=$(diff -u "${file1}" "${file2}")

# check the output file is empty or not
if [[ -z "${output_diff}" ]]
then
	echo "No differences found."
else
	echo "${output_diff}" | grep -E '[\+\-]' | awk '{print NR, $0}' >"${output_file}"
fi
