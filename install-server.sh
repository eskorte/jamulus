#!/bin/bash
wget https://github.com/corrados/jamulus/archive/latest.tar.gz
tar -xvf latest.tar.gz
cd jamulus-latest
sudo apt-get update
sudo apt-get --yes install build-essential qt5-qmake qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev
qmake "CONFIG+=nosound headless" Jamulus.pro
make clean
make
sudo make install
Jamulus -s -u 50
