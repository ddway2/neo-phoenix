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
```
cd utils
cpkg build
make update-pkg
```
## Simple example

Create a project directory:
```
mkdir sample
```
Create cbuild.conf file like this:
```
PKG_CATS=(
    [deb]=devel
    [pkgsrc]=devel
)
PKG_VER=1.0
PKG_REV=1
PKG_SHORTDESC="Sample phoenix"
PKG_LONGDESC="
Sample C++ Phoenix
"

# cbuild settings
PRJ_NAME=phoenix-sample
PRJ_SERVER=server
PRJ_OPTS["std"]=c++14
```

Bootstrap project:
```
phoenix-bootstrap
```
This command generate docker image and docker container to build project. Create file sources/binaries/server/main.cpp
```cpp
#include <iostream>

int main(int argc, char** argv)
{
    std::cout << "Hello World" << std::endl;
    return 0;
}
```
Configure project. You must configure project when you add new file and/or add new library dependencies
```
phoenix-build configure
```

To build project in docker container dev environment <project>-dev (in this case phoenix-sample-dev)
```
phoenix-build build
```

To run in container dev
```
phoenix-build install    # Install in dev container
phoenix-build run        # Run in dev container
```

To build docker image and test it
```
phoenix-build image
phoenix-build test
```

To rebuild project after modification:
```
phoenix-build build
```
