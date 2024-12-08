#!/bin/bash

# Prompt to enter the log file
read -p "Enter the log file directory: " log_dir
read -p "Enter the log file full path: " log_file
retention_days=7           # Retention period in days
timestamp=$(date +%Y-%m-%d) # Current timestamp

# Check if the file exist or not
if [[ ! -e "${log_dir}/${log_file}" ]]
then
	echo "${log_file} file not existed."
	exit 1
fi

# Rotate logs
mv ${log_dir}/${log_file} ./${log_file}.${timestamp}
if [[ $? -eq 0 ]]
then
	echo "Log File rotated: ${log_file} ${log_dir}/${log_file}.${timestamp}"
else
	echo "Failed to rotate log file."
fi

# Create a new file with the same name in same directory, mail service stores the logs in the same file
touch "${log_dir}/${log_file}"
chmod 644 "${log_dir}/${log_file}"


# Use the find command to locate files and count the results
files_found=$(find "$log_dir" -name "${log_file}.*" -mtime +$retention_days -print -quit) # file count

# Delete the older log files
if [[ -n "$files_found" ]]
then
    find "$log_dir" -type f -mtime +$retention_days -exec rm -f {} \;
    echo "Files older than $retention_days days have been deleted."
else
    # No files found
    echo "No files older than $retention_days days exist in $log_dir."
fi
