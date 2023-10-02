#!/usr/bin/env bash

###! The entry file to the framework is an executable file used to interact with the framework
###!
###!     # ./framework-entry.sh OPTION=value ..
###!

set -e # Exit on False

# Metadata
# shellcheck disable=SC2034 # Metadata can be unused
{
	FRAMEWORK_MANAGER="Jacob Hrbek"
	FRAMEWORK_MANAGER_EMAIL="kreyren@proton.me"
	FRAMEWORK_NAME="AerithForge"
	FRAMEWORK_REPO="https://github.com/AerithForge/AerithForge"
	FRAMEWORK_WEBSITE="https://domain.tld"
	FRAMEWORK_WEBSITE_DOCS="https://docs.domain.tld"
	FRAMEWORK_SUPPORT="https://forum.domain.tld"
	FRAMEWORK_PRIVACY="https://www.domain.tld/privacy"
	FRAMEWORK_BUGS="https://www.domain.tld/bugs"
	FRAMEWORK_LoGO="aerithforge-logo"
	FRAMEWORK_DEFAULT_ROOT_PW="1234"
}

SRC="$(dirname "$(realpath "$0")")"
cd "$SRC"

# Source the libraries
# shellcheck source=./lib/library-functions.sh
. "$SRC/lib/library-functions.sh"

# DNR(Krey): Uncomment this for release
#[ "$(id -u)" = 0 ] || exit_with_error "This Framework is designed to execute with root priviledges"

# initialize logging variables. (this does not consider parameters at this point, only environment variables)
logging_init

# initialize the traps
traps_init

# Process CLI arguments
framework_initiate "$@"

# Log the last statement of this script for debugging purposes.
display_alert "Framework build script exiting" "very last thing" "cleanup"
