#!/bin/bash

# Author: Pavan Kumar Adapala

# Get the kernel version
kernel_version=$(uname -r)

# Get the OS release information
if [[ -e /etc/os-release ]]
then
	. /etc/os-release
	os_name="${NAME}"
	os_version="${VERSION}"

elif [[ -e /etc/lsb-release ]];
then
	. /etc/lsb-release
	os_name="${DISTRIB_ID}"
	os_version="${DISTRIB_RELEASE}"
else
	echo "ERROR: Unable to determine the linux distribution."
	exit 1
fi

# Display the linux distribution, kernel version, and system information
echo "Linux Distribution: ${os_name}, ${os_version}."
echo "Kernel Version: ${kernel_version}."
echo "System Information: "
uname -a
