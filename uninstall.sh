#!/bin/bash

cd ~
echo "unalias x265" >> .zshrc
echo "unalias x265" >> ../usr/etc/bash.bashrc
echo "unalias uninstall-x265" >> .zshrc
echo "unalias uninstall-x265" >> ../usr/etc/bash.bashrc
rm -rf x265/
$SHELL
