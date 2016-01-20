#!/bin/bash
currentUser=$(/usr/bin/python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')
computerHostname=$(hostname)
dateTime=$(date +%F_%H-%M-%S)
archiveName="$computerHostname-logs.$dateTime"
outputDirectory="/Users/$currentUser/Desktop/"

expect <<- DONE
  set timeout -1
  spawn sysdiagnose -b -d -f "$outputDirectory" -A "$archiveName"
  expect "*?ontinue*"
  send -- "\r"
  expect eof
DONE
chown "$currentUser:staff" "$outputDirectory$archiveName.tar.gz"

exit 0
