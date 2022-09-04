include(ExternalProject)

set(extproj_args)

if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.20)
  list(APPEND extproj_args
  INACTIVITY_TIMEOUT 60
  CONFIGURE_HANDLED_BY_BUILD ON
  )
endif()

function(extproj name url args dep)

list(INSERT args 0 "--prefix=${CMAKE_INSTALL_PREFIX}")

ExternalProject_Add(${name}
URL ${url}
CONFIGURE_COMMAND <SOURCE_DIR>/configure ${args} CFLAGS=${CMAKE_C_FLAGS} LDFLAGS=${LDFLAGS}
BUILD_COMMAND ${MAKE_EXECUTABLE} -j${NCPU}
INSTALL_COMMAND ${MAKE_EXECUTABLE} -j${NCPU} install
TEST_COMMAND ""
TLS_VERIFY true
${extproj_args}
DEPENDS ${dep}
)

endfunction(extproj)
