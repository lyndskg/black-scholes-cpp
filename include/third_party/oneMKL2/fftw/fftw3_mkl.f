!===============================================================================
! Copyright 2005-2022 Intel Corporation.
!
! This software and the related documents are Intel copyrighted  materials,  and
! your use of  them is  governed by the  express license  under which  they were
! provided to you (License).  Unless the License provides otherwise, you may not
! use, modify, copy, publish, distribute,  disclose or transmit this software or
! the related documents without Intel's prior written permission.
!
! This software and the related documents  are provided as  is,  with no express
! or implied  warranties,  other  than those  that are  expressly stated  in the
! License.
!===============================================================================

!
! Additional constants for use with FFTW3 Fortran wrappers to
! Intel(R) oneAPI Math Kernel Library (Intel(R) oneMKL)
!
!*****************************************************************************

      INTEGER MKL_RODFT00
      PARAMETER (MKL_RODFT00=413)
      INTEGER MKL_MAXRANK
      PARAMETER (MKL_MAXRANK=7)

      external dfftw_plan_dft
      external dfftw_plan_dft_1d
      external dfftw_plan_dft_2d
      external dfftw_plan_dft_3d
      external dfftw_plan_dft_c2r
      external dfftw_plan_dft_c2r_1d
      external dfftw_plan_dft_c2r_2d
      external dfftw_plan_dft_c2r_3d
      external dfftw_plan_dft_r2c
      external dfftw_plan_dft_r2c_1d
      external dfftw_plan_dft_r2c_2d
      external dfftw_plan_dft_r2c_3d
      external dfftw_plan_guru_dft
      external dfftw_plan_guru_dft_r2c
      external dfftw_plan_guru_dft_c2r
      external dfftw_plan_guru_split_dft
      external dfftw_plan_guru_split_dft_c2r
      external dfftw_plan_guru_split_dft_r2c
      external dfftw_plan_many_dft
      external dfftw_plan_many_dft_r2c
      external dfftw_plan_many_dft_c2r
      external dfftw_plan_r2r
      external dfftw_plan_r2r_1d
      external dfftw_plan_r2r_2d
      external dfftw_plan_r2r_3d
      external dfftw_execute
      external dfftw_execute_dft
      external dfftw_execute_dft_c2r
      external dfftw_execute_dft_r2c
      external dfftw_execute_split_dft
      external dfftw_execute_split_dft_r2c
      external dfftw_execute_split_dft_c2r
      external dfftw_destroy_plan

      external sfftw_plan_dft
      external sfftw_plan_dft_1d
      external sfftw_plan_dft_2d
      external sfftw_plan_dft_3d
      external sfftw_plan_dft_c2r
      external sfftw_plan_dft_c2r_1d
      external sfftw_plan_dft_c2r_2d
      external sfftw_plan_dft_c2r_3d
      external sfftw_plan_dft_r2c
      external sfftw_plan_dft_r2c_1d
      external sfftw_plan_dft_r2c_2d
      external sfftw_plan_dft_r2c_3d
      external sfftw_plan_guru_dft
      external sfftw_plan_guru_dft_r2c
      external sfftw_plan_guru_dft_c2r
      external sfftw_plan_guru_split_dft
      external sfftw_plan_guru_split_dft_c2r
      external sfftw_plan_guru_split_dft_r2c
      external sfftw_plan_many_dft
      external sfftw_plan_many_dft_r2c
      external sfftw_plan_many_dft_c2r
      external sfftw_plan_r2r
      external sfftw_plan_r2r_1d
      external sfftw_plan_r2r_2d
      external sfftw_plan_r2r_3d
      external sfftw_execute
      external sfftw_execute_dft
      external sfftw_execute_dft_c2r
      external sfftw_execute_dft_r2c
      external sfftw_execute_split_dft
      external sfftw_execute_split_dft_r2c
      external sfftw_execute_split_dft_c2r
      external sfftw_destroy_plan

