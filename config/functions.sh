#!/bin/bash

# This function checks if a variable is equal to a value
function check_var() {
	local var=$1
	local val=$2

	# Replaced 'x-hack' with modern conditional check
	if [[ ${var} == "${val}" ]]; then
		echo "Variable is equal to value"
	else
		echo "Variable is not equal to value"
	fi
}

# This function checks if a directory exists
function check_dir() {
	local dir=$1

	# Replaced 'x-hack' with modern conditional check
	if [[ -d ${dir} ]]; then
		echo "Directory exists"
	else
		echo "Directory does not exist"
	fi
}
