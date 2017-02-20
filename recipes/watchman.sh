#!/bin/bash
set -e

# Build tools
apt-get install software-properties-common \
  build-essential \
  python-dev \
  python-software-properties \
  libtool \
  autotools-dev \
  automake \
  pkg-config -y
add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update
apt-get install gcc-4.9 g++-4.9 -y
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 10
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 10

# Clone and install
cd
git clone https://github.com/facebook/watchman.git --depth 1
cd watchman
git checkout v4.7.0
./autogen.sh
./configure
make
make install
