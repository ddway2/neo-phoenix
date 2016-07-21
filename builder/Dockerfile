FROM debian:jessie
MAINTAINER Pierre Salmon <pierre.salmon@smartcontext.fr>

ENV DEBIAN_FRONTEND noninteractive

# Update Debian Version
RUN apt-get update -y
RUN apt-get dist-upgrade -y
RUN apt-get install -y cmake \
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
    apt-utils

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

# Prepare build nghttp2
RUN apt-get install -y \ 
    g++ \
    make \
    binutils \
    autoconf \
    automake \
    autotools-dev \
    libtool \
    zlib1g-dev \
    libcunit1-dev \
    libssl-dev \
    libxml2-dev \
    libev-dev \
    libevent-dev \
    libjansson-dev \
    libjemalloc-dev \
    cython \
    python3-dev \
    python-setuptools \
    libboost1.55-dev \
    libboost-thread1.55-dev \
    devscripts \
    dh-autoreconf \
    dh-systemd \
    python-sphinx

# Build debian package spdylay
WORKDIR /build
RUN dget -x http://http.debian.net/debian/pool/main/s/spdylay/spdylay_1.3.2-2.dsc && \
    cd spdylay-1.3.2 && \
    dpkg-buildpackage -b -uc && \
    cd .. && dpkg -i libspdylay7*.deb libspdylay-dev*.deb libspdylay-utils*.deb && \
    rm -rf /build/*

# Build debian package nghttp2
WORKDIR /build
RUN dget -u http://http.debian.net/debian/pool/main/n/nghttp2/nghttp2_1.12.0-2.dsc && \
    cd nghttp2-1.12.0 && \
    dpkg-buildpackage -b -uc && \
    cd .. && dpkg -i libnghttp2-14_*.deb  libnghttp2-dev_*.deb nghttp2_*.deb  nghttp2-client_*.deb  nghttp2-proxy_*.deb  nghttp2-server_*.deb && \
    rm -rf /build/*




CMD ["bash"]



