#!/bin/bash

cd -
rm -rf x265/
echo "unalias x265" >> .zshrc
echo "unalias x265" >> ../usr/etc/bash.bashrc
echo "unalias uninstall-x265" >> .zshrc
echo "unalias uninstall-x265" >> ../usr/etc/bash.bashrc
$SHELL
