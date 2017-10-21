# Copyright (C) 2017 Ciprian Elies
# This file may be modified, redistributed, and used according to the terms of the MIT licence.
# See LICENSE.md for more details.
#
# Find sqlite3 includes and library
#
# This module defines:
#  SQLITE3_INCLUDE_DIRS,		library's header files
#  SQLITE3_LIBRARIES,			libraries to link against to use sqlite3
#  SQLITE3_LIBRARY,				where to find the sqlite3 library
#  SQLITE3_FOUND				true/false if sqlite3 found.

SET(SQLITE3_SEARCH_PATHS
	${SQLITE3_SEARCH_PATHS}
	$ENV{SQLITE3_DIR}
	~/Library/Frameworks
	/Library/Frameworks
	/usr/local
	/usr
	/opt/local
	/opt
)

FIND_PATH(SQLITE3_INCLUDE_DIR NAMES sqlite3.h
	HINTS
	$ENV{SQLITE3_INCLUDE_DIR}
	PATH_SUFFIXES include
	PATHS ${SQLITE3_SEARCH_PATHS}
)

FIND_LIBRARY(SQLITE3_LIBRARY
	NAMES sqlite3
	HINTS
	$ENV{SQLITE3_LIB_DIR}
	PATH_SUFFIXES lib64 lib libs/Win32 libs/Win64
	PATHS ${SQLITE3_SEARCH_PATHS}
)

# Handle QUIETLY and REQUIRED
# Set SQLITE3_FOUND
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(SQLITE3 DEFAULT_MSG SQLITE3_LIBRARY SQLITE3_INCLUDE_DIR)

# Copy the results to the output variables.
IF ( SQLITE3_FOUND )
	set(SQLITE3_LIBRARIES ${SQLITE3_LIBRARY})
	set(SQLITE3_INCLUDE_DIRS ${SQLITE3_INCLUDE_DIR})
ELSE ( SQLITE3_FOUND )
	SET(SQLITE3_LIBRARIES)
	SET(SQLITE3_INCLUDE_DIRS)
ENDIF ( SQLITE3_FOUND )


# Ignore me
MARK_AS_ADVANCED(SQLITE3_INCLUDE_DIR SQLITE3_LIBRARY)
