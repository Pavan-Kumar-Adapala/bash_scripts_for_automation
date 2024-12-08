#!/bin/bash

# Check and fetch OS name
function check_fetch_distribution_name() {
        if [[ -e /etc/os-release ]]
        then
                . /etc/os-release
                os_name="${NAME}"
                echo "${os_name}"

        # elif block for Linux Standard Base (LSB)
        elif [[ -e /etc/lsb-release ]]
        then
                . /etc/lsb-release
                os_name="${DISTRIB_ID}"
                echo "${os_name}"
        else
                echo "ERROR: Linux Distribution not found."
                exit 1
        fi
}

