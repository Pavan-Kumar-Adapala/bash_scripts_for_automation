#!/bin/bash

# This script reads user names from the file and creates users.
read -p "Enter the user names file path: " file_path

# Read user details and store them in an array
user_details=($(awk -F "=" '{print $2}' "$file_path"))
# echo "${user_details[@]}"

# Delete user function
function delete_user() {
	local user_name="$1"

	sudo userdel -r ${user_name}

	if [[ $? -eq 0 ]]
	then
		echo "${user_name} user deleted successfully."
	else
		echo "${user_name} user not deleted."
	fi
}


# Check user existed or not. if not create user
for user in "${user_details[@]}"
do
	if [[ $(id -u "${user}") ]]
	then
		echo "${user} user already existed."

		# Prompt to delete the user
		read -p "Do you want to delete the ${user} (y/n)?: " choice

		if [[ ${choice} == "y" ]]
		then
			delete_user "${user}"
		fi
	else
		echo "${user} not existed."

		# Create user
		sudo useradd -m ${user}
		if [[ $? -eq 0 ]]
		then
			echo "${user} user created successfully."
		else
			echo "Error in creating the ${user} user."
		fi
	fi
done
