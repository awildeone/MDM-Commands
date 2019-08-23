#Will run all commands as the user
sudo -u $(stat -f "%Su" /dev/console) /bin/sh <<'END'
cp -r /Library/Logs/CrashPlan/ /Users/$USER/Desktop/CrashplanBackup;
tar -jcvf Users/$USER/Desktop/CrashPlanBackupLogs.bz2 /Users/$USER/Desktop/CrashplanBackup;
rm -r /Users/$USER/Desktop/CrashplanBackup;
echo Logs Collected
