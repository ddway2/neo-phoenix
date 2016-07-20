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

CMD ["bash"]



