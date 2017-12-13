#!/bin/bash

result=1
hostname=$1
port=$2

while [[ $result -ne 0 ]]; do
    nc -zv $hostname $port
    result=$?
    sleep 2
    echo "Waiting for $hostname to start"
done

echo "$hostname can be reached on port $port."
nginx -g 'daemon off;'
