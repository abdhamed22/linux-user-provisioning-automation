#!/bin/bash
file="/home/ubuntu/user_data.csv"
if [ -s "$file" ]
then
	while IFS=, read line1 line2
	do
		user="$line1"
		comm="$line2"
		pass=$(openssl rand -hex 16)
		useradd -m -c "$comm" "$user"
		if [ "$?" -eq 0 ]
	 	then
			echo "$user:$pass" | chpasswd
			echo "the username is $user"
			echo "the pass is $pass"
			echo "user $user is created.."
			chage -d 0 "$user" 
		else
			echo "Error can't create user $user"
		fi
	done < $file
fi
