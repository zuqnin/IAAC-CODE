#!/bin/bash

var1=$(systemctl status glusterd | grep -i 'active\|inactive' | awk '{print $2}')
var2=$(systemctl status glusterfsd | grep -i 'active\|inactive' | awk '{print $2}')

case $var1 in

        inactive)

                echo -e "\x1B[31m ################### glusterd is inactive ################### \x1B[0m"

                echo -e "\x1B[32m ################### Activating... ################### \x1B[0m"

                sleep 3

                systemctl enable glusterd

                systemctl start glusterd
                ;;

        active)

                echo -e "\x1B[96m ################### glusterd is active. No need to start. ################### \x1B[0m"
                ;;

esac

case $var2 in

        inactive)

                echo -e "\x1B[31m ################### glusterfsd is inactive ###################\x1B[0m"

                echo -e "\x1B[32m ################### Activating... ################### \x1B[0m"

                sleep 3

                systemctl enable glusterfsd

                systemctl start glusterfsd
                ;;

        active)

                echo -e "\x1B[96m ################### glusterfsd is active. No need to start. ################### \x1B[0m"
                ;;

esac
