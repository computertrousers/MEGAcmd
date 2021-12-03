#!/bin/bash

DIRNAME=$(dirname $0)

pushd ${DIRNAME}/..

sudo apt update
sudo apt install -y make libcrypto++ libpcrecpp0v5 libc-ares-dev zlib1g-dev libuv1 libssl-dev libsodium-dev readline-common sqlite3 curl autoconf libtool g++ libcrypto++-dev libz-dev libsqlite3-dev libssl-dev libcurl4-gnutls-dev libreadline-dev libpcre++-dev libsodium-dev libc-ares-dev libfreeimage-dev libavcodec-dev libavutil-dev libavformat-dev libswscale-dev libmediainfo-dev libzen-dev

git submodule update --init --recursive

# build
sh autogen.sh
./configure
make

#install
sudo make install
sudo ldconfig

popd
