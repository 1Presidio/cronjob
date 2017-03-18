#!/bin/bash
#url=$1

#echo $1 | grep -o "https://www.*.*" > /dev/null

#if [ $? -gt 0 ]; then
#    echo "Bad Url"
#    exit 0
#fi

if [ ! -f  info.txt ];
	then touch ~/info.txt
fi

touch tmp.txt

curl -s "$url" 2> /dev/null > tmp.txt


#grep -o '<title>.*</title>' tmp.txt  >> info.txt
#grep -o '\<!doctype.*\> '   tmp.txt  >> info.txt


echo "Current Login Name" >> info.txt
logname         >> info.txt

echo "\nlines, words, bytes" >> info.txt
wc -cwl tmp.txt >> info.txt

echo "\nDay, Month, Time, Timezone, Year" >> info.txt
date            >> info.txt

echo "\n Free Space " >> info.txt
df -aH          >> info.txt

echo "\n%JOBID, PID, Status, Name" >> info.txt
jobs            >> info.txt

echo "\nLast 10 commands" >> info.txt
history | tail  >> info.txt

echo "\nDisk Utility of ." >> info.txt
du -sh          >> info.txt

echo "\nCurrent Environment" >> info.txt
env             >> info.txt

echo "\nActivity Monitor" >> info.txt
top -u | head   >> info.txt

echo "\nCPU and io statistics" >> info.txt
iostat          >> info.txt

echo "\nDU Quota" >> info.txt
quota -q        >> info.txt

echo "\nFS status" >> info.txt
stat -xtql      >> info.txt  

echo "\nUptime" >> info.txt
uptime          >> info.txt

echo "\nCurrent Users" >> info.txt
users           >> info.txt
who             >> info.txt

echo "\nList . Symlinks" >> info.txt
find . -maxdepth 1 -type l -ls >> info.txt

echo "\nRunning Processes" >> info.txt
ps gv           >>info.txt

if [ $? -gt 0 ]; then
    echo "Bad Job Status"
    > info.txt 
fi

echo "\n" >> info.txt
rm tmp.txt

exit 0
