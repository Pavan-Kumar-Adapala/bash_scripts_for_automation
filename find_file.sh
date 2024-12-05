#!/bin/bash

# Provide directory information
read -p "Enter the directory to search in: " search_dir

# Validate the provided directory
if [[ ! -d "${search_dir}" ]]
then
	echo "Provided Directory ${search_dir} not available."
	exit 1
fi

# Prompt for the file name to search for
read -p "Enter the file name to search for: " file_name

# Validate the provide file
# if [[ ! -f "${file_name}" ]]
# then
#	echo "Provided file not existed."
#	exit 1
# fi

# Set output file
output_file="search_results.txt"

# Search for the file in the specified directory
find "${search_dir}" -type f -name "${file_name}" > "${output_file}"

if [[ -s "${output_file}" ]]
then
	echo "Search results saved to ${output_file}."
else
	echo "No files found matching the search criteria."
	rm "${output_file}"
fi
