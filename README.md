# neo-phoenix
C++11/14 Autobuild Docker Framework with Web Based system (HTTP/2)

## Install
At the moment, Framework work only with Debian

### Prequisites
Install [cpkg](https://github.com/ddway2/cpkg) and [cbuild](https://github.com/ddway2/cbuild)
Install docker engine from Official install : [here](https://docs.docker.com/engine/installation/linux/debian/)
Install Debian dependcies
```
sudo apt-get install cmake \
    build-essential \
    debhelper \
    equivs \
    apt-file \
    tinycdb \
    pkg-config \
    rsync \
    git \
    lsb-release \
    lintian \
    sudo \
    apt-utils \
    g++ \
    make \
    binutils \
    autoconf \
    automake \
    autotools-dev \
    libtool \
    zlib1g-dev \
    devscripts \
    dh-autoreconf \
    dh-systemd 
```

## Build and install framework
Clone from github
```
git clone https://github.com/ddway2/neo-phoenix.git
cd neo-phoenix
```
Build docker image
```
make image
make onbuild
```
Build pheonix-utils
``̀
cd utils
cpkg build
make update-pkg
``̀
## Simple example

