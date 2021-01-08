#!/bin/bash

cd ~
sed -i '/uvc/d' .zshrc
sed -i '/uvc/d' ../usr/etc/bash.bashrc
rm -rf uvc/
cd ~
git clone https://github.com/tfkhdyt/uvc.git
cd ~/uvc
./install.sh
