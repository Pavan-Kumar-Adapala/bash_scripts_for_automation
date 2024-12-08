#!/bin/bash

function confirm_removed() {
	local file="$1"
	local size="$2"
	local confirmation

	while true 
	do
		read -p "Do you want to remove ${file} file (y/n) " confirmation

		case $confirmation in 
			[Yy]*)
				return 0
				;;
			[Nn]*)
				return 1
				;;
		esac
	done
	# read -p "Do you want to remove ${file} file (y/n) " confirmation
	# if [[ "${confirmation}" == "y" ]]
	# then
	#	return 0
	# else
	#	return 1
	# fi
}

# The script used to find top 5 files in the given directory
read -p "Provide directory full path to check the top 5 big files (Default is current directory): " dir_path
mapfile -t top_files < <(find ${dir_path} -type f -printf "%s %p\n" 2> /dev/null | sort -nr | head -n 5)

# Display the top 5 files
echo "The top 5 files: "
printf "%s\n" "${top_files[@]}"

# Read each file from the list of top 5 files
for file in "${top_files[@]}"
do
	size="$(echo "file" | cut -d ' ' -f1)"
	file_path="$(echo "file" | cut -d ' ' -f2)"

	# Prompt for confirmation to remove the file
	if confirm_removed "${file_path}" "${size}"
	then
		rm -rf "${file_path}"
		echo "${file_path} removed."
	else
		echo "Not removing the ${file_path}."
	fi
	
done
