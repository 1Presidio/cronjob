# Cronjob.sh
Simple Shell Script

This is a simple shell script I wrote that is meant to be run as a crontab.
It displays statistics including env, memory usage, disk usage etc... and can be run in the background at
a certain time.

# Note
The format of the time stamp of a crontab is 
> minute hour day-of-month month day-of-week command

# Setup
Download script and run the following command
```
(crontab -l 2>/dev/null; echo "*/15 * * * * /path/to/cronjob.sh -with args") | crontab -
```
By default the info.txt file is stored under the home directory to change this modify this snip of code in the shell script
```
    11	if [ ! -f  info.txt ];
    12		then touch /PUT/YOUR/PATH/HERE/info.txt
    13	fi
```

Here the crontab is set to run every 15 minutes. 
Check out http://www.nncron.ru/help/EN/working/cron-format.htm for more help on formatting.

# Removal
To remove the crontab simple run the following command
```
crontab -r
```
The -r flag is for remove.
To verify that all crontabs are removed run
```
crontab -l
```
to list any crontab. The expected output is "no crontab for $USER"

## Sources
http://stackoverflow.com/questions/4880290/how-do-i-create-a-crontab-through-a-script
http://askubuntu.com/questions/2368/how-do-i-set-up-a-cron-job

### footer
Made for Mac OS
