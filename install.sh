#!/bin/bash

echo "+ Getting script"
wget -O /usr/local/bin/lpkg https://raw.githubusercontent.com/Ganesha2282882/lpkg/main/lpkg.sh -q --show-progress
chmod +x /usr/local/bin/lpkg
echo "+ Installing dependencies"
apt-get install git subversion gcc make -y || /bin/bash -c 'yes | pacman -S git subversion gcc make' || dnf install git subversion gcc make -y
