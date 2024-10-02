#!/bin/bash

sudo chmod +x color.sh

sudo chmod +x color.sh
sudo chmod +x print_data.sh
sudo chmod +x data.sh
sudo chmod +x colors.conf


source colors.conf
source color.sh
#Присваивание цветов из конфиг-файла переменным
color[0]=$column1_background
color[1]=$column1_font_color
color[2]=$column2_background
color[3]=$column2_font_color

#Создание массива дефолтных цветов
default[0]=1
default[1]=2
default[2]=4
default[3]=6

# Проверка данных из конфиг-файла
for (( i = 0; i < 4; i++ ))
do
     if ! [[ ${color[$i]} =~ ^[1-6$]+$ ]]
     then
        color[$i]=${default[$i]}
     fi
done

# defult collor on the right side 
if [ ${color[2]} == ${color[3]} ]
then
    color[2]=${default[2]}
    if [ ${color[2]} == ${color[3]} ]
    then
        color[2]=${default[3]} 
    fi
fi

#defult on the left side 
if [ ${color[0]} == ${color[1]} ]
then
    color[0]=${default[0]}
    if [ ${color[0]} == ${color[1]} ]
    then
        color[0]=${default[1]}
    fi
fi


./print_data.sh ${color[0]} ${color[1]} ${color[2]} ${color[3]}

# в конце выводим таблицы цветов 
arr=(zero white red green blue purple black)
for (( i=0; i<2; i++ ))
do
    echo -en "Column $(( i+1 ))" "background =" 
    if [ ${color[($i*2)]} -eq ${default[($i*2)]} ]  
    then
        echo  "default" "(${arr[${color[($i*2)]}]})"
    else
        echo  "${color[($i*2)]}" "(${arr[${color[($i*2)]}]})"
    fi
    echo -en "Column $(( i+1 ))" "font color ="  
    if [ ${color[($i*2)+1]} -eq ${default[($i*2)+1]} ]  
    then
        echo  "default" "(${arr[${color[($i*2)+1]}]})"
    else
        echo  "${color[($i*2)+1]}" "(${arr[${color[($i*2)+1]}]})"
    fi
done
