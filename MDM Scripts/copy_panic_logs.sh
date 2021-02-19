#Run as user since the command puts a file on the users desktop.
sudo -u $(stat -f "%Su" /dev/console) /bin/sh <<'END'

#Get Panic Logs and Put them on Desktop
#Move to log directory
cd /Library/Logs/DiagnosticReports

#Compress panic files
zip -R panic_logs '*.panic';

#Move Zip to Desktop
mv panic_logs.zip /Users/$USER/Desktop ;

FILE2=/Users/$USER/Desktop/panic_logs.zip
if [ -f "$FILE2" ]; then
    echo "$FILE2 exists on desktop."
else
    echo "$FILE2 does not exist."
fi
