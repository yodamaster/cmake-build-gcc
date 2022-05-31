set(zstd_cmake_args
-DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
-DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}
-DBUILD_TESTING:BOOL=false
-DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
-DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
)

ExternalProject_Add(ZSTD
GIT_REPOSITORY ${zstd_url}
GIT_TAG ${zstd_tag}
GIT_SHALLOW true
SOURCE_SUBDIR build/cmake
CMAKE_ARGS ${zstd_cmake_args}
TEST_COMMAND ""
INACTIVITY_TIMEOUT 60
CONFIGURE_HANDLED_BY_BUILD ON
)

cmake_path(SET ZSTD_ROOT ${CMAKE_INSTALL_PREFIX})
