#!/bin/bash
# This file contains the extension-name.sh script.

# Function to replace instances of 'x-hack' with modern conditional checks
replace_x_hack() {
	# Search for all instances of the 'x-hack' in the file
	sed -i 's/\[ "x\($[a-zA-Z_][a-zA-Z_0-9]*\)" = "x\($[a-zA-Z_][a-zA-Z_0-9]*\)" \]/[[ "${\1}" == "${\2}" ]]/g' extensions/extension-name.sh

	# Add comments explaining the change from 'x-hack' to modern conditional checks
	sed -i 's/\[ "x\($[a-zA-Z_][a-zA-Z_0-9]*\)" = "x\($[a-zA-Z_][a-zA-Z_0-9]*\)" \]/# Replaced 'x-hack' with modern conditional check: [[ "${\1}" == "${\2}" ]]/g' extensions/extension-name.sh
}

# Call the function to replace 'x-hack' with modern conditional checks
replace_x_hack
