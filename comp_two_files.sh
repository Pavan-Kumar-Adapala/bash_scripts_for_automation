#!/bin/bash

source /home/pavan-kumar/bash_scripts/confirm_remove_file.sh

function compare_two_files() {
	local file1="$1"
	local file2="$2"

	if [[ $(stat -c%s ${file1}) -gt $(stat -c%s ${file2}) ]]
	then
		echo "${file1} is the larger than ${file2}."
		confirm_removal "${file1}"
	else
		echo "${file2} is the larger than ${file1}."
		confirm_removal "${file2}"
	fi
}

# Provide Files information
read -p "Provide the first file name with full path: " file1_to_compare
read -p "Provide the second file name with full path: " file2_to_compare

# Check both files are exist or not
if [[ -e "${file1_to_compare}" && -e "${file2_to_compare}" ]]
then
	compare_two_files "${file1_to_compare}" "${file2_to_compare}"
else
	echo "Please provide 2 files two compare."
fi
