#!/bin/bash

# First find the type of shell
echo "The shell interepreter ${SHELL}."

# Find the current user privileges

[ "$(id -u)" -eq 0 ] && echo "${USER} is Root User." || echo "${USER} is Non-root User." # ternary-like operator or short-circuit evaluation in shell scripting.

sudo -n true 2>/dev/null && echo "${USER} has passwordless sudo privileges." || echo -e "${USER} does not have passwordless sudo privileges."

# Simple way to check the sudo privileges of the user
sudo -l

[ $? -eq 0 ] && echo "User has root privileges." || echo "User doesn't have root privileges."

# If the user has sudo privileges, the output will display the allowed commands or indicate unrestricted access:
# User may run the following commands on this host:
#    (ALL : ALL) ALL
#
# If the user does not have sudo privileges, it will show an error:
# user is not in the sudoers file. This incident will be reported.

