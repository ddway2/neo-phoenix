FROM debian:stretch
MAINTAINER Pierre Salmon <pierre.salmon@smartcontext.fr>

ENV DEBIAN_FRONTEND noninteractive

ADD sources.list /etc/apt/sources.list

# Update Debian Version
RUN apt-get update -y && apt-get install -y cmake \
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
    dh-systemd \
    libopencv-dev \
    libnghttp2-dev

RUN mkdir -p /build
WORKDIR /build

# Build cpkg
RUN git clone https://github.com/ddway2/cpkg.git && \
    cd cpkg && \
    ./cpkg/bin/cpkg build && \
    ./cpkg/bin/cpkg package -P -I && \
    rm -rf /build/*

# Build cbuild
WORKDIR /build
RUN git clone https://github.com/ddway2/cbuild.git && \
    cd cbuild && \
    cpkg build && \
    cpkg package -P -I && \
    rm -rf /build/*

# InstallCaffe
ADD packages /packages
RUN dpkg -i /packages/*.deb || true && \
    apt-get -f -y install

# Prepare to build
RUN mkdir -p /src/app && \
    mkdir -p /scripts && \
    ln -s /usr/lib/x86_64-linux-gnu/pkgconfig/opencv.pc /usr/lib/x86_64-linux-gnu/pkgconfig/libopencv-dev.pc

ADD scripts/build.sh /scripts/build.sh

CMD ["bash"]



