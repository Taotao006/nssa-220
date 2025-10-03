#!/bin/bash

# invalid commands
error_msg="Lab2_Task1.sh: Lab2_Task1 <num_of_rand_nums> <min> <max>"

# Exit the program if there's no argument
if [ $# -lt 1 ]
then
  echo $error_msg
  echo "Missing arguments"
  exit 1
# when there is two arguments that means we only have min, not max. Exit with error message
elif [ $# -eq 2 ]
then
  echo $error_msg
  echo "Missing max range"
  exit 1
# When there are more than 3 arguments also need to exit with error message
elif [ $# -gt 3 ]
then
  echo $error_msg
  echo "Too many arguments"
  exit 1
fi

output_file_name="rands_$1.txt"
# if the output file already exist, delete it and create it again
if [ -e $output_file_name ]
then
  rm $output_file_name
  touch $output_file_name
fi

# Appends to the output file
function num_writer () {
  echo $1 >> $output_file_name
}

# Three arguments if there is a range
# One argument if there is no range
function print_first_line () {
  if [ $# -eq 3 ]
  then
    echo "You requested $1 numbers between $2 and $3"
  #no range provided
  else
    echo "You requested $1 numbers"
  fi
}

# first argument is smallest, second argument is largest, third argument is average
function print_rest () {
  echo "The smallest value generated was $1"
  echo "The largest value generated was $2"
  echo "The average value generated was $3"
}

if [ $1 -eq 0 ]
then
  print_first_line 0
  exit
fi

i=0
smallest=32767
largest=0

min=0
max=32767
if [ $# -eq 3 ]
then
  min=$2
  max=$3
  print_first_line $1 $2 $3
else
  print_first_line $1
fi

# This help set the max num the random num can be by using modulo and adding again
diff=$(( $max - $min + 1 ))

while [ $i -lt $1 ]
do
  (( i++ ))
  num=$RANDOM
  num=$(( $num % diff + $min ))
  num_writer $num
  if [ $num -gt $largest ]
  then
    largest=$num
  fi
  if [ $num -lt $smallest ]
  then
    smallest=$num
  fi
  total=$(( $total + $num ))
done

average=$(( $total / $i ))

print_rest $smallest $largest $average
