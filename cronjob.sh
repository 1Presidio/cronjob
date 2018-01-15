#!/bin/bash

if [ ! -f  info.txt ];
	then touch ~/info.txt
fi

touch tmp.txt


echo "Current Login Name" >> info.txt
logname         >> info.txt

echo "Day, Month, Time, Timezone, Year" >> info.txt
date            >> info.txt

echo "Free Space " >> info.txt
df -aH          >> info.txt

echo "%JOBID, PID, Status, Name" >> info.txt
jobs            >> info.txt

echo "Last 10 commands" >> info.txt
history | tail  >> info.txt

echo "Disk Utility of ." >> info.txt
du -sh          >> info.txt

echo "Current Environment" >> info.txt
env             >> info.txt

echo "Activity Monitor" >> info.txt
top -u | head   >> info.txt

echo "CPU and io statistics" >> info.txt
iostat          >> info.txt

echo "DU Quota" >> info.txt
quota -q        >> info.txt

echo "FS status" >> info.txt
stat -xtql      >> info.txt

echo "Uptime" >> info.txt
uptime          >> info.txt

echo "Current Users" >> info.txt
users           >> info.txt
who             >> info.txt

echo "List . Symlinks" >> info.txt
find . -maxdepth 1 -type l -ls >> info.txt

echo "Running Processes" >> info.txt
ps gv           >>info.txt

if [ $? -gt 0 ]; then
    echo "Bad Job Status"
    > info.txt
fi

echo >> info.txt
rm tmp.txt
