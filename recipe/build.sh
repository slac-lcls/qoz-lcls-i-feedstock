#!/bin/bash -x -e

mkdir build
cd build
${BUILD_PREFIX}/bin/cmake --version
${BUILD_PREFIX}/bin/cmake \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  -DCMAKE_PREFIX_PATH=${PREFIX} \
  -DQoZ_USE_BUNDLED_ZSTD=OFF \
  -DQoZ_DEBUG_TIMINGS=OFF \
  ${SRC_DIR}

${BUILD_PREFIX}/bin/make -j${CPU_COUNT}
${BUILD_PREFIX}/bin/make install PREFIX=${PREFIX}
