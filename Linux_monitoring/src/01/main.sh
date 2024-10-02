#!/bin/bash

if [ $# -eq 0 ]; then
    echo " enter a value "
    
    else
        for value in "$@"; do
        if [[ "$value" =~ ^[0-9]+$ ]]; then
            echo "incorrect value "

    else echo "$value"
        fi
done
    fi