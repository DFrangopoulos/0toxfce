# 0toxfce
Small script for installing a minimal xfce envirnoment on Debian 10. It also includes some basic Xfce dotfiles and a conky config. 
# Install
1. Get an IP from the DHCP server (if you don't have one already).
```bash
sudo dhclient
```
2. Run the script with as root to configure sources, install packages and update skel.
3. Create a regular user.
```bash
sudo useradd -m <your_user>
sudo passwd <your_user>
sudo usermod --shell /bin/bash <your_user>
``` 
