#!/bin/bash

sudo apt-get update
sudo apt-get install git -y
sudo apt-get install python3 python3-pip python3-setuptools -y

pushd ~
rm -rf pironman5
git clone https://github.com/sunfounder/pironman5.git
pushd ~/pironman5
yes | sudo python3 install.py

