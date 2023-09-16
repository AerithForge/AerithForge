#!/bin/bash

# This script is part of the Armbian build framework
# The purpose of this script is to perform functions related to tool2

# Function to perform task1
function task1() {
	# Old 'x-hack' conditional
	# if [ "x$var" = "xval" ]; then
	#     echo "Condition met"
	# fi

	# Replaced 'x-hack' with a more reliable alternative
	if [[ ${var} == "val" ]]; then
		echo "Condition met"
	fi
}

# Function to perform task2
function task2() {
	# Old 'x-hack' conditional
	# if [ "x$var" = "xval" ]; then
	#     echo "Condition met"
	# fi

	# Replaced 'x-hack' with a more reliable alternative
	if [[ ${var} == "val" ]]; then
		echo "Condition met"
	fi
}

# Call the functions
task1
task2
