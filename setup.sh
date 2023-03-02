#!/bin/bash

echo -e "Installing all the required dependencies"

pkg install binutils build-essential liblz4 lz4 -y

echo -e "Cloning the repo"

if [ ! -d ~/nstool-termux ]
then
	git clone https://github.com/Pipetto-crypto/nstool-termux.git
fi

echo -e "Building"

cd nstool-termux
bash build.sh compile

echo -e "Moving nstool to path"

mv bin/nstool $PATH/nstool
chmod +x $PATH/nstool

echo -e "Leaving"

cd ~
