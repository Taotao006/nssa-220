#!/bin/bash
if [ $# -ne 2 ]
then
  echo 'name_reversal.sh: usage name_reversal <first_name> <last_name>'

  if [ $# -lt 2 ]
  then
    echo "Did not provide enough arguments"
    exit 1
  fi

  if [ $# -gt 2 ]
  then
    echo "Too many arguments"
    exit 1
  fi
fi

echo "Greetings, $2, $1"

