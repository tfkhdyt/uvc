#!/bin/bash

cd ~
sed -i '/uvc/d' .zshrc
sed -i '/uvc/d' ../usr/etc/bash.bashrc
rm -rf uvc/
cd ~
$SHELL
