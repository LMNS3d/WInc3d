# CMake project file for FOO

##################################################
# Define the project and the depencies that it has
##################################################

CMAKE_MINIMUM_REQUIRED(VERSION 2.8.5)
PROJECT(WInc3D Fortran)

# Set the WInc3D version
SET(VERSION 0.0)


find_package(MPI REQUIRED)

# Make sure that double precision is used throughout
add_definitions(-DOUBLE_PREC)

#cmakedefine DOUBLE_PREC

SET(WInc3D_LINK_LIBRARIES ${MPI_Fortran_LIBRARIES} ${CMAKE_C_COMPILER})

# Add our local modlues to the module path
#SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules")

# Uncomment if it is required that Fortran 90 is supported
#IF(NOT CMAKE_Fortran_COMPILER_SUPPORTS_F90)
#    MESSAGE(FATAL_ERROR "Fortran compiler does not support F90")
#ENDIF(NOT CMAKE_Fortran_COMPILER_SUPPORTS_F90)

# Set some options the user may choose
# Uncomment the below if you want the user to choose a parallelization library
#OPTION(USE_MPI "Use the MPI library for parallelization")
#OPTION(USE_OPENMP "Use OpenMP for parallelization" OFF)

# This INCLUDE statement executes code that sets the compile flags for DEBUG,
# RELEASE, and TESTING.  You should  review this file and make sure the flags 
# are to your liking.
#INCLUDE(${CMAKE_MODULE_PATH}/SetFortranFlags.cmake) 
# Locate and set parallelization libraries.  There are some CMake peculiarities
# taken care of here, such as the fact that the FindOpenMP routine doesn't know
# about Fortran.
#INCLUDE(${CMAKE_MODULE_PATH}/SetParallelizationLibrary.cmake)
# Setup the LAPACK libraries.  This also takes care of peculiarities, such as
# the fact the searching for MKL requires a C compiler, and that the results
# are not stored in the cache. 
#INCLUDE(${CMAKE_MODULE_PATH}/SetUpLAPACK.cmake)

############################################################
# Define the actual files and folders that make up the build
############################################################

# Define the executable name
SET(WInc3DEXE WInc3D)

# Define some directories
SET(SRC ${CMAKE_SOURCE_DIR}/src)
SET(LIB ${CMAKE_SOURCE_DIR}/lib)
SET(BIN ${CMAKE_SOURCE_DIR}/bin)

# Define directories inside src/
SET(SRCDECOMP2D ${SRC}/decomp2d)

# Have the .mod files placed in the lib folder
SET(CMAKE_Fortran_MODULE_DIRECTORY ${LIB})

# The source for the WInc3D binary and have it placed in the bin folder
ADD_SUBDIRECTORY(${SRC} ${BIN})

# Add a distclean target to the Makefile
ADD_CUSTOM_TARGET(distclean 
    COMMAND ${CMAKE_COMMAND} -P ${CMAKE_SOURCE_DIR}/distclean.cmake
)
