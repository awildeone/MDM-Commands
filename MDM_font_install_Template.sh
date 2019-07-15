#!/bin/bash
#Will run all commands as the user
sudo -u $(stat -f "%Su" /dev/console) /bin/sh <<'END'
cd /Users/$USER/Library/Fonts
curl -o font_archive.bz2 'Download_URL_here'
sleep 1.5
mkdir OrgName_Fonts
tar -jxvf font_archive.bz2 OrgName_Fonts
sleep 1
rm font_archive.bz2
echo Fonts Installed under "/Users/$USER/Library/Fonts"
