#!/bin/bash

# invalid commands
error_msg="Lab2_Task1.sh: Lab2_Task1 <num_of_rand_nums> <min> <max>"
if [ $# -lt 1 ]
then
  echo $error_msg
  echo "Missing arguments"
  exit 1
# when there is two arguments that means we only have min, not max
elif [ $# -eq 2 ]
then
  echo $error_msg
  echo "Missing max range"
  exit 1
elif [ $# -gt 3 ]
then
  echo $error_msg
  echo "Too many arguments"
  exit 1
fi

output_file_name="rands_100.txt"
# if the output file already exist, delete it
if [ -e $output_file_name ]
then
  rm $output_file_name
  touch $output_file_name
fi

function num_writer () {
  echo $1 >> $output_file_name 
}

num_writer $RANDOM
num_writer $RANDOM
