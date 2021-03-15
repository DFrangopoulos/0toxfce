#!/bin/bash

cat << EOF



 ██████      ████████  ██████      ██   ██ ███████  ██████ ███████ 
██  ████        ██    ██    ██      ██ ██  ██      ██      ██      
██ ██ ██        ██    ██    ██       ███   █████   ██      █████   
████  ██        ██    ██    ██      ██ ██  ██      ██      ██      
 ██████         ██     ██████      ██   ██ ██       ██████ ███████ 
                                                                   
                                                                   



EOF
#####

#Check UID
userid=$(id -u)
echo $userid

if [ $userid -ne 0 ]
then
        echo "Not running as root!Exiting..."
        exit 1
fi

echo "--> Populating APT Sources"

> /etc/apt/sources.list
cat << 'EOF' >> /etc/apt/sources.list

deb http://deb.debian.org/debian/ buster main contrib non-free
deb-src http://deb.debian.org/debian/ buster main contrib non-free

deb http://security.debian.org/debian-security buster/updates main contrib non-free
deb-src http://security.debian.org/debian-security buster/updates main contrib non-free

deb http://deb.debian.org/debian/ buster-updates main contrib non-free
deb-src http://deb.debian.org/debian/ buster-updates main contrib non-free

EOF

#test "$?" && echo "Failed to modify sources!" && exit

#####
echo "--> Getting Packages"

apt -y update
apt -y upgrade
apt -y install --no-install-recommends xfce4
apt -y install xinit xorg xfce4-terminal pavucontrol slock conky moka-icon-theme arc-theme build-essential keepassxc wget curl netstat htop

exit 0
