#!/usr/bin/env bash

IFS=$'\n'

process_with_open_ports=($(netstat -tulpn | awk '{match($4, /(.*):(.*)/, p); split($NF,b,"[/ ]*"); print p[2],b[1]}' | tail -n +3 | sort -u))

if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

for p in "${process_with_open_ports[@]}"
do
  port=${p%[ ]*}
  pid=${p#*[ ]}
  path=$(ls -la /proc/$pid/exe | awk '{print $NF}')
  echo "Port number: $port - Binary path: $path"
  echo "-----"
done