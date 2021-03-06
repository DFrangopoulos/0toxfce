#!/bin/bash

cat << EOF



 ██████      ████████  ██████      ██   ██ ███████  ██████ ███████ 
██  ████        ██    ██    ██      ██ ██  ██      ██      ██      
██ ██ ██        ██    ██    ██       ███   █████   ██      █████   
████  ██        ██    ██    ██      ██ ██  ██      ██      ██      
 ██████         ██     ██████      ██   ██ ██       ██████ ███████ 
                                                                   
                                                                   



EOF
#####

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo "$DIR"


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

#####
echo "--> Getting Packages"

apt -y update
apt -y upgrade
apt -y install --no-install-recommends xfce4
apt -y install xinit xorg xfce4-terminal pavucontrol slock conky moka-icon-theme arc-theme build-essential keepassxc wget curl htop rsync

##Update Skel
rsync -rv --exclude ".git/" "${DIR}/" /etc/skel/

exit 0
