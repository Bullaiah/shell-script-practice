#!/bin/bash
THRESHOLD=80
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
if (( $(echo "$cpu_usage > $THRESHOLD" |bc -l) )); then
    echo "CPU usage is above $THRESHOLD%. Current usage: $cpu_usage%" | mail -s "CPU Alert" dasari.bullaiah81@gmail.com
fi
