#!/bin/sh
#####################################################################################################
#
# ABOUT THIS PROGRAM
#
# NAME
#	GoogleChromeInstall.sh -- Installs the latest Google Chrome version
#
# SYNOPSIS
#	sudo GoogleChromeInstall.sh
#
# ORIGINAL AUTHOR
# Joe Farage, 17.03.2015
####################################################################################################
#
# HISTORY
#
#	Version: 2.0
#
#	- Version 1 Joe Farage, 17.03.2015
# - Version 2: Andrew Wilde, 02.01/2021
#
####################################################################################################
# Script to download and install Google Earth.
# Only works on Apple Silicon (ARM) systems.

dmgfile="googlechrome.dmg"
volname="Google Chrome"
logfile="/Library/Logs/GoogleChromeInstallScript.log"

# The difference in URL is adding "universal"
url='https://dl.google.com/chrome/mac/universal/stable/GGRO/googlechrome.dmg'

# Are we running on Intel?
if [ '`/usr/bin/uname -p`'="arm" -o '`/usr/bin/uname -p`'="ARM" ]; then
		/bin/echo "--" >> ${logfile}
		/bin/echo "`date`: Downloading latest version." >> ${logfile}
		/usr/bin/curl -s -o /tmp/${dmgfile} ${url}
		/bin/echo "`date`: Mounting installer disk image." >> ${logfile}
		/usr/bin/hdiutil attach /tmp/${dmgfile} -nobrowse -quiet
		/bin/echo "`date`: Installing..." >> ${logfile}
		ditto -rsrc "/Volumes/${volname}/Google Chrome.app" "/Applications/Google Chrome.app"
		/bin/sleep 10
		/bin/echo "`date`: Unmounting installer disk image." >> ${logfile}
		/usr/bin/hdiutil detach $(/bin/df | /usr/bin/grep "${volname}" | awk '{print $1}') -quiet
		/bin/sleep 10
		/bin/echo "`date`: Deleting disk image." >> ${logfile}
		/bin/rm /tmp/"${dmgfile}"
else
	/bin/echo "`date`: ERROR: This script is for Apple Silicon Macs only." >> ${logfile}
fi

exit 0
