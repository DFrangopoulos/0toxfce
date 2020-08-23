#!/bin/bash

cat << EOF



 ██████      ████████  ██████      ██   ██ ███████  ██████ ███████ 
██  ████        ██    ██    ██      ██ ██  ██      ██      ██      
██ ██ ██        ██    ██    ██       ███   █████   ██      █████   
████  ██        ██    ██    ██      ██ ██  ██      ██      ██      
 ██████         ██     ██████      ██   ██ ██       ██████ ███████ 
                                                                   
                                                                   



EOF
#####
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

#test "$?" && echo "Permission Error!" && exit

#####
echo "--> Getting Packages"

apt -y update
apt -y upgrade
apt -y install xfce4 moka-icon-theme arc-theme thunderbird xfce4-terminal firefox-esr network-manager-gnome keepassxc gimp build-essential wget curl findutils synaptic firmware-linux firmware-iwlwifi pulseaudio xfce4-power-manager
