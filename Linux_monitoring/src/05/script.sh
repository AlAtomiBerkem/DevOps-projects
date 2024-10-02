#!/bin/bash

START_TIME=$(date +%s)

if [[ $# != 1 ]]; then
    echo "enter the name of the directory"
elif [[ ${1: -1} != "/" ]]; then
    echo "Wrong parametres"
else


    ALL_FOLDERS=$(sudo find $1 -type d | wc -l)
    FIVE_BIG_FOLDERS=$(sudo du -Sh $1 | sort -rh | head -5 | cat -n | awk '{print $1" - "$3", "$2}')
    TOTAL_NAMBER_FILES=$(sudo find $1 -type f | wc -l)
    CONF_FILES=$(sudo find $1 -type f -name "*.conf" | wc -l)
    TXT_FILE=$(sudo find $1 -type f -name "*.txt" | wc -l)
    EXE_FILE=$(sudo find $1 -type f -executable -exec du -h {} + | wc | awk '{ print $1 }')
    LOG_FILE=$(sudo find $1 -type f -name ".log" | wc -l)
    ARCHIVE=$(sudo find $1 -regex '.*\(tar\|zip\|gz\|rar\)' | wc -l)
    LINK_FILE=$(sudo find $1 -type l | wc -l)
    BIG_FILES=$(sudo find $1 -type f -exec du -Sh {} + | sort -rh | head -10 | cat -n | awk '{print $1" - "$3", "$2}')
    BIG_FILES_EXE=$(sudo find $1 -type f -executable -exec du -h {} + | sort -hr | head -10 | cat -n | awk '{print $1" - "$3", "$2}')


     sudo chmod +x main.sh
    ./main.sh
fi
