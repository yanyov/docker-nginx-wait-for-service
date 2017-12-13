#!/bin/bash

result=1
hostname=$1
port=$2

#check if there are
if [[ $# -eq 0 ]]; then
 #Start nginx if there is noting to wait for
 echo "Starting nginx."
 nginx -g 'daemon off;'
elif [[ $# -eq 1 ]] || [[ $# -gt 2 ]]; then
    echo "There is an error in your arguments."
    echo "Use $(basename $0) <hostname> <port>"
else
  while [[ $result -ne 0 ]]; do
    nc -zv $hostname $port
    result=$?
    sleep 2
    echo "Waiting for $hostname to start"
  done

  echo "$hostname can be reached on port $port. Starting nginx."
  nginx -g 'daemon off;'
fi
