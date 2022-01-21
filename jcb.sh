#!/bin/bash

# My version of Up forked to do other things called JCB -- Debian/Ubuntu Update+ Tool (Version 2.0)
# By Carlton Bryan w4jcb.com (GNU/General Public License version 2.0)

# Set BASH to quit script and exit on errors:

set -e

# Functions:

clear #Clears the screen

update() {
echo "Starting system update..."
sudo apt update
sudo apt dist-upgrade -yy
}

upgrade() {
echo "starting full system upgrade..."
sudo apt update && sudo apt upgrade -y
}

clean() {
echo "Cleaning up..."
sudo apt autoremove -yy
sudo apt autoclean
}

leave() {
clear
echo "--------------------"
echo "- Exiting JCB… Goodbye! -"
echo "--------------------"
exit
}

up_help() {
clear #Clears the screen
cat << _EOF_

Up is a tool that automates the update procedure for Debian and Ubuntu based
Linux systems.

By Carlton Bryan www.w4jcb.com (GNU/General Public License version 2.0)

_EOF_
}

system_info()
{
# Temporary function stub
    echo "function system_info"
    lscpu
}

show_uptime()
{
# Temporary function stub
    echo "function show_uptime"
uptime
}

drive_space()
{
# Temporary function stub
    echo "function drive_space"
df
}

home_space()
{
# Temporary function stub
    echo "function home_space"
    echo "Home directory space by user"
    echo "Bytes Directory"
    sudo du -s /home/* | sort -nr
}

pas()
{
sleep 1
echo
echo
read -rp "Press Enter to continue"
}

show_usb()
{
# shows USB stuff
	echo "Function show_usb"
	echo "To show any ttyUSB stuff"
	python3 -m serial.tools.list_ports
}

show_OS()
{
# shows OS Stuff
	echo "Function show_OS"
	hostnamectl
}

show_sys_monitor()
{
	echo "starting system monitor"
	gnome-system-monitor
}

run_bu()
{
bu
}

# Execution.

selection="1"
until [ $selection = " " ]; do

cat << _EOF_
Press the number of your choice:

1 – Update.
2 - Upgrade.
3 – Clean.
4 - Help.
5 - System Info.
6 - Show Uptime.
7 - Drive Space.
8 - Home Space.
9 - Show USB.
10 - Show OS.
11 - System Monitor
12 - Run BU Backup
0 – Exit JCB.


Each number corresponds to a script function or a set of simple commands.
_EOF_


read -r selection  #read -n 1 -s selection;
case $selection in
1) update leave;pas;clear;;
2) upgrade leave;pas;clear;;
3) clean update leave;pas;clear;;
4) up_help;pas;clear;;
5) system_info;pas;clear;;
6) show_uptime;pas;clear;;
7) df;pas;clear;;
8) home_space;pas;clear;;
9) show_usb;pas;clear;;
10) show_OS;pas;clear;;
11) show_sys_monitor;pas;clear;;
12) run_bu;pas;clear;;
0) leave;pas;clear;;
*) echo "Not a valid choice: Please try again.";pas;clear;;
esac
done
