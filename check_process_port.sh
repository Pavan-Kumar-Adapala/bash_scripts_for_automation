#!/bin/bash

# Confirm to kill the process
function confirm_kill() {

	local pid="$1"
	local process="$2"
	local choice

	while true
	do
		read -p "Do you want to kill the process (${process}) with PID ${pid}? " choice

		case ${choice} in
			[Yy]*)
				return o
				;;
			[Nn]*)
				return 1
				;;
			*)
				echo "Please answer 'y' or 'n'."
				exit 1
		esac
	done
}

# Prompt process name
read -p "Enter the process name: " process_name

# check process name provided or not
if [[ -z "${process_name}" ]]
then
	echo "Provide process name."
	exit 1
fi

# check the process is running
# process_pid=$(pgrep -f "${process_name}")
process_pid=$(sudo ss -tulnp | grep ${process_name} | awk '{print $7}' | cut -d '=' -f2 | sed -e 's/,fd//')
process_port_no=$(sudo ss -tulnp | grep ${process_name} | awk '{print $5}' | sed -e 's/.*://g' -e 's/,.*//g')
process_status=$(sudo ss -tulnp | grep ${process_name} | awk '{print $2}')

echo "${process_name} processs ${process_status} on port number ${process_port_no} and process id is ${process_pid}"
if [[ -n "${process_pid}" ]]
then
	echo "${process_name} process is running with PIDs: ${process_pid}"
	# Ask if the user wants to kill the process
	for pid in ${process_pid}
	do
		if confirm_kill "${pid}" "${process_name}" # Function call -> return 0 or 1
		then
			kill "${pid}"
			echo "${process_name} process is killed and correspounding pid is ${pid}."
		else
			echo "Not killing process with PID ${pid}."
		fi
	done	
else
	echo "${process_name} process is not running."
fi

# Checking the provide port number Listening or not

read -p "Enter port number to check: " port

if netstat -tuln | grep -q ":${port}" 
then
	echo "Port ${port} is listening."
else
	echo "Port ${port} is not listening."
fi

# note: netstat and ss provide same inforamtion, but ss modern way.

