#!/bin/bash

read -p "Enter the threshold value: " THRESHOLD
TO_EMAIL="adapalapavan5@gmail.com"

while true
do
	# Get current CPU usage using mpstat (install with sudo apt-get install sysstat)
	# CPU_USAGE=$(mpstat 1 1 | awk '/Average/ {print 100 - $NF}')

	# Alternatively, use top if mpstat is not available:
	CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
	if (( $(echo "${CPU_USAGE} > ${THRESHOLD}" | bc -l) )) # bc -l used float values comparsion
	then
		echo "Alert: High CPU usage detected. ${CPU_USAGE}"
		echo "Sending email to ${TO_EMAIL}"
		#echo -e "High CPU usage detected on \nIP addr: $(ifconfig | grep inet | awk '{print $2}' | head -n 1)\nhostname: $(hostname)\nCPU usage value: ${CPU_USAGE}%"
		
		# Compose email content
		EMAIL_BODY="High CPU usage detected:\n
			IP Address: $(hostname -I | awk '{print $1}')\n
			Hostname: $(hostname)\n
			CPU Usage: ${CPU_USAGE}%"
		# Send email
        	echo -e "${EMAIL_BODY}" | mail -s "CPU Usage Alert" "${TO_EMAIL}"
        	echo "Email sent to ${TO_EMAIL}."
	else
		echo "CPU usage is normal."	
	fi

	sleep 60 # seconds
done

