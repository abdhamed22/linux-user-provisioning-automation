#!/bin/bash

path_csv=/home/ubuntu

#############################

csv_file="user_data.csv"
read -p "how much users do u want to add ?: " users
c=1
while (( c <= users ))
do

	read -p "Enter the UserName of uesr $c :" user
	read -p "Enter the FullName of uesr $c :" fullname 
	echo "$user,$fullname" >> "$path_csv/$csv_file"		
	((c++))
done

echo "done...."
