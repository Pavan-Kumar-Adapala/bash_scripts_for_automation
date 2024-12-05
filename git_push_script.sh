#!/bin/bash

# Check and fetch OS name
source $(pwd)/check_linux_distribution.sh # importing shell script file
echo "$(pwd)/check_linux_distribution.sh"


# Check git installed in the server
if ! command -v git &> /dev/null
then
	# Get distribution name from the function
	distribution_name=$(check_fetch_distribution_name)
	echo "${distribution_name}"

	if [[ "${distribution_name,,}"  == "ubuntu" || "${distribution_name,,}" == "debian" ]] # ,, used to convert into lower case
	then
		read -p "Git not installed in the system. Do you want install git? (y/n): " confirm_install
		
		if [[ "${confirm_install,,}" == "y" ]]
		then
			sudo apt-get update && sudo apt-get install -y git
			echo "Git installed sucessfully ${distribution_name}."
		else
			echo "Aborting push. Git is not installed."
			exit 1
		fi

	elif [[ "${distribution_name,,}" == "rhel" || "${distribution_name,,}" == "centos" || "${distribution_name,,}" == "fedora" || "${distribution_name,,}" == "almalinux" || "${distribution_name,,}" = "rocky" ]]
	then
		read -p "Git not installed in the system. Do you want install git? (y/n): " confirm_install
		if [[ "${confirm_install,,}" == "y" ]]
		then
			sudo yum update && sudo yum install git
			echo "Git installed sucessfully ${distribution_name}."
		else
			echo "Aborting push. Git is not installed."
			exit 1
		fi

	else
		echo "ERROR: Unsupported Linux Distribution."
		exit 1
	fi
else
	echo "Git already installed."
fi


# Check if the user is logged in GitHub
if ! git config user.name &> /dev/null 
then
	echo "You are not logged-in to GitHub."
	read -p "Enter your github username: " github_username
	read -p "Enter your email address: " github_email
	read -p "Enter your github access token: " github_token
	git config --global user.name "${github_username}"
	git config --global user.email "${github_email}"
	git config --global user.password "${github_token}"
else
	echo "${github_username} user already logged-in."
fi

# Ensure that the current directory is a git repository
if ! git rev-parse --is-inside-work-tree &> /dev/null
then
	echo -e "Current working directory: \n $(pwd)"
	read -p "This directory is not a git repository. Do you want to initialize it? (y/n): " confirm_init
	if [[ "${confirm_init,,}" == "y" ]]
	then
		git init
	else
		echo "Aborting push. This directory is not a git repository."
		exit 1
	fi
fi

# Prompt user for remote name and URL
# read -p "Enter the remote name (e.g., origin): " remote_name
# git remote set-url origin https://${github_token}@github.com/Pavan-Kumar-Adapala/bash_scripts_for_automation.git

# read -p "Enter the remote repository URL: " remote_url
# Check if the remote already exit
#if git remote | grep -q "^${remote_name}$"
#then
#       	echo "ERROR: A remote with the name '${remote_name}' already exists."
#	echo "Use 'git remote remove ${remote_name}' to delete it or choose a different name."
#	exit 1
#fi
# remote not exit
#git remote add "${remote_name}" "${remore_url}"
#if [[ $? -eq 0 ]]
#then
#	echo "Remote added successfully."
#	git remote -v # to display list of remotes
#else
#	echo "ERROR: Failed to add remote. Please check the URL or try again."
#	exit 1
#fi

# Check for modified files and folders
modified_files=$(git status --porcelain)
if [[ -z "${modified_files}" ]]
then
	echo "No modified files or folders to push."
	exit 0
else
	echo "Modified files and folders: "
	echo "${modified_files}"
fi

# Prompt for confirmation
read -p "Do you want to push these changes to GitHub? (y/n): " confirm_push
if [[ "${confirm_push,,}" == "y" ]]
then
	git add . # Adding all modified files to staging area
	if [[ $? -eq 0 ]]
	then
		git status
		# Commit the changes
		read -p "Enter a commit message: " commit_message
		git commit -m ${commit_message}
		# Push changes
		# git push --set-upstream origin master
		# echo "$(git branch)" 
		git push origin master
		if [[ $? -eq 0 ]]
		then
			echo "Changes pushed to GitHub."
		else
			echo "Push not sucessful."
			# git remote remove ${remote_name}
			exit 1
		fi
	fi
else
	echo "Aborting push."
	exit 0
fi
