#!/bin/bash

sudo chmod +x script.sh
source script.sh

echo -e "Total number of folders (including all nested ones) = $ALL_FOLDERS\n"
echo -e "TOP 5 folders of maximum size arranged in descending order (path and size):\n$FIVE_BIG_FOLDERS\n"
echo -e "Total number of files = $TOTAL_NAMBER_FILES\n"
echo -e "Number of:\nConfiguration files (with the .conf extension) = $CONF_FILES\nText files = $TXT_FILE\nExecutable files = $EXE_FILE"
echo -e "Log files (with the extension .log) = $LOG_FILE\nArchive files = $ARCHIVE\nSymbolic links = $LINK_FILE\n"
echo -e "TOP 10 files of maximum size arranged in descending order (path, size and type):\n$BIG_FILES\n"
echo -e "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):\n$BIG_FILES_EXE\n"

FINISH_TIME=$(date +%s)
echo "Script execution time $(($FINISH_TIME - $START_TIME)) sec."
