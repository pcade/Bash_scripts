#!/bin/bash

#Создать скрипт ownersort.sh, который в заданной папке копирует файлы в директории, названные по имени владельца каждого файла.
#Учтите, что файл должен принадлежать соответствующему владельцу. 

cd /home && ls > /home/pcade/PycharmProjects/geek-python/Unix/lesson4/task4 # смотрю всех user через ls в home и передаю полученный результат в файл
users=/home/pcade/PycharmProjects/geek-python/Unix/lesson4/task4 # присваиваю файлу переменную для удабства использования 
cd -  # спускаюсь в начальную дирректорию где будет происходить процесс
total=$(cat $users | wc -l) # подсчитываю колличество user
counter=0
while [ $counter -lt $total ]; do # вывожу конкретную строку с именем user
	let counter+=1 # щётчик
	name=$(sed -n "$counter"p $users) # вывожу имя пользователя
	finder=$(ls -l | grep $name | tr -s ' ' '\t' | cut -f '9 9') # выделяю файлы принадлежащие конкретному пользователю
	cp ~/$finder ~/home/$name/ # записываю файлы в дирректорию конкретного пользователя
done