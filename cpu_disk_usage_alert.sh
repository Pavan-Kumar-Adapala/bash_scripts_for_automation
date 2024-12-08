#!/bin/bash

function get_cpu_usage() {
	
	local cpu_usage

	cpu_usage=$(top -b -n1 | grep "Cpu(s)" | awk '{print 100 - $8}')
	
	echo "${cpu_usage}" # return value
}

function get_disk_free_space() {
	
	local disk_path="$1"
	# check the path is not empty
	if [[ -z "${disk_path}" ]]
	then
		echo "Disk path is empty. Please provide path."
		return 1
	fi	
	disk_usage=$(df -h "${disk_path}" | grep "${disk_path}" | awk '{print $4}' | sed -e 's/G//')
	# disk_usage=$(df -h "${disk_path}" | awk 'NR==2 {gsub("G", "", $4); print $4}')
	echo "${disk_usage}" # return value
}

function get_memory_free_space() {
	
	# mem_usage=$(top -b -n1 | grep "MiB Mem" | awk '{print $6}')
	mem_usage=$(free -m | awk 'NR==2 {print $4}')
	# mem_usage=$(free | grep "Mem:" | awk '{print $4 / 1024}')
	echo "${mem_usage}" # return value
}

function get_health_status() {
	# prompt user to provide disk full path
	read -p "Enter the full path of the disk: " DISK_PATH

	local CPU_USAGE=$(get_cpu_usage) # %
	local DISK_USAGE=$(get_disk_free_space "${DISK_PATH}") # In GB
	local MEM_USAGE=$(get_memory_free_space) # In MB

	if [[ "${DISK_USAGE}" -lt 3  && "${MEM_USAGE}" -lt 512 ]]
	then
		echo -e "WARNING: Low system resource: \n cpu usage: ${CPU_USAGE} \n disk usage: ${DISK_USAGE} \n memory usage: ${MEM_USAGE}"
	
	elif [[ "${DISK_USAGE}" -lt 3 ]]
	then
		echo -e "WARNING: Low disk space available: \n cpu usage: ${CPU_USAGE} \n disk usage: ${DISK_USAGE} \n memory usage: ${MEM_USAGE}"
	
	elif [[ "${MEM_USAGE}" -lt 512 ]]
	then
		echo -e "WARNING: Low memory available: \n cpu usage: ${CPU_USAGE} \n disk usage: ${DISK_USAGE} \n memory usage: ${MEM_USAGE}"
	
	else
		echo -e "System resources are under good conditions: \n cpu usage: ${CPU_USAGE} \n disk usage: ${DISK_USAGE} \n memory usage: ${MEM_USAGE}"
	fi
}

function send_email_notification() {
	local EMAIL
	local EMAIL_BODY=$(get_health_status)
	echo "email body: ${EMAIL_BODY}"
	
	# Email sending
	if [[ $? -eq 0 ]]
	then
		# prompt to enter email address
        	read -p "Enter email address: " EMAIL
		echo -e "${EMAIL_BODY}" | mail -s "System Alert" "${EMAIL}"
		if [[ $? -eq 0 ]]
		then
			echo "Sending email is completed."
		else
        		echo "Failed to send email. Please check your mail configuration."
		fi
	fi
}

send_email_notification
