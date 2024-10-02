#!/bin/bash

chmod +x data.sh
chmod +x print_data.sh

./print_data.sh

echo -n "Save data to file (Y/N)?: "
read answer
if [ $answer = 'Y' ] || [ $answer = 'y' ]
then
    ./print_data.sh > "$( date +'%d_%m_%Y_%H_%M_%S' ).status"
fi
