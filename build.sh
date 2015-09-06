#!/bin/bash
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get upgrade
sudo apt-get install -y g++ gcc git libgoogle-glog-dev libboost-system-dev libdouble-conversion-dev vim libjemalloc-dev

cd
mkdir soft
cd soft
wget http://www.cmake.org/files/v3.2/cmake-3.2.3.tar.gz
tar xvfz cmake-3.2.3.tar.gz
cd cmake-3.2.3
## 比较费内存�
./bootstrap --prefix=/usr --parallel=2 && make && sudo make install

cd
mkdir ~/github


cd ~/github/
git clone https://github.com/schuhschuh/gflags.git
mkdir gflags/build
cd gflags/build
cmake -D GFLAGS_NAMESPACE=google -D BUILD_SHARED_LIBS=on ..
make && sudo make install

cd ~/github
git clone https://github.com/caiqinzhou/google-glog.git
cd google-glog
./configure && make && sudo make install


cd ~/github
git clone https://github.com/facebook/wdt.git

cd ~/github/wdt
mkdir deps/; cd deps
git clone https://github.com/facebook/folly.git

cd ~/github/wdt
cmake .
make
sudo make install

