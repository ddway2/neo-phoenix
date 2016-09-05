FROM debian:stretch
MAINTAINER Pierre Salmon <pierre.salmon@smartcontext.fr>

ENV DEBIAN_FRONTEND noninteractive

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
    libnghttp2-dev \
    wget \
    libatlas-base-dev \
    libboost-all-dev \
    libgflags-dev \
    libgoogle-glog-dev \
    libhdf5-serial-dev \
    libleveldb-dev \
    liblmdb-dev \
    libopencv-dev \
    libprotobuf-dev \
    libsnappy-dev \
    protobuf-compiler \
    python-dev \
    python-numpy \
    python-pip \
    python-scipy

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

# Build Caffee
ENV CAFFE_ROOT=/opt/caffe
WORKDIR $CAFFE_ROOT
RUN git clone -b master --depth 1 https://github.com/BVLC/caffe.git . && \
    mkdir build && cd build && \
    cmake -DBUILD_docs=0 -DCMAKE_INSTALL_PREFIX=/usr -DCPU_ONLY=1 -DBUILD_python=0 -DBUILD_python_layer=0 .. && \
    make -j$(nproc) install && \
    rm -rf $CAFFE_ROOT/build 

# Prepare to build
RUN mkdir -p /src/app && mkdir -p /scripts

ADD scripts/build.sh /scripts/build.sh

CMD ["bash"]



