#!/bin/sh

set -x

SOURCE_DIR=$(cd `dirname $0`;pwd)
BUILD_DIR=${BUILD_DIR:-$SOURCE_DIR/build}
BUILD_TYPE=${BUILD_TYPE:-debug}
INSTALL_DIR=${INSTALL_DIR:-$BUILD_DIR/$BUILD_TYPE/install}
CXX=${CXX:-g++}

echo $BUILD_DIR/$BUILD_TYPE-cpp17 
mkdir -p $BUILD_DIR/$BUILD_TYPE-cpp17 \
  && cd $BUILD_DIR/$BUILD_TYPE-cpp17 \
  && cmake \
           -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
           -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
           -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
           $SOURCE_DIR \
  && make $*  \
  && make install

# Use the following command to run all the unit tests
# at the dir $BUILD_DIR/$BUILD_TYPE :
# CTEST_OUTPUT_ON_FAILURE=TRUE make test

# cd $SOURCE_DIR && doxygen

