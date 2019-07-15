#!/bin/bash
cd /Library/Fonts
curl -o font_archive.bz2 'Download_URL_here'
sleep 3
mkdir OrgName_Fonts
tar -jxvf font_archive.bz2 OrgName_Fonts
sleep 1
rm font_archive.bz2
