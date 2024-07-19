#! /bin/bash

WORKDIR=/build
#CMAKE VARS
CMAKE_VERSION=3.30.1
CMAKE_DIR=CMake-$CMAKE_VERSION
CMAKE_REPO=https://github.com/Kitware/CMake/archive/refs/tags/v$CMAKE_VERSION.tar.gz
#HYPRLAND VARS
HYPRLAND_DIR=Hyprland
HYPRLAND_REPO=https://github.com/hyprwm/Hyprland

echo "####################### Install Cmake #############################"

if [ ! -d $WORKDIR/$CMAKE_DIR ];
then
	wget $CMAKE_REPO
	tar -xvf v$CMAKE_VERSION.tar.gz
fi

cd $WORKDIR/$CMAKE_DIR

if [ ! -d $WORKDIR/$CMAKE_DIR ];
then
	./configure #Install gmake
	gmake
fi

make install

echo "####################### Install HyprLand #############################"

cd $WORKDIR

if [ ! -d $WORKDIR/$HYPRLAND_DIR ];
then
	git clone --recursive $HYPRLAND_REPO
fi

cd $WORKDIR/$HYPRLAND_DIR 

make all

/bin/bash
