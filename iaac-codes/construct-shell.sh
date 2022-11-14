#!/bin/bash

. /root/iaac-codes/loop-create-key-for-host-machines.sh

ansible-playbook -i /root/iaac-codes/playbooks/inventory /root/iaac-codes/playbooks/install-packages.yml

ansible all -i /root/iaac-codes/playbooks/inventory -m shell -a "ls /dev/sd* | grep -Po '\/dev\/sd(a{2}|[b-z]+)'"

ansible-playbook -i /root/iaac-codes/playbooks/inventory /root/iaac-codes/playbooks/create-lvm-fs-and-mount.yml

ansible-playbook -i /root/iaac-codes/playbooks/inventory /root/iaac-codes/playbooks/glusterd-and-glusterfsd-status.yml

ansible-playbook -i /root/iaac-codes/playbooks/inventory /root/iaac-codes/playbooks/status-docker.yml