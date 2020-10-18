#!/bin/sh

set -x                                                      # 设置在运行结果之前，先输出执行的那一行命令。

SOURCE_DIR=`pwd`
BUILD_DIR=${BUILD_DIR:-build}
BUILD_TYPE=${BUILD_TYPE:-release}
INSTALL_DIR=${INSTALL_DIR:-../${BUILD_TYPE}-install-cpp11}
CXX=${CXX:-g++}

ln -sf $BUILD_DIR/$BUILD_TYPE-cpp11/compile_commands.json   # 生成的编译命令文件

mkdir -p $BUILD_DIR/$BUILD_TYPE-cpp11 \
  && cd $BUILD_DIR/$BUILD_TYPE-cpp11 \
  && cmake \
           -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
           -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
           -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
           $SOURCE_DIR \
  && make $*

# Use the following command to run all the unit tests
# at the dir $BUILD_DIR/$BUILD_TYPE :
# CTEST_OUTPUT_ON_FAILURE=TRUE make test

# cd $SOURCE_DIR && doxygen

