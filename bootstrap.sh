#!/bin/bash

set -e

WORKDIR=$PWD
ME=$(basename $0)
MYDIR=$(dirname $0)
MYDIR=$(cd $MYDIR && pwd)

# Name
PROJECT=$1

PROJECT_DIR=$WORKDIR/$PROJECT
mkdir -p $PROJECT_DIR

# Generate Docker file
cat <<EOF > $PROJECT_DIR/Dockerfile.onbuild
FROM ddway2/phoenix-onbuild

CMD ["bash"]
EOF

cat <<EOF > $PROJECT_DIR/Dockerfile.dev
FROM ddway2/phoenix-dev

CMD ["bash"]
EOF

# Generate project structure
mkdir -p $PROJECT_DIR/app/sources/{binaries,include}
cat <<EOF > $PROJECT_DIR/app/cbuild.conf
PKG_CATS=(
    [deb]=devel
    [pkgsrc]=devel
)
PKG_VER=1.0
PKG_REV=1
PKG_SHORTDESC="$PROJECT app"
PKG_LONGDESC="
packaging for $PROJECT app
"

# cbuild settings
PRJ_NAME=$PROJECT
PRJ_OPTS["std"]=c++14
EOF

cd $PROJECT_DIR
git init
echo "**/CMakeList.txt" > .gitignore

