#!/bin/bash

function confirm_removal() {
	local file="$1"

	read -p "Do you want to remove the file? (y/n):  " choice

	while true
	do
		case ${choice} in
			[Yy]*)
				rm ${file}
				echo "${file} file removed."
				break
				;;
			[Nn]*)
				echo "Not removing ${file}."
				break
				;;
			*)
				echo "Please answer 'y' or 'n'."
				;;
		esac
	done
	#if [[ "${choice,,}" == "y" ]]
	#then
	#	rm ${file}
	#	echo "${file} file removed."
	#else
	#	echo "File not removed."
	#fi
}
