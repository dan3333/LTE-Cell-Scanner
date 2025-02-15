# - Find BLADERF
# Find the native BLADERF includes and library
# This module defines
#  BLADERF_INCLUDE_DIR, where to find libbladeRF.h, etc.
#  BLADERF_LIBRARIES, the libraries needed to use BLADERF.
#  BLADERF_FOUND, If false, do not try to use BLADERF.
# also defined, but not for general use are
#  BLADERF_LIBRARY, where to find the BLADERF library.

#MESSAGE("BLADERF_DIR set to ${BLADERF_DIR}" )

add_definitions("-fpermissive")

SET(CMAKE_EXE_LINKER_FLAGS  "-lboost_thread -lboost_filesystem  -lboost_system")

FIND_PATH(BLADERF_INCLUDE_DIR libbladeRF.h
  ${LIBBLADERF_DIR}/include
  /usr/local/include/libbladeRF
  /root/pybombs/bladeRF/include/
)

FIND_LIBRARY(BLADERF_LIBRARY
  NAMES bladeRF libboost
  PATHS ${LIBBLADERF_DIR}/libs
  "${LIBBLADERF_DIR}\\win32\\lib"
  /usr/pkgs64/lib
  /usr/lib64
  /usr/lib/x86_64-linux-gnu/
  /usr/lib
  /usr/local/lib
  /root/pybombs/bladeRF/lib/
  NO_DEFAULT_PATH
)

IF (BLADERF_LIBRARY AND BLADERF_INCLUDE_DIR)
  SET(BLADERF_LIBRARIES ${BLADERF_LIBRARY})
  SET(BLADERF_FOUND "YES")
ELSE (BLADERF_LIBRARY AND BLADERF_INCLUDE_DIR)
  SET(BLADERF_FOUND "NO")
ENDIF (BLADERF_LIBRARY AND BLADERF_INCLUDE_DIR)

IF (BLADERF_FOUND)
  IF (NOT BLADERF_FIND_QUIETLY)
#    MESSAGE(STATUS "Found BLADERF: ${BLADERF_LIBRARIES}")
  ENDIF (NOT BLADERF_FIND_QUIETLY)
ELSE (BLADERF_FOUND)
  IF (BLADERF_FIND_REQUIRED)
#    MESSAGE(FATAL_ERROR "Could not find BLADERF library")
  ENDIF (BLADERF_FIND_REQUIRED)
ENDIF (BLADERF_FOUND)

# Deprecated declarations.
GET_FILENAME_COMPONENT (NATIVE_BLADERF_LIB_PATH ${BLADERF_LIBRARY} PATH)

MARK_AS_ADVANCED(
  BLADERF_LIBRARY
  BLADERF_INCLUDE_DIR
)

