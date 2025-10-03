#!/bin/bash

# First argument should be the first name,
# Second argument should be the department name,
# Third argument should be the job title
function letter_writer () {
  welcome="welcome.txt"
  echo "Dear $1," > "$welcome"
  echo "Welcome to Initech Coporation! We're so happy to hae you in the $2 Department as a $3. Please don't forget to complete your TPS Reports in a timely manner." >> "$welcome"
  echo "Sincerely," >> "$welcome"
  echo "Bill Lumbergh" >> "$welcome"
}

# first argument should be path to /home/new_user
function file_system_writer () {
  mkdir "$1/Desktop"
  mkdir "$1/Documents"
  mv "welcome.txt" "$1/Documents"
  mkdir "$1/Downloads"
  mkdir "$1/Pictures"
  cp "ackbar.jpg" "$1/Pictures"
}

# first argument should be the username
function permission_editor () {
  chmod 444 "/home/$1/Documents/welcome.txt"
  chown -R "$1:$1" "/home/$1/"
  chmod 644 "/home/$1/Pictures/ackbar.jpg"
}

while [ true ]
do
  read -p "Username: " username
  read -p "Full Name: " first_name last_name
  read -p "Department: " dept
  read -p "Job Title: " job

  useradd "$username"
  letter_writer "$first_name" "$dept" "$job"
  file_system_writer "/home/$username"
  permission_editor "$username"

  echo "User $username added!"

  while [ true ]
  do
    read -p "Would you like to add another user? (y/n): " add_more
    if [ $add_more == "n" ] || [ $add_more == "N" ]
    then
      exit
    elif [ $add_more == "y" ] || [ $add_more == "Y" ]
    then
      break
    fi
  done
  echo "Done"
done
