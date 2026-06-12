#!/bin/bash
echo "== SYSTEM =="
hostnamectl | egrep 'Operating System|Kernel|Architecture'

echo; echo "== CPU =="
lscpu | egrep 'Model name|CPU|Thread|Core|MHz'

echo; echo "== MEMORY =="
free -h

echo; echo "== DISK USAGE =="
df -hT | awk 'NR==1 || $7 ~ /^\/(home|var|root|\/|boot|data)/'

echo; echo "== NETWORK PORTS =="
ss -tuln | head -n 10

echo; echo "== LOAD AVERAGE (1/5/15) =="
awk '{print $1,$2,$3}' /proc/loadavg

echo; echo "== TOP PROCESSES =="
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 10
