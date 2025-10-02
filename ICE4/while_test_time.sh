#!/bin/bash

i=0

while [ $SECONDS -le 5 ]
do
  random=$RANDOM
  (( i++ ))
done
echo "$i values were generated"
