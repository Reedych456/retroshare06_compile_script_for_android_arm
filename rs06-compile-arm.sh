#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install libglib2.0-dev libupnp-dev qt4-dev-tools libqt4-dev libssl-dev libxss-dev libgnome-keyring-dev libbz2-dev libqt4-opengl-dev libqtmultimediakit1 qtmobility-dev libspeex-dev libspeexdsp-dev libxslt1-dev libcurl4-openssl-dev libopencv-dev tcl8.5 libmicrohttpd-dev
cd ~/
mkdir build
cd build
mkdir lib
cd lib
wget https://red.libssh.org/attachments/download/41/libssh-0.5.4.tar.gz
tar zxvf libssh-0.5.4.tar.gz
cd libssh-0.5.4
mkdir build
cd build
cmake -DWITH_STATIC_LIB=ON ..
make
sudo apt-get install subversion
cd ~/build
svn co svn://svn.code.sf.net/p/retroshare/code/trunk retroshare
cd ~/build/retroshare/libbitdht/src && qmake && make clean && make -j1 && \
cd ~/build/retroshare/openpgpsdk/src && qmake && make clean && make -j1 && \
cd ~/build/retroshare/libretroshare/src && qmake && make clean && make -j1 && \
cd ~/build/retroshare/rsctrl/src && make clean && make && \
cd ~/build/retroshare/retroshare-nogui/src && qmake && make clean && make -j1 #&& \
#cd ~/build/retroshare/retroshare-gui/src && qmake && make clean && make -j1
#1. If you want to compile a retroshare-gui uncomment the line above
cd ~/build/retroshare/retroshare-nogui/src/
cp retroshare-nogui ~/
#cd ~/build/retroshare/retroshare-gui/src/
#cp RetroShare ~/
#2. uncomment the lines above too, warning, retroshare-gui is not tested!
cd ~/
#./RetroShare-nogui 
#Retroshare binaries in home directory (~/)
#For creating this script I used this site: https://blog.cavebeat.org/2013/08/howto-compile-retroshare-on-raspberry-pi/
