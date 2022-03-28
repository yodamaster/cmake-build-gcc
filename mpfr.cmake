set(mpfr_args
--prefix=${CMAKE_INSTALL_PREFIX}
--with-gmp=${GMP_ROOT}
)

set(mpfr_url https://ftp.gnu.org/gnu/mpfr/mpfr-4.1.0.tar.xz)

ExternalProject_Add(MPFR
URL ${mpfr_url}
CONFIGURE_COMMAND <SOURCE_DIR>/configure ${mpfr_args} CFLAGS=${CMAKE_C_FLAGS} LDFLAGS=${LDFLAGS}
BUILD_COMMAND ${MAKE_EXECUTABLE} -j
INSTALL_COMMAND ${MAKE_EXECUTABLE} -j install
TEST_COMMAND ""
INACTIVITY_TIMEOUT 15
CONFIGURE_HANDLED_BY_BUILD ON
DEPENDS GMP
)

cmake_path(SET MPFR_ROOT ${CMAKE_INSTALL_PREFIX})
