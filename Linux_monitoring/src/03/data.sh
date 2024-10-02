#!/bin/bash

USER=$USER
OS=$(lsb_release -a | grep Description | awk '{print $2, $3}')
DATE=$(date)
UPTIME=$(uptime)
UPTIME_SEC=$(cat /proc/uptime |awk '{print $1,"sec"}')
IP=$(hostname -I)
MASK=$(ip a | grep "inet " | awk '{print $2}' | tail -1 | cut -d / -f2)
GATEWAY=$(ip route | grep default | awk '{print $3}')
RAM_TOTAL=$(free -h | awk '/Mem/ { printf "%.3f GB\n", $2/1024 }')
RAM_USER=$(free -h | awk 'NR==2{printf "%.3f\n", ($3/1024)}')
RAM_FREE=$(free -h | awk '/Mem/ { printf "%.3f GB\n", $4/1024 }')
SPACE_ROOT=$(df -BM / | awk 'NR == 2 {printf "%.2f MB\n", $3}')
SPACE_ROOT_USER=$(df -BM / | awk 'NR==2 {printf "%.2f MB\n", $3}')
SPACE_ROOT_FREE=$(df -BM / | awk 'NR==2 {printf "%.2f MB\n", $4}')

