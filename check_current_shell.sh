#!/bin/bash

# Current shell and correspounding PID
echo -e "Current working shell: \n $(ps -p $$ -o pid,tty,time,cmd)"

# Debug Nested Shells Using pstree to visualize the shell hierarchy:
echo -e "Shell hierarchy: \n $(pstree -sp $$)"
