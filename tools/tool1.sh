#!/bin/bash

# This script has been modified to remove the 'x-hack' and replace it with a more reliable alternative.

# Original code with 'x-hack'
# if [ "x$var" = "xval" ]; then
#     echo "Variable is equal to value"
# fi

# Modified code without 'x-hack'
if [[ ${var} == "val" ]]; then
	echo "Variable is equal to value"
fi

# Original code with 'x-hack'
# if [ "x$var" = "xval/" ]; then
#     echo "Variable is equal to directory"
# fi

# Modified code without 'x-hack'
if [[ ${var} == "val/" ]]; then
	echo "Variable is equal to directory"
fi
