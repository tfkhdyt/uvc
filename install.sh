#!/bin/bash

clear
pkg install ffmpeg figlet ruby toilet tree
gem install lolcat
echo "alias x265='cd ~/x265 && sh x265.sh'" >> ~/.zshrc
echo "alias x265='cd ~/x265 && sh x265.sh'" >> ~/../usr/etc/bash.bashrc
echo "alias uninstall-x265='cd ~/x265 && ./uninstall.sh'" >> ~/.zshrc
echo "alias uninstall-x265='cd ~/x265 && ./uninstall.sh'" >> ~/../usr/etc/bash.bashrc
echo "alias update-x265='cd ~/x265 && ./update.sh'" >> ~/.zshrc
echo "alias update-x265='cd ~/x265 && ./update.sh'" >> ~/../usr/etc/bash.bashrc

$SHELL

