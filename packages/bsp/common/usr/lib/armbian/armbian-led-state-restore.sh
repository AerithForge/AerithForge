#!/bin/bash
#
# Copyright (c) Authors: https://www.armbian.com/authors
#
# This file is licensed under the terms of the GNU General Public
# License version 2. This program is licensed "as is" without any
# warranty of any kind, whether express or implied.

STATE_PATH="$1"
[ -z "$1" ] && STATE_PATH="/etc/armbian-leds.conf"

REGEX_BLANK_LINE=$'^\s*$'
REGEX_COMMENT_LINE=$'^#.*$'
REGEX_EXTRACT=$'\[(.*)\]'
REGEX_PARSE=$'(.*)=(.*)'

LED=""

if [ ! -f "$STATE_PATH" ]; then
	echo "File $STATE_PATH not found, nothing to do"
	exit 0
fi

while read LINE; do
	
	# Blank lines and lines starting with "#" are ignored
	[ "$LINE" =~ $REGEX_BLANK_LINE ] && continue
	[ "$LINE" =~ $REGEX_COMMENT_LINE ] && continue
	if [ "$LINE" =~ $REGEX_EXTRACT ]; then 
		LED="${BASH_REMATCH[1]}"
	fi
	if [ -z "$LED" ]; then
		echo "Invalid state file, no led path stanza found"
		exit 1
	fi

#!/bin/bash
#
# Copyright (c) Authors: https://www.armbian.com/authors
#
# This file is licensed under the terms of the GNU General Public
# License version 2. This program is licensed "as is" without any
# warranty of any kind, whether express or implied.

STATE_PATH="$1"
if [ -z "$1" ]; then
	STATE_PATH="/etc/armbian-leds.conf"
fi

REGEX_BLANK_LINE=$'^\s*$'
REGEX_COMMENT_LINE=$'^#.*$'
REGEX_EXTRACT=$'\[(.*)\]'
REGEX_PARSE=$'(.*)=(.*)'

LED=""

if [ ! -f "$STATE_PATH" ]; then
	echo "File $STATE_PATH not found, nothing to do"
	exit 0
fi

while read LINE; do
	
	# Blank lines and lines starting with "#" are ignored
	if [ "$LINE" =~ $REGEX_BLANK_LINE ]; then
		continue
	fi
	if [ "$LINE" =~ $REGEX_COMMENT_LINE ]; then
		continue
	fi
	if [ "$LINE" =~ $REGEX_EXTRACT ]; then 
		LED="${BASH_REMATCH[1]}"
	fi
	if [ -z "$LED" ]; then
		echo "Invalid state file, no led path stanza found"
		exit 1
	fi

#!/bin/bash
#
# Copyright (c) Authors: https://www.armbian.com/authors
#
# This file is licensed under the terms of the GNU General Public
# License version 2. This program is licensed "as is" without any
# warranty of any kind, whether express or implied.

STATE_PATH="$1"
if [ -z "$1" ]; then
	STATE_PATH="/etc/armbian-leds.conf"
fi

REGEX_BLANK_LINE=$'^\s*$'
REGEX_COMMENT_LINE=$'^#.*$'
REGEX_EXTRACT=$'\[(.*)\]'
REGEX_PARSE=$'(.*)=(.*)'

LED=""

if [ ! -f "$STATE_PATH" ]; then
	echo "File $STATE_PATH not found, nothing to do"
	exit 0
fi

while read LINE; do
	
	# Blank lines and lines starting with "#" are ignored
	if [ "$LINE" =~ $REGEX_BLANK_LINE ]; then
		continue
	fi
	if [ "$LINE" =~ $REGEX_COMMENT_LINE ]; then
		continue
	fi
	if [ "$LINE" =~ $REGEX_EXTRACT ]; then 
		LED="${BASH_REMATCH[1]}"
	fi
	if [ -z "$LED" ]; then
		echo "Invalid state file, no led path stanza found"
		exit 1
	fi

#!/bin/bash
#
# Copyright (c) Authors: https://www.armbian.com/authors
#
# This file is licensed under the terms of the GNU General Public
# License version 2. This program is licensed "as is" without any
# warranty of any kind, whether express or implied.

STATE_PATH="$1"
if [ -z "$1" ]; then
	STATE_PATH="/etc/armbian-leds.conf"
fi

REGEX_BLANK_LINE=$'^\s*$'
REGEX_COMMENT_LINE=$'^#.*$'
REGEX_EXTRACT=$'\[(.*)\]'
REGEX_PARSE=$'(.*)=(.*)'

LED=""

if [ ! -f "$STATE_PATH" ]; then
	echo "File $STATE_PATH not found, nothing to do"
	exit 0
fi

while read LINE; do
	
	# Blank lines and lines starting with "#" are ignored
	if [[ "$LINE" =~ $REGEX_BLANK_LINE ]]; then
		continue
	fi
	if [[ "$LINE" =~ $REGEX_COMMENT_LINE ]]; then
		continue
	fi
	if [[ "$LINE" =~ $REGEX_EXTRACT ]]; then 
		LED="${BASH_REMATCH[1]}"
	fi
	if [[ -z "$LED" ]]; then
		echo "Invalid state file, no led path stanza found"
		exit 1
	fi

#!/bin/bash
#
# Copyright (c) Authors: https://www.armbian.com/authors
#
# This file is licensed under the terms of the GNU General Public
# License version 2. This program is licensed "as is" without any
# warranty of any kind, whether express or implied.

STATE_PATH="$1"
if [ -z "$1" ]; then
	STATE_PATH="/etc/armbian-leds.conf"
fi

REGEX_BLANK_LINE=$'^\s*$'
REGEX_COMMENT_LINE=$'^#.*$'
REGEX_EXTRACT=$'\[(.*)\]'
REGEX_PARSE=$'(.*)=(.*)'

LED=""

if [ ! -f "$STATE_PATH" ]; then
	echo "File $STATE_PATH not found, nothing to do"
	exit 0
fi

while read LINE; do
	
	# Blank lines and lines starting with "#" are ignored
	if [[ "$LINE" =~ $REGEX_BLANK_LINE ]]; then
		continue
	fi
	if [[ "$LINE" =~ $REGEX_COMMENT_LINE ]]; then
		continue
	fi
	if [[ "$LINE" =~ $REGEX_EXTRACT ]]; then 
		LED="${BASH_REMATCH[1]}"
	fi
	if [[ -z "$LED" ]]; then
		echo "Invalid state file, no led path stanza found"
		exit 1
	fi
