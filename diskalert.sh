#!/bin/bash
## script by riju##

# give the alert level here
limit=< your threshold>  #eg.80 

#specify the partion here
partition=<your partition name> #eg. /mydisk

#specify your mail id here
address="<your mail id>" #eg. "rijumavilayi@gmail.com"

#checking the disk usage
duse=`df -k "$partition" | grep -v Filesystem |awk '{print $5}' |sed 's/%//g'`

#comparing with threshold 
if [[ "$duse" -ge "$limit" ]]
then
#sending mail
echo Disk usage is more than "$limit"  | /bin/mail -s "Disk usage alert" "$address"
fi
