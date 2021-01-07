#!/bin/bash

cd ~
sed -i '/x265/d' .zshrc
sed -i '/x265/d' ../usr/etc/bash.bashrc
rm -rf x265/
cd ~
$SHELL
