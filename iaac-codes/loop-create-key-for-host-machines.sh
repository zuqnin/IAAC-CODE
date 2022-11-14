#!/bin/bash

n=0

read -p "Enter the number of host machines: " host_machines

group_count=$(cat /root/iaac-codes/playbooks/inventory | wc -l)

if [ "$group_count" -eq 0 ]; then

        read -p "Enter the name for Group of Hosts: " group_name
        echo "[$group_name]" >> /root/iaac-codes/playbooks/inventory

fi

while [ "$n" -lt "$host_machines" ]
do 
                read -p "Enter the IP Address of ch"$n": " ansible_host
                echo "ch$n ansible_host=$ansible_host" >> /root/iaac-codes/playbooks/inventory
                . /root/iaac-codes/create-key-for-hosts.sh
                ansible ch$n -i /root/iaac-codes/playbooks/inventory -m command -a "hostnamectl set-hostname ch$n"
                n=$(( $n+1 ))
done