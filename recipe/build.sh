#!/bin/bash
set -ex

mkdir -p build-cpp
pushd build-cpp

cmake ${CMAKE_ARGS} ..  \
      -GNinja \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
      -DCMAKE_CXX_STANDARD=17 \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DBUILD_TESTING=OFF \
      -DOPENTELEMETRY_INSTALL=ON \
      -DWITH_API_ONLY=ON \
      -DWITH_EXAMPLES=OFF

ninja install
popd
