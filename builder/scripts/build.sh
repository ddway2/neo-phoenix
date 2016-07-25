#!/bin/bash

set -e

PROJECT_DIR=$1
[ -z "$PROJECT_DIR" ] && PROJECT_DIR=/src/app

cd $PROJECT_DIR
echo "Directory to build $PROJECT_DIR"
[ -f Makefile ] && make distclean

cbuild -C -c -y
make install

