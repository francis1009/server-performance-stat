#!/bin/bash
# Print the current usage of CPU, memory, and disk space
top -bn1 | grep load | awk '{printf "CPU Usage: %.2f%%\n", $(NF-2)}'
free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2}'
df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%.2f%%)\n", $3,$2,$5}'

# Print the top 5 processes by CPU usage
echo -e "\nTop 5 Processes by CPU usage:"
top -b -n 1 -o %CPU | head -n 12  | tail -n 6

# Print the top 5 processes by memory usage
echo -e "\nTop 5 Processes by memory usage:"
top -b -n 1 -o %MEM | head -n 12  | tail -n 6
