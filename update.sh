#!/bin/bash

cd ~/uvc
git pull --verbose
sleep 2
cd ~
sed -i '/uvc/d' .zshrc
sed -i '/uvc/d' ../usr/etc/bash.bashrc
cd ~/uvc
./install.sh
echo "Update berhasil!"
sleep 3
./uvc.sh
