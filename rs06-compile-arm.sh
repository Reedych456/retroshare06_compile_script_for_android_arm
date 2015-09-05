#!/bin/bash

export RS06_CPUCORES=1
export RSDIR_TMP=retroshare

echo "Welcome to RS06 compile script! Warning: this script is unstable"
echo "Updating system and installing needed packages"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install libglib2.0-dev subversion libupnp-dev qt4-dev-tools libqt4-dev libssl-dev libxss-dev 
libgnome-keyring-dev libbz2-dev 
libqt4-opengl-dev libqtmultimediakit1 qtmobility-dev libspeex-dev libspeexdsp-dev libxslt1-dev libcurl4-openssl-dev libopencv-dev tcl8.5 libmicrohttpd-dev
echo "Making directories"
cd ~/
mkdir build
cd build
mkdir lib
cd lib
if [ "\$RS06_NOGUI" = "1" ]
then
echo "Installing libssh for RS-nogui"
wget https://red.libssh.org/attachments/download/41/libssh-0.5.4.tar.gz
tar zxvf libssh-0.5.4.tar.gz
cd libssh-0.5.4
mkdir build
cd build
cmake -DWITH_STATIC_LIB=ON ..
make
fi

if [ -n "\$RS06_RSDIR" ]
then
echo "Using custom retroshare sources directory"
echo "Using RS06_RSDIR" > /dev/null
export RSDIR_TMP=$RS06_RSDIR
export RS06_DOWNLOAD_RS=0
export RS06_CLONE_RS_GITHUB=0
fi

cd ~/build

if [ "\$RS06_DOWNLOAD_RS" = "1" ]
then
echo "Downloading RetroShare"
cd ~/build
svn co svn://svn.code.sf.net/p/retroshare/code/trunk retroshare
fi

if [ "\$RS06_CLONE_RS_GITHUB" = "1" ]
then
git clone https://github.com/RetroShare/RetroShare
fi

if [ "\$RS06_COMPILE_BASE" = "1" ]
then
echo "Compiling RetroShare! Your device maybe become laggy"
cd ~/build/$RSDIR_TMP/libbitdht/src && qmake && make clean && make -j$RS06_CPUCORES && \
cd ~/build/$RSDIR_TMP/openpgpsdk/src && qmake && make clean && make -j$RS06_CPUCORES && \
cd ~/build/$RSDIR_TMP/libretroshare/src && qmake && make clean && make -j$RS06_CPUCORES && \
cd ~/build/$RSDIR_TMP/rsctrl/src && make clean && make
if [ "\$RS06_COMPILE_NOGUI" = "1" ]
then
cd ~/build/$RSDIR_TMP/retroshare-nogui/src && qmake && make clean && make -j$RS06_CPUCORES
cp ~/build/$RSDIR_TMP/retroshare-nogui/src/retroshare-nogui ~/
fi
if [ "\$RS06_COMPILE_GUI" = "1" ]
then
cd ~/build/$RSDIR_TMP/retroshare-gui/src && qmake && make clean && make -j$RS06_CPUCORES
cp ~/build/$RSDIR_TMP/retroshare-gui/src/RetroShare ~/
fi

#2. uncomment the lines above too, warning, retroshare-gui is not tested!
cd ~/
#./RetroShare
#Retroshare binaries in home directory (~/)
