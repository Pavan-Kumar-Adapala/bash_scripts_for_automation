#!/bin/bash

function confirm_package_instllation() {
	# local package_manager="$1"
	local package="$1"
	local choice

	read -p "Do you want to install ${package} package? (y/n): " choice

	while true
	do
		case ${choice} in
			[Yy]*)
				return 0
				;;
			[Nn]*)
				return 1
				;;
			*)
				echo "Please enter y or n."
				;;
		esac
	done
}
