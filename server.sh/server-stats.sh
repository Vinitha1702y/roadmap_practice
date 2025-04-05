#!/bin/bash

#Print OS Version

echo "OS VERSION: $(lsb_release -d | awk -F"\t" '{print $2}')"

#Print Uptime

echo "UPTIME: $(uptime -p)"

#Prin Loadaverage

echo "Load Average: $(uptime | awk -F'load average: ' '{print $2}' | awk '{print $1, $2, $3}')"

#Number of Loggedin Users

echo "Logged in Users: $(who | wc - l)"

#Failed loggin users

echo "Failed login users: $(journalctl -u sshd | grep 'failed loggins' | wc -l)"


# CPU Usage

top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1 "%"}'

#Total memory usage( Free vs Used including percentage)


free -h | grep Mem | awk '{print "used : "$3/$2", Free : "$4/$2", percentage used: "$3/$2 * 100.0 "%"}'

#Total Disk usage( FREE vs Used including percentage)

df -h --total | grep 'total' |awk '{print "used: "$3/$2" , Free: "$4/$2", percentage used "$5}'

# Top 5 processes by Memory usage

ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 6

#Top 5 processs by CPU Usage

ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6
