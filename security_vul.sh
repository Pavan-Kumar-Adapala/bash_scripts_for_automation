#!/bin/bash

# System vulnerability monitor script for linux

# Email settings
EMAIL="adapalapavan5@gmail.com"
SUBJECT="System vulnerability alert"

# Check if the user is root or has sudo privileges
if [[ "$(id -u)" != "0" ]]
then
	echo "This script must be run as root or with sudo privileges." >&2
	exit 1
fi

# Function to check for security updates on ubuntu/debian
function check_debian() {
	apt-get update > /dev/null
	UPDATES=$(apt-get -s upgrade | awk '/^Inst/ { if (NF > 4) print $2 " " $5; else print $2 " " $4}' | grep -i security)
	if [ -n "${UPDATES}" ]
	then
		echo "Security updates available:"$'\n'"${UPDATES}"
	fi
}

# Function to check for security updates on CentOS/RHEL
function check_centos() {
	yum check-update -q --security
	if [ $? -eq 100 ]
	then
		UPDATES=$(yum updateinfo list security -q | grep -v "updateinfo list done")
		echo "Security updates available: "$'/n'"$UPDATES"
	fi	
}

# Find Distribution
if [ -f /etc/os-release ]
then
	. /etc/os-release
	case ${ID,,} in
		"debian"|"ubuntu")
			UPDATE_INFO=$(check_debian)
			;;
		"centos"|"rhel")
			UPDATE_INFO=$(check_centos)
			;;
		*)
			echo "Unsupported disstribution: ${PRETTY_NAME}" >&2
			exit 1
			;;
	esac
fi

# Send email notification if secuirty updates available
if [ -n "${UPDATE_INFO}" ]
then
	echo "${UPDATE_INFO}" | mailx -s "${SUBJECT}" "${EMAIL}"
	echo "Security updates found, email sent."
else
	echo "No security updates found."
fi	
		
