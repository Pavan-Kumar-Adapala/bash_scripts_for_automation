#!/bin/bash

# This script used to backup the directories to a timestamped tar.gz file. This script also schedule using cronjob.

# Prompt to enter the directories to backup with timestamp
read -p "Enter the directories full path with space seperation to backup: " DIRECTORIE_NAMES
IFS=' ' read -ra DIRECTORIES_ARR <<< ${DIRECTORIE_NAMES}
# echo "${DIRECTORIES_ARR[@]}"

BACKUP_FOLDER="/home/pavan-kumar/backup_folder"
TIME_STAMP=$(date "+%y-%m-%d_%H:%M:%S")
# echo "${TIME_STAMP}"

if [[ "${#DIRECTORIES_ARR[@]}" -eq 0 ]]
then
	echo "Provide Directories. No Directories found."
	exit 1
fi

for dir_name in ${DIRECTORIES_ARR[@]}
do
	echo "dir name: ${dir_name}"
	# Check the directory existed or not
	if [[ ! -d "${dir_name}" ]]
	then
		echo "${dir_name} not existed in the server."
	fi

	# Generate backup filename
    	backup_filename=$(basename "${dir_name}")
    	if [[ -z "${backup_filename}" ]]
	then
        	backup_filename="rootbackup"
    	fi

    	# Create the backup
    	tar_file="${BACKUP_FOLDER}/${backup_filename}_${TIME_STAMP}.tar.gz"
    	echo "Creating backup file: ${tar_file}"

    	tar cvfz ${tar_file} ${dir_name} &>/dev/null

	if [[ $? -eq 0 ]]
	then
		echo "Backup folder ${tar_file} created successfully."
	else
		echo "Backup folder ${tar_file} not created."
	fi
done

