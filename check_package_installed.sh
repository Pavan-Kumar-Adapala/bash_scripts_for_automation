#!/bin/bash

source /home/pavan-kumar/bash_scripts/check_linux_distribution.sh # import .sh file
source /home/pavan-kumar/bash_scripts/install_package.sh 

distribution_name=$(check_fetch_distribution_name) # Function call
echo "${distribution_name}"

# Prompt the message to enter the packages
read -p "Enter package names with space: " package_names
# conver input string to an array
IFS=' ' read -ra packages <<< "${package_names}" # IFS-Internal field seperator
echo "Entered packages List: ${packages[@]}"


# Define package manager and package query command based on the Linux distribution
case ${distribution_name,,} in
	"ubuntu" | "debian")
		package_manager="apt"
		package_query_command="dpkg-query -W -f='\${status}'"
		;;
	"rhel" | "centos" | "fedora" | "almalinux" | "rocky")
		package_manager="yum"
		package_query_command="rpm -q"
		;;
	*)
		echo "Error: Unsupported Liunx Distribution."
		exit 1
		;;
esac

# Check if the packages are installed
for package in "${packages[@]}"
do
	if ${package_query_command} ${package} &> /dev/null
	then
		echo "${package} is installed."
	else
		echo "${package} is not installed."
		
		if $(confirm_package_instllation)
		then
			sudo ${package_manager} install -y ${package}

			if [[ $? -eq 0 ]]
			then
				echo "Installation successful."
			else
				echo "Installation un-successful."
			fi
		else
			echo "Installation not required."
		fi
	fi
done	
