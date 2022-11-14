#!/bin/bash

service=docker
sstat=inactive

systemctl status $service | grep -i 'active\|inactive' | awk '{print $2}' | while read output;

do

# echo "################### Service is $output ###################"

if [ "$output" = "$sstat" ]

then

        echo -e "\x1B[31m ################### Service is $output ################### \x1B[0m"

else

        echo -e "\x1B[96m ################### Service is $output ################### \x1B[0m"

fi

if [ "$output" == "$sstat" ]; then

    systemctl start $service

    echo -e "\x1B[32m ################### $service service is UP now.! ################### \x1B[0m"

    else

    echo -e "\x1B[96m ################### $service service is running ################### \x1B[0m"

    fi
done