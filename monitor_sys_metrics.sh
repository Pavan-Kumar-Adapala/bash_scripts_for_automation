#!/bin/bash

# This script used to write system metrics into log file for montoring purpose

# Set output file to store log information
LOG_FILE="/var/log/monitor.log"

# Set Monitoring interval in seconds
INTERVEL=10

# Function to get CPU usage
function get_cpu_usage() {
	local cpu_usage=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}')
	echo "CPU usage: ${cpu_usage}%"
}

# Function to get memory usage
function get_mem_usage() {
	local mem_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
	echo "Memory usage: ${mem_usage}%"
}

# Function to get disk usage
function get_disk_usage() {
	local disk_usage=$(df -h / | grep "/" | awk '{print $5}')
	echo "Disk usage: ${disk_usage}"
}

# Main monitoring loop
while true
do
	TIMESTAMP=$(date "+%y-%m-%d %H:%M:%S")
	# Get system metrics
	CPU_USAGE=$(get_cpu_usage)
	MEMORY_USAGE=$(get_mem_usage)
	DISK_USAGE=$(get_disk_usage)

	# output to log file
	echo "[${TIMESTAMP}]  ${CPU_USAGE} | ${MEMORY_USAGE} | ${DISK_USAGE}" >> ${LOG_FILE}

	# wait for the interval
	sleep ${INTERVEL}
done
