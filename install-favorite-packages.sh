#!/bin/bash

sudo apt-get install exa tldr bat hwinfo neovim -y
tldr -u
rm code_arm64.deb
wget -O code_arm64.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-arm64"
sudo dpkg -i code_arm64.deb
rm code_arm64.deb
