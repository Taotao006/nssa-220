#!/bin/bash

i=0

while [ $i -lt 10 ]
do
  echo "Random Number: $i: $RANDOM"
  (( i++ ))
done
