#!/bin/bash

i=1
ran_num=$RANDOM
echo "$ran_num"
while [ $ran_num -ge 100 ]
do
  ran_num=$RANDOM
  (( i++ ))
  echo "Random Number: $i: $ran_num"
done

echo "It took $i attempts to generate a number less than 100"
