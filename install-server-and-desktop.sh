#!/bin/bash
mkdir /install
cd /install
exec >> /install/log 2>&1
pwd
sudo apt-get update
DEBIAN_FRONTEND=noninteractive sudo --preserve-env=DEBIAN_FRONTEND apt-get --yes install xfce4 x2goserver x2goserver-xsession build-essential qt5-qmake qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev jack qjackctl firefox-esr xz-utils pulseaudio-module-jack x2goserver-desktopsharing klick chromium
wget https://zoom.us/client/latest/zoom_amd64.deb
wget https://github.com/falkTX/Carla/releases/download/v2.2.0/Carla_2.2.0-linux64.tar.xz
wget https://github.com/corrados/jamulus/archive/latest.tar.gz
wget http://ppa.launchpad.net/kxstudio-debian/plugins/ubuntu/pool/main/a/artyfx/artyfx_1.3+git20190808.4_amd64.deb
wget https://xxxxxxxxxx/sp.carxp
wget https://xxxxxxxxxx/jamulus-server-settings
sudo dpkg -i zoom_amd64.deb
sudo dpkg -i artyfx_1.3+git20190808.4_amd64.deb
sudo apt-get -f install
tar xf Carla_2.2.0-linux64.tar.xz
tar -xvf latest.tar.gz
cd jamulus-latest
qmake Jamulus.pro
make clean
make
sudo make install
sudo sed -i.bak '27i\
load-module module-jack-sink\
load-module module-jack-source\
' /etc/pulse/default.pa
