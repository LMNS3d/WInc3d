########################################
# Set up how to compile the source files
########################################

# Add the source files
SET(WInc3D_src WInc3D.f90
    
    #decomp2d files
            #${SRCDECOMP2D}/decomp_2d.f90
)

# Define the executable in terms of the source files
ADD_EXECUTABLE(${WInc3DEXE} ${WInc3D_src})

#####################################################
# Add the needed libraries and special compiler flags
#####################################################
SET_TARGET_PROPERTIES(${WInc3DEXE} PROPERTIES
                      COMPILE_FLAGS "${MPI_Fortran_COMPILE_FLAGS}"
                      LINK_FLAGS "${MPI_Fortran_LINK_FLAGS}")
INCLUDE_DIRECTORIES(${MPI_Fortran_INCLUDE_PATH})

# This links foo to the bar library
TARGET_LINK_LIBRARIES(${WInc3DEXE} ${WInc3D_LINK_LIBRARIES})

# Uncomment if you need to link to BLAS and LAPACK
#TARGET_LINK_LIBRARIES(${FOOEXE} ${BLAS_LIBRARIES}
#                                ${LAPACK_LIBRARIES}
#                                ${CMAKE_THREAD_LIBS_INIT})

# Uncomment if you have parallization
#IF(USE_OPENMP)
#    SET_TARGET_PROPERTIES(${FOOEXE} PROPERTIES
#                          COMPILE_FLAGS "${OpenMP_Fortran_FLAGS}"
#                          LINK_FLAGS "${OpenMP_Fortran_FLAGS}")
#ELSEIF(USE_MPI)
#    SET_TARGET_PROPERTIES(${FOOEXE} PROPERTIES
#                          COMPILE_FLAGS "${MPI_Fortran_COMPILE_FLAGS}"
#                          LINK_FLAGS "${MPI_Fortran_LINK_FLAGS}")
#    INCLUDE_DIRECTORIES(${MPI_Fortran_INCLUDE_PATH})
#    TARGET_LINK_LIBRARIES(${FOOEXE} ${MPI_Fortran_LIBRARIES})
#ENDIF(USE_OPENMP)

#####################################
# Tell how to install this executable
#####################################

#IF(WIN32)
#    SET(CMAKE_INSTALL_PREFIX "C:\\Program Files")
#ELSE()
#    SET(CMAKE_INSTALL_PREFIX /usr/local)
#ENDIF(WIN32)
#INSTALL(TARGETS ${WInc3DEXE} RUNTIME DESTINATION bin)
