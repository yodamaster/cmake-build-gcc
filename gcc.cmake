set(gcc_args
--prefix=${CMAKE_INSTALL_PREFIX}
--with-gmp=${GMP_ROOT}
--with-mpc=${MPC_ROOT}
--with-mpfr=${MPFR_ROOT}
--disable-multilib
)

set(gcc_lang --enable-languages=c)
if(cpp)
  string(APPEND gcc_lang ",c++")
endif()
if(fortran)
  string(APPEND gcc_lang ",fortran")
endif()

if(use_isl)
  list(APPEND gcc_args --with-isl=${ISL_ROOT})
endif()

if(NOT gcov)
  list(APPEND gcc_args --disable-gcov)
endif()

if(NOT lto)
  list(APPEND gcc_args --disable-lto)
endif()

ExternalProject_Add(gcc_compiler
URL ${gcc_url}
CONFIGURE_COMMAND <SOURCE_DIR>/configure ${gcc_args} ${gcc_lang} CFLAGS=${CMAKE_C_FLAGS} LDFLAGS=${LDFLAGS}
BUILD_COMMAND ${MAKE_EXECUTABLE} -j
INSTALL_COMMAND ${MAKE_EXECUTABLE} -j install
TEST_COMMAND ""
INACTIVITY_TIMEOUT 60
CONFIGURE_HANDLED_BY_BUILD ON
DEPENDS "GMP;ISL;MPC;MPFR"
)
