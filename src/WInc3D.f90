! =============================================================================
!    This file is part of WInc3D.
!
!    Copyright (c) 2018 Georgios Deskos
!
!    WInc3D is free software: you can redistribute it and/or modify
!    it under the terms of the GNU General Public License as published 
!    the Free Software Foundation.                                     
!                                                                      
!    WInc3d is distributed in the hope that it will be useful,     
!    but WITHOUT ANY WARRANTY; without even the implied warranty of   
!    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the   
!    GNU General Public License for more details.
!
!    You should have received a copy of the GNU General Public License
!    along with the code.  If not, see <http://www.gnu.org/licenses/>.
!-----------------------------------------------------------------------------
!    We kindly request that you cite WInc3d in your publications and 
!    presentations. The following citations are suggested:
!
!    1-Deskos G., Laizet S. & Piggott M.D., 2018, Turbulence-resolving simulations 
!    of wind turbine wakes. arXiv, 20 April 2018
!
!    2-Deskos G., Laizet S. & Piggott M.D., 2018, Development and validation of the
!    higher-order finite-difference wind farm simulator, WInc3D, 3rd International
!    Conference on Renewable Energies Offshore (RENEW2018), Lisbon, Portugal, 8-10 
!    October 2018
!
!    WInc3D is a free software built upon Incompact3d (see below)
! ==============================================================================

!################################################################################
! Copyright (c) 2012 Eric Lamballais and Sylvain Laizet
! eric.lamballais@univ-poitiers.fr / sylvain.laizet@gmail.com
!
!    Incompact3d is free software: you can redistribute it and/or modify
!    it under the terms of the GNU General Public License as published by
!    the Free Software Foundation.
!
!    Incompact3d Vis distributed in the hope that it will be useful,
!    but WITHOUT ANY WARRANTY; without even the implied warranty of
!    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
!    GNU General Public License for more details.
!
!    You should have received a copy of the GNU General Public License
!    along with the code.  If not, see <http://www.gnu.org/licenses/>.
!-------------------------------------------------------------------------------
!-------------------------------------------------------------------------------
!    We kindly request that you cite Incompact3d in your publications and 
!    presentations. The following citations are suggested:
!
!    1-Laizet S. & Lamballais E., 2009, High-order compact schemes for 
!    incompressible flows: a simple and efficient method with the quasi-spectral 
!    accuracy, J. Comp. Phys.,  vol 228 (15), pp 5989-6015
!
!    2-Laizet S. & Li N., 2011, Incompact3d: a powerful tool to tackle turbulence 
!    problems with up to 0(10^5) computational cores, Int. J. of Numerical 
!    Methods in Fluids, vol 67 (11), pp 1735-1757
!################################################################################

PROGRAM WInc3D

USE MPI
#ifdef OPENFAST
USE FAST_Subs 
#endif


implicit none

! Error Handling variables
integer             :: ErrStat              ! Error Status 
integer             :: ErrMsg               ! Error Message
! Input File variables
character(len=80)   :: InputFN              ! Input file
character(len=80)   :: FNBase               ! Truncated Input file
integer             :: nargin               ! Number of arguments from the command line
integer             :: FNLength             ! Filename length
logical             :: back                 ! windup back logical parameter 
integer             :: DecInd               ! Dec index
! MPI variables
integer             :: code                 ! MPI code

character(len=20) :: filename

CALL MPI_INIT(code)
! ==================
! Handle Input file
! ==================
nargin=command_argument_count()
if (nargin <1) then
    print *, 'Please call WInc3D with the name of the input file on the command line (e.g. WInc3D Lillgrund.in)'
endif
call get_command_argument(1,InputFN,FNLength,ErrStat)
back=.true.
FNBase=inputFN((index(InputFN,'/',back)+1):len(InputFN))
DecInd=index(FNBase,'.',back)
if (DecInd >1) then
    FNBase=FNBase(1:(DecInd-1))
end if


CALL MPI_FINALIZE(code)

END PROGRAM WInc3D
