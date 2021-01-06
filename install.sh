#!/bin/bash

clear
pkg install ffmpeg
# alias='cd ~/x265 && sh x265.sh'
# alias x265=$alia
echo "alias x265='cd ~/x265 && sh x265.sh'" >> ~/.zshrc
echo "alias x265='cd ~/x265 && sh x265.sh'" >> ~/../usr/etc/bash.bashrc
$SHELL
echo "Instalasi sukses!"
echo "Ketik x265 untuk memulai program"


