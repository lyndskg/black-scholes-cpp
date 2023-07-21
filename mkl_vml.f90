! file: mkl_vml.fi
!===============================================================================
! Copyright 2006-2022 Intel Corporation.
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

!++
!  Fortran 90 VML interface.
!--

!++
!  PARAMETER DEFINITIONS
!  Parameter definitions for VML mode and VML error status.
!
!  VML mode controls VML function accuracy, floating-point settings (rounding
!  mode and precision) and VML error handling options. Default VML mode is
!  VML_HA | VML_ERRMODE_DEFAULT, i.e. VML high accuracy functions are
!  called, and current floating-point precision and the rounding mode is used.
!
!  Error status macros are used for error classification.
!
!  NOTE: A | B means bitwise OR operation with A and B
!--

!  VML FUNCTION ACCURACY CONTROL
!  VML_HA - when VML_HA is set, high accuracy VML functions are called
!  VML_LA - when VML_LA is set, low accuracy VML functions are called
!  VML_EP - when VML_EP is set, enhanced performance VML functions are called
!
!  NOTE: VML_HA, VML_LA and VML_EP must not be used in combination
      INTEGER(KIND=4) VML_LA
      INTEGER(KIND=4) VML_HA
      INTEGER(KIND=4) VML_EP
      PARAMETER (VML_LA = INT( Z"00000001", 4 ))
      PARAMETER (VML_HA = INT( Z"00000002", 4 ))
      PARAMETER (VML_EP = INT( Z"00000003", 4 ))

      INTEGER(KIND=8) VML_LA_64
      INTEGER(KIND=8) VML_HA_64
      INTEGER(KIND=8) VML_EP_64
      PARAMETER (VML_LA_64 = INT( Z"00000001", 8 ))
      PARAMETER (VML_HA_64 = INT( Z"00000002", 8 ))
      PARAMETER (VML_EP_64 = INT( Z"00000003", 8 ))

!  SETTING OPTIMAL FLOATING-POINT PRECISION AND ROUNDING MODE
!  Definitions below are to set optimal floating-point control word
!  (precision and rounding mode).
!
!  For their correct work, VML functions change floating-point precision and
!  rounding mode (if necessary). Since control word changing is typically
!  expensive operation, it is recommended to set precision and rounding mode
!  to optimal values before VML function calls.
!
!  VML_FLOAT_CONSISTENT  - use this value if the calls are typically to single
!                          precision VML functions
!  VML_DOUBLE_CONSISTENT - use this value if the calls are typically to double
!                          precision VML functions
!  VML_RESTORE           - restore original floating-point precision and
!                          rounding mode
!  VML_DEFAULT_PRECISION - use default (current) floating-point precision and
!                          rounding mode
!  NOTE: VML_FLOAT_CONSISTENT, VML_DOUBLE_CONSISTENT, VML_RESTORE and
!        VML_DEFAULT_PRECISION must not be used in combination
      INTEGER(KIND=4) VML_DEFAULT_PRECISION
      INTEGER(KIND=4) VML_FLOAT_CONSISTENT
      INTEGER(KIND=4) VML_DOUBLE_CONSISTENT
      INTEGER(KIND=4) VML_RESTORE
      PARAMETER (VML_DEFAULT_PRECISION = INT( Z"00000000", 4 ))
      PARAMETER (VML_FLOAT_CONSISTENT  = INT( Z"00000010", 4 ))
      PARAMETER (VML_DOUBLE_CONSISTENT = INT( Z"00000020", 4 ))
      PARAMETER (VML_RESTORE           = INT( Z"00000030", 4 ))

      INTEGER(KIND=8) VML_DEFAULT_PRECISION_64
      INTEGER(KIND=8) VML_FLOAT_CONSISTENT_64
      INTEGER(KIND=8) VML_DOUBLE_CONSISTENT_64
      INTEGER(KIND=8) VML_RESTORE_64
      PARAMETER (VML_DEFAULT_PRECISION_64 = INT( Z"00000000", 8 ))
      PARAMETER (VML_FLOAT_CONSISTENT_64  = INT( Z"00000010", 8 ))
      PARAMETER (VML_DOUBLE_CONSISTENT_64 = INT( Z"00000020", 8 ))
      PARAMETER (VML_RESTORE_64           = INT( Z"00000030", 8 ))

!  VML ERROR HANDLING CONTROL
!  Macros below are used to control VML error handler.
!
!  VML_ERRMODE_IGNORE   - ignore errors
!  VML_ERRMODE_ERRNO    - errno variable is set on error
!  VML_ERRMODE_STDERR   - error description text is written to stderr on error
!  VML_ERRMODE_EXCEPT   - exception is raised on error
!  VML_ERRMODE_CALLBACK - user's error handler function is called on error
!  VML_ERRMODE_NOERR    - ignore errors and do not update status
!  VML_ERRMODE_DEFAULT  - errno variable is set, exceptions are raised and
!                         user's error handler is called on error
!  NOTE: VML_ERRMODE_IGNORE must not be used in combination with
!        VML_ERRMODE_ERRNO, VML_ERRMODE_STDERR, VML_ERRMODE_EXCEPT,
!        VML_ERRMODE_CALLBACK and VML_ERRMODE_DEFAULT.
!  NOTE: VML_ERRMODE_NOERR must not be used in combination with any
!        other VML_ERRMODE setting.
      INTEGER(KIND=4) VML_ERRMODE_IGNORE
      INTEGER(KIND=4) VML_ERRMODE_ERRNO
      INTEGER(KIND=4) VML_ERRMODE_STDERR
      INTEGER(KIND=4) VML_ERRMODE_EXCEPT
      INTEGER(KIND=4) VML_ERRMODE_CALLBACK
      INTEGER(KIND=4) VML_ERRMODE_NOERR
      INTEGER(KIND=4) VML_ERRMODE_DEFAULT
      PARAMETER (VML_ERRMODE_IGNORE   = INT( Z"00000100", 4 ))
      PARAMETER (VML_ERRMODE_ERRNO    = INT( Z"00000200", 4 ))
      PARAMETER (VML_ERRMODE_STDERR   = INT( Z"00000400", 4 ))
      PARAMETER (VML_ERRMODE_EXCEPT   = INT( Z"00000800", 4 ))
      PARAMETER (VML_ERRMODE_CALLBACK = INT( Z"00001000", 4 ))
      PARAMETER (VML_ERRMODE_NOERR    = INT( Z"00002000", 4 ))
      PARAMETER (VML_ERRMODE_DEFAULT  = IOR(VML_ERRMODE_ERRNO,          &
     &           IOR(VML_ERRMODE_CALLBACK,VML_ERRMODE_EXCEPT)))

      INTEGER(KIND=8) VML_ERRMODE_IGNORE_64
      INTEGER(KIND=8) VML_ERRMODE_ERRNO_64
      INTEGER(KIND=8) VML_ERRMODE_STDERR_64
      INTEGER(KIND=8) VML_ERRMODE_EXCEPT_64
      INTEGER(KIND=8) VML_ERRMODE_CALLBACK_64
      INTEGER(KIND=8) VML_ERRMODE_NOERR_64
      INTEGER(KIND=8) VML_ERRMODE_DEFAULT_64
      PARAMETER (VML_ERRMODE_IGNORE_64   = INT( Z"00000100", 8 ))
      PARAMETER (VML_ERRMODE_ERRNO_64    = INT( Z"00000200", 8 ))
      PARAMETER (VML_ERRMODE_STDERR_64   = INT( Z"00000400", 8 ))
      PARAMETER (VML_ERRMODE_EXCEPT_64   = INT( Z"00000800", 8 ))
      PARAMETER (VML_ERRMODE_CALLBACK_64 = INT( Z"00001000", 8 ))
      PARAMETER (VML_ERRMODE_NOERR_64    = INT( Z"00002000", 8 ))
      PARAMETER (VML_ERRMODE_DEFAULT_64  = IOR(VML_ERRMODE_ERRNO_64,    &
     &           IOR(VML_ERRMODE_CALLBACK_64,VML_ERRMODE_EXCEPT_64)))

!  ACCURACY, FLOATING-POINT CONTROL AND ERROR HANDLING MASKS
!  Accuracy, floating-point and error handling control are packed in
!  the VML mode variable. Macros below are useful to extract accuracy and/or
!  floating-point control and/or error handling control settings.
!
!  VML_ACCURACY_MASK           - extract accuracy bits
!  VML_FPUMODE_MASK            - extract floating-point control bits
!  VML_ERRMODE_MASK            - extract error handling control bits
!                                (including error callback bits)
!  VML_ERRMODE_STDHANDLER_MASK - extract error handling control bits
!                                (not including error callback bits)
!  VML_ERRMODE_CALLBACK_MASK   - extract error callback bits
      INTEGER(KIND=4) VML_ACCURACY_MASK
      INTEGER(KIND=4) VML_FPUMODE_MASK
      INTEGER(KIND=4) VML_ERRMODE_MASK
      INTEGER(KIND=4) VML_ERRMODE_STDHANDLER_MASK
      INTEGER(KIND=4) VML_ERRMODE_CALLBACK_MASK
      PARAMETER (VML_ACCURACY_MASK           = INT( Z"0000000f", 4 ))
      PARAMETER (VML_FPUMODE_MASK            = INT( Z"000000f0", 4 ))
      PARAMETER (VML_ERRMODE_MASK            = INT( Z"0000ff00", 4 ))
      PARAMETER (VML_ERRMODE_STDHANDLER_MASK = INT( Z"00000f00", 4 ))
      PARAMETER (VML_ERRMODE_CALLBACK_MASK   = INT( Z"0000f000", 4 ))

      INTEGER(KIND=8) VML_ACCURACY_MASK_64
      INTEGER(KIND=8) VML_FPUMODE_MASK_64
      INTEGER(KIND=8) VML_ERRMODE_MASK_64
      INTEGER(KIND=8) VML_ERRMODE_STDHANDLER_MASK_64
      INTEGER(KIND=8) VML_ERRMODE_CALLBACK_MASK_64
      PARAMETER (VML_ACCURACY_MASK_64           = INT( Z"0000000f", 8 ))
      PARAMETER (VML_FPUMODE_MASK_64            = INT( Z"000000f0", 8 ))
      PARAMETER (VML_ERRMODE_MASK_64            = INT( Z"0000ff00", 8 ))
      PARAMETER (VML_ERRMODE_STDHANDLER_MASK_64 = INT( Z"00000f00", 8 ))
      PARAMETER (VML_ERRMODE_CALLBACK_MASK_64   = INT( Z"0000f000", 8 ))

!  ERROR STATUS PARAMETER DEFINITIONS
!  VML_STATUS_OK        - no errors
!  VML_STATUS_BADSIZE   - array dimension is not positive
!  VML_STATUS_BADMEM    - invalid pointer passed
!  VML_STATUS_ERRDOM    - at least one of arguments is out of function domain
!  VML_STATUS_SING      - at least one of arguments caused singularity
!  VML_STATUS_OVERFLOW  - at least one of arguments caused overflow
!  VML_STATUS_UNDERFLOW - at least one of arguments caused underflow
!  VML_STATUS_ACCURACYWARNING - function doesn't support set accuracy mode,
!                               lower accuracy mode was used instead
      INTEGER(KIND=4) VML_STATUS_OK
      INTEGER(KIND=4) VML_STATUS_BADSIZE
      INTEGER(KIND=4) VML_STATUS_BADMEM
      INTEGER(KIND=4) VML_STATUS_ERRDOM
      INTEGER(KIND=4) VML_STATUS_SING
      INTEGER(KIND=4) VML_STATUS_OVERFLOW
      INTEGER(KIND=4) VML_STATUS_UNDERFLOW
      INTEGER(KIND=4) VML_STATUS_ACCURACYWARNING
      PARAMETER (VML_STATUS_OK              = INT(    0, 4 ))
      PARAMETER (VML_STATUS_BADSIZE         = INT(   -1, 4 ))
      PARAMETER (VML_STATUS_BADMEM          = INT(   -2, 4 ))
      PARAMETER (VML_STATUS_ERRDOM          = INT(    1, 4 ))
      PARAMETER (VML_STATUS_SING            = INT(    2, 4 ))
      PARAMETER (VML_STATUS_OVERFLOW        = INT(    3, 4 ))
      PARAMETER (VML_STATUS_UNDERFLOW       = INT(    4, 4 ))
      PARAMETER (VML_STATUS_ACCURACYWARNING = INT( 1000, 4 ))

      INTEGER(KIND=8) VML_STATUS_OK_64
      INTEGER(KIND=8) VML_STATUS_BADSIZE_64
      INTEGER(KIND=8) VML_STATUS_BADMEM_64
      INTEGER(KIND=8) VML_STATUS_ERRDOM_64
      INTEGER(KIND=8) VML_STATUS_SING_64
      INTEGER(KIND=8) VML_STATUS_OVERFLOW_64
      INTEGER(KIND=8) VML_STATUS_UNDERFLOW_64
      INTEGER(KIND=8) VML_STATUS_ACCURACYWARNING_64
      PARAMETER (VML_STATUS_OK_64              = INT(    0, 8 ))
      PARAMETER (VML_STATUS_BADSIZE_64         = INT(   -1, 8 ))
      PARAMETER (VML_STATUS_BADMEM_64          = INT(   -2, 8 ))
      PARAMETER (VML_STATUS_ERRDOM_64          = INT(    1, 8 ))
      PARAMETER (VML_STATUS_SING_64            = INT(    2, 8 ))
      PARAMETER (VML_STATUS_OVERFLOW_64        = INT(    3, 8 ))
      PARAMETER (VML_STATUS_UNDERFLOW_64       = INT(    4, 8 ))
      PARAMETER (VML_STATUS_ACCURACYWARNING_64 = INT( 1000, 8 ))

!++
!  TYPE DEFINITIONS
!--

!  ERROR CALLBACK CONTEXT.
!  Error callback context structure is used in a user's error callback
!  function with the following interface:
!
!  Error callback context fields:
!  ICODE        - error status
!  IINDEX       - index of bad argument
!  DBA1         - 1-st argument value, at which error occured
!  DBA2         - 2-nd argument value, at which error occured
!                 (2-argument functions only)
!  DBR1         - 1-st resulting value
!  DBR2         - 2-nd resulting value (2-result functions only)
!  CFUNCNAME    - function name, for which error occured
!  IFUNCNAMELEN - length of function name
      !dec$ options /warn=noalignment
      TYPE ERROR_STRUCTURE
            SEQUENCE
            INTEGER(KIND=4) ICODE
            INTEGER(KIND=4) IINDEX
            REAL(KIND=8)    DBA1
            REAL(KIND=8)    DBA2
            REAL(KIND=8)    DBR1
            REAL(KIND=8)    DBR2
            CHARACTER(64)   CFUNCNAME
            INTEGER(KIND=4) IFUNCNAMELEN
            REAL(KIND=8)    DBA1IM
            REAL(KIND=8)    DBA2IM
            REAL(KIND=8)    DBR1IM
            REAL(KIND=8)    DBR2IM
      END TYPE ERROR_STRUCTURE
      !dec$ end options

!++
!  VML ELEMENTARY FUNCTION INTERFACES.
!--

!  Absolute value: r[i] = |a[i]|

      INTERFACE
        SUBROUTINE vsabs(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsabsi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdabs(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdabsi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsabs(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsabsi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdabs(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdabsi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex absolute value: r[i] = |a[i]|

      INTERFACE
        SUBROUTINE vcabs(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          REAL(KIND=4),INTENT(OUT)    :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcabsi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          REAL(KIND=4),INTENT(OUT)    :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzabs(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          REAL(KIND=8),INTENT(OUT)    :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzabsi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          REAL(KIND=8),INTENT(OUT)    :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcabs(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          REAL(KIND=4),INTENT(OUT)    :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcabsi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          REAL(KIND=4),INTENT(OUT)    :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzabs(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          REAL(KIND=8),INTENT(OUT)    :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzabsi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          REAL(KIND=8),INTENT(OUT)    :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Argument of complex value: r[i] = carg(a[i])

      INTERFACE
        SUBROUTINE vcarg(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          REAL(KIND=4),INTENT(OUT)    :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcargi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          REAL(KIND=4),INTENT(OUT)    :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzarg(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          REAL(KIND=8),INTENT(OUT)    :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzargi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          REAL(KIND=8),INTENT(OUT)    :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcarg(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          REAL(KIND=4),INTENT(OUT)    :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcargi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          REAL(KIND=4),INTENT(OUT)    :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzarg(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          REAL(KIND=8),INTENT(OUT)    :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzargi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          REAL(KIND=8),INTENT(OUT)    :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Addition: r[i] = a[i] + b[i]

      INTERFACE
        SUBROUTINE vsadd(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsaddi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdadd(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdaddi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsadd(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsaddi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdadd(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdaddi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex addition: r[i] = a[i] + b[i]

      INTERFACE
        SUBROUTINE vcadd(n,a,b,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcaddi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzadd(n,a,b,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzaddi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcadd(n,a,b,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcaddi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzadd(n,a,b,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzaddi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Subtraction: r[i] = a[i] - b[i]

      INTERFACE
        SUBROUTINE vssub(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vssubi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsub(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsubi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssub(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssubi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsub(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsubi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex subtraction: r[i] = a[i] - b[i]

      INTERFACE
        SUBROUTINE vcsub(n,a,b,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcsubi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzsub(n,a,b,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzsubi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcsub(n,a,b,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcsubi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzsub(n,a,b,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzsubi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Reciprocal: r[i] = 1.0 / a[i]

      INTERFACE
        SUBROUTINE vsinv(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsinvi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdinv(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdinvi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsinv(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsinvi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdinv(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdinvi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Square Root: r[i] = a[i]^0.5

      INTERFACE
        SUBROUTINE vssqrt(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vssqrti(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsqrt(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsqrti(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssqrt(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssqrti(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsqrt(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsqrti(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Square Root: r[i] = a[i]^0.5

      INTERFACE
        SUBROUTINE vcsqrt(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcsqrti(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzsqrt(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzsqrti(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcsqrt(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcsqrti(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzsqrt(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzsqrti(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Reciprocal Square Root: r[i] = 1/a[i]^0.5

      INTERFACE
        SUBROUTINE vsinvsqrt(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsinvsqrti(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdinvsqrt(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdinvsqrti(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsinvsqrt(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsinvsqrti(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdinvsqrt(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdinvsqrti(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Cube Root: r[i] = a[i]^(1/3)

      INTERFACE
        SUBROUTINE vscbrt(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vscbrti(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcbrt(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcbrti(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscbrt(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscbrti(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcbrt(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcbrti(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Reciprocal Cube Root: r[i] = 1/a[i]^(1/3)

      INTERFACE
        SUBROUTINE vsinvcbrt(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsinvcbrti(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdinvcbrt(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdinvcbrti(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsinvcbrt(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsinvcbrti(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdinvcbrt(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdinvcbrti(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Squaring: r[i] = a[i]^2

      INTERFACE
        SUBROUTINE vssqr(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vssqri(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsqr(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsqri(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssqr(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssqri(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsqr(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsqri(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Exponential Function: r[i] = e^a[i]

      INTERFACE
        SUBROUTINE vsexp(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsexpi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdexp(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdexpi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsexp(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsexpi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdexp(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdexpi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Exponential Function: r[i] = e^a[i]

      INTERFACE
        SUBROUTINE vcexp(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcexpi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzexp(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzexpi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcexp(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcexpi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzexp(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzexpi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Exponential of arguments decreased by 1: r[i] = e^(a[i]-1)

      INTERFACE
        SUBROUTINE vsexpm1(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsexpm1i(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdexpm1(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdexpm1i(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsexpm1(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsexpm1i(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdexpm1(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdexpm1i(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Logarithm (base e): r[i] = ln(a[i])

      INTERFACE
        SUBROUTINE vsln(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vslni(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdln(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlni(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsln(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslni(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdln(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlni(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Logarithm (base e): r[i] = ln(a[i])

      INTERFACE
        SUBROUTINE vcln(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vclni(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzln(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzlni(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcln(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmclni(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzln(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzlni(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Logarithm (base 10): r[i] = lg(a[i])

      INTERFACE
        SUBROUTINE vslog10(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vslog10i(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlog10(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlog10i(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslog10(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslog10i(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlog10(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlog10i(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Logarithm (base e) of arguments increased by 1: r[i] = log(1+a[i])

      INTERFACE
        SUBROUTINE vslog1p(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vslog1pi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlog1p(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlog1pi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslog1p(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslog1pi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlog1p(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlog1pi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Logarithm (base 10): r[i] = lg(a[i])

      INTERFACE
        SUBROUTINE vclog10(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vclog10i(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzlog10(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzlog10i(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmclog10(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmclog10i(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzlog10(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzlog10i(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Sine: r[i] = sin(a[i])

      INTERFACE
        SUBROUTINE vssin(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vssini(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsin(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsini(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssin(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssini(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsin(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsini(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Sine: r[i] = sin(a[i])

      INTERFACE
        SUBROUTINE vcsin(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcsini(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzsin(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzsini(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcsin(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcsini(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzsin(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzsini(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Cosine: r[i] = cos(a[i])

      INTERFACE
        SUBROUTINE vscos(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vscosi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcos(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcosi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscos(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscosi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcos(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcosi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Cosine: r[i] = cos(a[i])

      INTERFACE
        SUBROUTINE vccos(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vccosi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzcos(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzcosi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmccos(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmccosi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzcos(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzcosi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Tangent: r[i] = tan(a[i])

      INTERFACE
        SUBROUTINE vstan(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vstani(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtan(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtani(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstan(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstani(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtan(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtani(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Tangent: r[i] = tan(a[i])

      INTERFACE
        SUBROUTINE vctan(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vctani(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vztan(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vztani(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmctan(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmctani(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmztan(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmztani(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Hyperbolic Sine: r[i] = sh(a[i])

      INTERFACE
        SUBROUTINE vssinh(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vssinhi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsinh(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsinhi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssinh(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssinhi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsinh(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsinhi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Hyperbolic Sine: r[i] = sh(a[i])

      INTERFACE
        SUBROUTINE vcsinh(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcsinhi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzsinh(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzsinhi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcsinh(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcsinhi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzsinh(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzsinhi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Hyperbolic Cosine: r[i] = ch(a[i])

      INTERFACE
        SUBROUTINE vscosh(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vscoshi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcosh(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcoshi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscosh(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscoshi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcosh(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcoshi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Hyperbolic Cosine: r[i] = ch(a[i])

      INTERFACE
        SUBROUTINE vccosh(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vccoshi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzcosh(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzcoshi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmccosh(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmccoshi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzcosh(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzcoshi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Hyperbolic Tangent: r[i] = th(a[i])

      INTERFACE
        SUBROUTINE vstanh(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vstanhi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtanh(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtanhi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstanh(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstanhi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtanh(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtanhi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Hyperbolic Tangent: r[i] = th(a[i])

      INTERFACE
        SUBROUTINE vctanh(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vctanhi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vztanh(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vztanhi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmctanh(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmctanhi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmztanh(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmztanhi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Arc Cosine: r[i] = arccos(a[i])

      INTERFACE
        SUBROUTINE vsacos(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsacosi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdacos(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdacosi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsacos(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsacosi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdacos(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdacosi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Arc Cosine: r[i] = arccos(a[i])

      INTERFACE
        SUBROUTINE vcacos(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcacosi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzacos(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzacosi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcacos(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcacosi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzacos(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzacosi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Arc Sine: r[i] = arcsin(a[i])

      INTERFACE
        SUBROUTINE vsasin(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsasini(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdasin(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdasini(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsasin(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsasini(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdasin(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdasini(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Arc Sine: r[i] = arcsin(a[i])

      INTERFACE
        SUBROUTINE vcasin(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcasini(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzasin(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzasini(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcasin(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcasini(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzasin(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzasini(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Arc Tangent: r[i] = arctan(a[i])

      INTERFACE
        SUBROUTINE vsatan(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsatani(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdatan(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdatani(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsatan(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsatani(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdatan(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdatani(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Arc Tangent: r[i] = arctan(a[i])

      INTERFACE
        SUBROUTINE vcatan(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcatani(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzatan(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzatani(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcatan(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcatani(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzatan(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzatani(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Hyperbolic Arc Cosine: r[i] = arcch(a[i])

      INTERFACE
        SUBROUTINE vsacosh(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsacoshi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdacosh(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdacoshi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsacosh(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsacoshi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdacosh(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdacoshi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Hyperbolic Arc Cosine: r[i] = arcch(a[i])

      INTERFACE
        SUBROUTINE vcacosh(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcacoshi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzacosh(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzacoshi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcacosh(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcacoshi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzacosh(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzacoshi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Hyperbolic Arc Sine: r[i] = arcsh(a[i])

      INTERFACE
        SUBROUTINE vsasinh(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsasinhi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdasinh(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdasinhi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsasinh(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsasinhi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdasinh(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdasinhi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Hyperbolic Arc Sine: r[i] = arcsh(a[i])

      INTERFACE
        SUBROUTINE vcasinh(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcasinhi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzasinh(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzasinhi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcasinh(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcasinhi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzasinh(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzasinhi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Hyperbolic Arc Tangent: r[i] = arcth(a[i])

      INTERFACE
        SUBROUTINE vsatanh(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsatanhi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdatanh(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdatanhi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsatanh(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsatanhi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdatanh(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdatanhi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Hyperbolic Arc Tangent: r[i] = arcth(a[i])

      INTERFACE
        SUBROUTINE vcatanh(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcatanhi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzatanh(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzatanhi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcatanh(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcatanhi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzatanh(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzatanhi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Error Function: r[i] = erf(a[i])

      INTERFACE
        SUBROUTINE vserf(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vserfi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vderf(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vderfi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmserf(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmserfi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmderf(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmderfi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Inverse error function: r[i] = erfinv(a[i])

      INTERFACE
        SUBROUTINE vserfinv(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vserfinvi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vderfinv(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vderfinvi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmserfinv(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmserfinvi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmderfinv(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmderfinvi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Square root of the sum of the squares: r[i] = hypot(a[i],b[i])

      INTERFACE
        SUBROUTINE vshypot(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(IN)    :: b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vshypoti(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(IN)    :: b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdhypot(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(IN)    :: b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdhypoti(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(IN)    :: b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmshypot(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(IN)    :: b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmshypoti(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(IN)    :: b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdhypot(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(IN)    :: b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdhypoti(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(IN)    :: b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complementary Error Function: r[i] = 1 - erf(a[i])

      INTERFACE
        SUBROUTINE vserfc(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vserfci(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vderfc(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vderfci(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmserfc(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmserfci(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmderfc(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmderfci(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Inverse complementary error function: r[i] = erfcinv(a[i])

      INTERFACE
        SUBROUTINE vserfcinv(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vserfcinvi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vderfcinv(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vderfcinvi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmserfcinv(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmserfcinvi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmderfcinv(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmderfcinvi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Cumulative normal distribution function: r[i] = cdfnorm(a[i])

      INTERFACE
        SUBROUTINE vscdfnorm(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vscdfnormi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcdfnorm(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcdfnormi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscdfnorm(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscdfnormi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcdfnorm(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcdfnormi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Inverse cumulative normal distribution function:
!  r[i] = cdfnorminv(a[i])

      INTERFACE
        SUBROUTINE vscdfnorminv(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vscdfnorminvi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcdfnorminv(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcdfnorminvi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscdfnorminv(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscdfnorminvi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcdfnorminv(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcdfnorminvi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Logarithm (base e) of the absolute value of gamma function:
!  r[i] = lgamma(a[i])

      INTERFACE
        SUBROUTINE vslgamma(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vslgammai(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlgamma(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlgammai(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslgamma(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslgammai(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlgamma(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlgammai(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Gamma function: r[i] = tgamma(a[i])

      INTERFACE
        SUBROUTINE vstgamma(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vstgammai(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtgamma(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtgammai(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstgamma(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstgammai(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtgamma(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtgammai(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Arc Tangent of a/b: r[i] = arctan(a[i]/b[i])

      INTERFACE
        SUBROUTINE vsatan2(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsatan2i(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdatan2(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdatan2i(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsatan2(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsatan2i(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdatan2(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdatan2i(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Multiplicaton: r[i] = a[i] * b[i]

      INTERFACE
        SUBROUTINE vsmul(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsmuli(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdmul(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdmuli(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsmul(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsmuli(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdmul(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdmuli(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex multiplicaton: r[i] = a[i] * b[i]

      INTERFACE
        SUBROUTINE vcmul(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          COMPLEX(KIND=4),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcmuli(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          COMPLEX(KIND=4),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzmul(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          COMPLEX(KIND=8),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzmuli(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          COMPLEX(KIND=8),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcmul(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          COMPLEX(KIND=4),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN)    :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcmuli(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          COMPLEX(KIND=4),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN)    :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzmul(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          COMPLEX(KIND=8),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN)    :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzmuli(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          COMPLEX(KIND=8),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN)    :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Division: r[i] = a[i] / b[i]

      INTERFACE
        SUBROUTINE vsdiv(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsdivi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vddiv(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vddivi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsdiv(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsdivi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmddiv(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmddivi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex division: r[i] = a[i] / b[i]

      INTERFACE
        SUBROUTINE vcdiv(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          COMPLEX(KIND=4),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcdivi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          COMPLEX(KIND=4),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzdiv(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          COMPLEX(KIND=8),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzdivi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          COMPLEX(KIND=8),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcdiv(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          COMPLEX(KIND=4),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN)    :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcdivi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          COMPLEX(KIND=4),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN)    :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzdiv(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          COMPLEX(KIND=8),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN)    :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzdivi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          COMPLEX(KIND=8),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN)    :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Power Function: r[i] = a[i]^b[i]

      INTERFACE
        SUBROUTINE vspow(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vspowi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpow(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpowi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmspow(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmspowi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdpow(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdpowi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Power Function: r[i] = a[i]^b[i]

      INTERFACE
        SUBROUTINE vcpow(n,a,b,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcpowi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzpow(n,a,b,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzpowi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcpow(n,a,b,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcpowi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzpow(n,a,b,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzpowi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Power Function: r[i] = a[i]^(3/2)

      INTERFACE
        SUBROUTINE vspow3o2(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vspow3o2i(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpow3o2(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpow3o2i(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmspow3o2(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmspow3o2i(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdpow3o2(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdpow3o2i(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Power Function: r[i] = a[i]^(2/3)

      INTERFACE
        SUBROUTINE vspow2o3(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vspow2o3i(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpow2o3(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpow2o3i(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmspow2o3(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmspow2o3i(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdpow2o3(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdpow2o3i(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Power Function with Fixed Degree: r[i] = a[i]^b

      INTERFACE
        SUBROUTINE vspowx(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: b
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vspowxi(n,a,inca,b,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: b
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpowx(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: b
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpowxi(n,a,inca,b,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: b
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmspowx(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: b
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmspowxi(n,a,inca,b,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: b
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdpowx(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: b
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdpowxi(n,a,inca,b,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: b
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Power Function with Fixed Degree: r[i] = a[i]^b

      INTERFACE
        SUBROUTINE vcpowx(n,a,b,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: b
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcpowxi(n,a,inca,b,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: b
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzpowx(n,a,b,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: b
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzpowxi(n,a,inca,b,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: b
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcpowx(n,a,b,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: b
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcpowxi(n,a,inca,b,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: b
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzpowx(n,a,b,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: b
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzpowxi(n,a,inca,b,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: b
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Sine & Cosine: r1[i] = sin(a[i]), r2[i]=cos(a[i])

      INTERFACE
        SUBROUTINE vssincos(n,a,r1,r2)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r1(n),r2(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vssincosi(n,a,inca,r1,incr1,r2,incr2)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr1
          INTEGER,INTENT(IN) :: incr2
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsincos(n,a,r1,r2)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r1(n),r2(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsincosi(n,a,inca,r1,incr1,r2,incr2)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr1
          INTEGER,INTENT(IN) :: incr2
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssincos(n,a,r1,r2,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssincosi(n,a,inca,r1,incr1,r2,incr2,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr1
          INTEGER,INTENT(IN) :: incr2
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsincos(n,a,r1,r2,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsincosi(n,a,inca,r1,incr1,r2,incr2,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr1
          INTEGER,INTENT(IN) :: incr2
        END SUBROUTINE
      END INTERFACE

!  Linear fraction: r[i] = (a[i]*scalea + shifta)/(b[i]*scaleb + shiftb)

      INTERFACE
        SUBROUTINE vslinearfrac(n,a,b,scalea,shifta,scaleb,shiftb,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(IN)    :: scalea,shifta,scaleb,shiftb
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vslinearfraci(n,a,inca,b,incb,scalea,shifta,scaleb,  &
     &      shiftb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(IN)    :: scalea,shifta,scaleb,shiftb
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlinearfrac(n,a,b,scalea,shifta,scaleb,shiftb,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(IN)    :: scalea,shifta,scaleb,shiftb
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlinearfraci(n,a,inca,b,incb,scalea,shifta,scaleb,  &
     &      shiftb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(IN)    :: scalea,shifta,scaleb,shiftb
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslinearfrac(n,a,b,scalea,shifta,scaleb,shiftb,r,   &
     &                           mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(IN)    :: scalea,shifta,scaleb,shiftb
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslinearfraci(n,a,inca,b,incb,scalea,shifta,scaleb, &
     &      shiftb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(IN)    :: scalea,shifta,scaleb,shiftb
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlinearfrac(n,a,b,scalea,shifta,scaleb,shiftb,r,   &
     &                           mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(IN)    :: scalea,shifta,scaleb,shiftb
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlinearfraci(n,a,inca,b,incb,scalea,shifta,scaleb, &
     &      shiftb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(IN)    :: scalea,shifta,scaleb,shiftb
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Integer value rounded towards plus infinity: r[i] = ceil(a[i])

      INTERFACE
        SUBROUTINE vsceil(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsceili(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdceil(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdceili(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsceil(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsceili(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdceil(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdceili(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Integer value rounded towards minus infinity: r[i] = floor(a[i])

      INTERFACE
        SUBROUTINE vsfloor(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsfloori(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfloor(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfloori(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfloor(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfloori(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfloor(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfloori(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Signed fraction part

      INTERFACE
        SUBROUTINE vsfrac(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsfraci(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfrac(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfraci(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfrac(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfraci(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfrac(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfraci(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE


!  Truncated integer value and the remaining fraction part

      INTERFACE
        SUBROUTINE vsmodf(n,a,r1,r2)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r1(n),r2(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsmodfi(n,a,inca,r1,incr1,r2,incr2)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr1
          INTEGER,INTENT(IN) :: incr2
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdmodf(n,a,r1,r2)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r1(n),r2(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdmodfi(n,a,inca,r1,incr1,r2,incr2)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr1
          INTEGER,INTENT(IN) :: incr2
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsmodf(n,a,r1,r2,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsmodfi(n,a,inca,r1,incr1,r2,incr2,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr1
          INTEGER,INTENT(IN) :: incr2
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdmodf(n,a,r1,r2,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdmodfi(n,a,inca,r1,incr1,r2,incr2,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr1
          INTEGER,INTENT(IN) :: incr2
        END SUBROUTINE
      END INTERFACE

!  Rounded integer value in the current rounding mode:
!  r[i] = nearbyint(a[i])

      INTERFACE
        SUBROUTINE vsnearbyint(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsnearbyinti(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdnearbyint(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdnearbyinti(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsnearbyint(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsnearbyinti(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdnearbyint(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdnearbyinti(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Rounded integer value in the current rounding mode with inexact
!  result exception raised for rach changed value: r[i] = rint(a[i])

      INTERFACE
        SUBROUTINE vsrint(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsrinti(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdrint(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdrinti(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsrint(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsrinti(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdrint(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdrinti(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Value rounded to the nearest integer: r[i] = round(a[i])

      INTERFACE
        SUBROUTINE vsround(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsroundi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdround(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdroundi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsround(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsroundi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdround(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdroundi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Truncated integer value and the temaining fraction part:
!  r[i] = trunc(a[i])

      INTERFACE
        SUBROUTINE vstrunc(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vstrunci(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtrunc(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtrunci(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstrunc(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstrunci(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtrunc(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtrunci(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Element by element conjugation: r[i] = conj(a[i])

      INTERFACE
        SUBROUTINE vcconj(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcconji(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzconj(n,a,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzconji(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcconj(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcconji(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzconj(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzconji(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Element by element multiplication of vector A element and
!  conjugated vector B element: r[i] = mulbyconj(a[i],b[i])

      INTERFACE
        SUBROUTINE vcmulbyconj(n,a,b,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcmulbyconji(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzmulbyconj(n,a,b,r)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzmulbyconji(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcmulbyconj(n,a,b,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcmulbyconji(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzmulbyconj(n,a,b,r,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzmulbyconji(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex exponent of real vector elements: r[i] = CIS(a[i])

      INTERFACE
        SUBROUTINE vccis(n,a,r)
          INTEGER,INTENT(IN)  :: n
          REAL(KIND=4),INTENT(IN)     :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vccisi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          REAL(KIND=4),INTENT(IN)     :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzcis(n,a,r)
          INTEGER,INTENT(IN)  :: n
          REAL(KIND=8),INTENT(IN)     :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzcisi(n,a,inca,r,incr)
          INTEGER,INTENT(IN)  :: n
          REAL(KIND=8),INTENT(IN)     :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmccis(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          REAL(KIND=4),INTENT(IN)     :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmccisi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          REAL(KIND=4),INTENT(IN)     :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzcis(n,a,r,mode)
          INTEGER,INTENT(IN)  :: n
          REAL(KIND=8),INTENT(IN)     :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzcisi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN)  :: n
          REAL(KIND=8),INTENT(IN)     :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Exponential integral: r[i] = e1(a[i])

      INTERFACE
        SUBROUTINE vsexpint1(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsexpint1i(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdexpint1(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdexpint1i(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsexpint1(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsexpint1i(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdexpint1(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdexpint1i(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Cosine: r[i] = cos(a[i]*PI)

      INTERFACE
        SUBROUTINE vscospi(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vscospii(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcospi(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcospii(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscospi(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscospii(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcospi(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcospii(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Sine: r[i] = sin(a[i]*PI)

      INTERFACE
        SUBROUTINE vssinpi(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vssinpii(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsinpi(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsinpii(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssinpi(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssinpii(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsinpi(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsinpii(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Tangent: r[i] = tan(a[i]*PI)

      INTERFACE
        SUBROUTINE vstanpi(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vstanpii(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtanpi(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtanpii(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstanpi(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstanpii(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtanpi(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtanpii(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Arc cosine: r[i] = acos(a[i])/PI

      INTERFACE
        SUBROUTINE vsacospi(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsacospii(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdacospi(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdacospii(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsacospi(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsacospii(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdacospi(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdacospii(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Arc sine: r[i] = asin(a[i])/PI

      INTERFACE
        SUBROUTINE vsasinpi(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsasinpii(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdasinpi(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdasinpii(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsasinpi(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsasinpii(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdasinpi(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdasinpii(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Arc tangent: r[i] = atan(a[i])/PI

      INTERFACE
        SUBROUTINE vsatanpi(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsatanpii(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdatanpi(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdatanpii(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsatanpi(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsatanpii(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdatanpi(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdatanpii(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Cosine: r[i] = cos(a[i]*PI/180)

      INTERFACE
        SUBROUTINE vscosd(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vscosdi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcosd(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcosdi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscosd(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscosdi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcosd(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcosdi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Sine: r[i] = sin(a[i]*PI/180)

      INTERFACE
        SUBROUTINE vssind(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vssindi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsind(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsindi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssind(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssindi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsind(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsindi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Tangent: r[i] = tan(a[i]*PI/180)

      INTERFACE
        SUBROUTINE vstand(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vstandi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtand(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtandi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstand(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstandi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtand(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtandi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Exponential function (base 2): r[i] = 2^a[i]

      INTERFACE
        SUBROUTINE vsexp2(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsexp2i(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdexp2(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdexp2i(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsexp2(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsexp2i(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdexp2(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdexp2i(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Exponential function (base 10): r[i] = 10^a[i]

      INTERFACE
        SUBROUTINE vsexp10(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsexp10i(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdexp10(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdexp10i(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsexp10(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsexp10i(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdexp10(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdexp10i(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Logarithm (base 2): r[i] = lb(a[i])

      INTERFACE
        SUBROUTINE vslog2(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vslog2i(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlog2(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlog2i(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslog2(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslog2i(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlog2(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlog2i(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Computes the exponent: r[i] = logb(a[i])

      INTERFACE
        SUBROUTINE vslogb(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vslogbi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlogb(n,a,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlogbi(n,a,inca,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslogb(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslogbi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlogb(n,a,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlogbi(n,a,inca,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

! Arc Tangent of a/b Divided by PI: r[i] = arctan(a[i]/b[i])/PI

      INTERFACE
        SUBROUTINE vsatan2pi(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsatan2pii(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdatan2pi(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdatan2pii(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsatan2pi(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsatan2pii(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdatan2pi(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdatan2pii(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Power Function with a[i]>=0: r[i] = a[i]^b[i]

      INTERFACE
        SUBROUTINE vspowr(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vspowri(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpowr(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpowri(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmspowr(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmspowri(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdpowr(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdpowri(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Remainder Function: r[i] = remainder(a[i], b[i])

      INTERFACE
        SUBROUTINE vsremainder(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsremainderi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdremainder(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdremainderi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsremainder(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsremainderi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdremainder(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdremainderi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Modulus Function: r[i] = fmod(a[i], b[i])

      INTERFACE
        SUBROUTINE vsfmod(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsfmodi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfmod(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfmodi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfmod(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfmodi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfmod(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfmodi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Copy Sign Function: r[i] = copysign(a[i], b[i])

      INTERFACE
        SUBROUTINE vscopysign(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vscopysigni(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcopysign(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcopysigni(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscopysign(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscopysigni(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcopysign(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcopysigni(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Next After Function: r[i] = nextafter(a[i], b[i])

      INTERFACE
        SUBROUTINE vsnextafter(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsnextafteri(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdnextafter(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdnextafteri(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsnextafter(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsnextafteri(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdnextafter(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdnextafteri(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Positive Difference Function: r[i] = fdim(a[i], b[i])

      INTERFACE
        SUBROUTINE vsfdim(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsfdimi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfdim(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfdimi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfdim(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfdimi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfdim(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfdimi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Maximum Function: r[i] = fmax(a[i], b[i])

      INTERFACE
        SUBROUTINE vsfmax(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsfmaxi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfmax(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfmaxi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfmax(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfmaxi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfmax(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfmaxi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Minimum Function: r[i] = fmin(a[i], b[i])

      INTERFACE
        SUBROUTINE vsfmin(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsfmini(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfmin(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfmini(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfmin(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfmini(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfmin(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfmini(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Maximum Magnitude Function: r[i] = maxmag(a[i], b[i])

      INTERFACE
        SUBROUTINE vsmaxmag(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsmaxmagi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdmaxmag(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdmaxmagi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsmaxmag(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsmaxmagi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdmaxmag(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdmaxmagi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Minimum magnitude function: r[i] = minmag(a[i], b[i])

      INTERFACE
        SUBROUTINE vsminmag(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsminmagi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdminmag(n,a,b,r)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdminmagi(n,a,inca,b,incb,r,incr)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsminmag(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsminmagi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdminmag(n,a,b,r,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdminmagi(n,a,inca,b,incb,r,incr,mode)
          INTEGER,INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER,INTENT(IN) :: inca
          INTEGER,INTENT(IN) :: incb
          INTEGER,INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE


!  Absolute value: r[i] = |a[i]|

      INTERFACE
        SUBROUTINE vsabs_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsabsi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdabs_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdabsi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsabs_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsabsi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdabs_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdabsi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex absolute value: r[i] = |a[i]|

      INTERFACE
        SUBROUTINE vcabs_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          REAL(KIND=4),INTENT(OUT)    :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcabsi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          REAL(KIND=4),INTENT(OUT)    :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzabs_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          REAL(KIND=8),INTENT(OUT)    :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzabsi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          REAL(KIND=8),INTENT(OUT)    :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcabs_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          REAL(KIND=4),INTENT(OUT)    :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcabsi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          REAL(KIND=4),INTENT(OUT)    :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzabs_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          REAL(KIND=8),INTENT(OUT)    :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzabsi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          REAL(KIND=8),INTENT(OUT)    :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Argument of complex value: r[i] = carg(a[i])

      INTERFACE
        SUBROUTINE vcarg_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          REAL(KIND=4),INTENT(OUT)    :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcargi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          REAL(KIND=4),INTENT(OUT)    :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzarg_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          REAL(KIND=8),INTENT(OUT)    :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzargi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          REAL(KIND=8),INTENT(OUT)    :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcarg_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          REAL(KIND=4),INTENT(OUT)    :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcargi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          REAL(KIND=4),INTENT(OUT)    :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzarg_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          REAL(KIND=8),INTENT(OUT)    :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzargi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          REAL(KIND=8),INTENT(OUT)    :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Addition: r[i] = a[i] + b[i]

      INTERFACE
        SUBROUTINE vsadd_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsaddi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdadd_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdaddi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsadd_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsaddi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdadd_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdaddi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex addition: r[i] = a[i] + b[i]

      INTERFACE
        SUBROUTINE vcadd_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcaddi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzadd_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzaddi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcadd_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcaddi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzadd_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzaddi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Subtraction: r[i] = a[i] - b[i]

      INTERFACE
        SUBROUTINE vssub_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vssubi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsub_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsubi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssub_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssubi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsub_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsubi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex subtraction: r[i] = a[i] - b[i]

      INTERFACE
        SUBROUTINE vcsub_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcsubi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzsub_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzsubi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcsub_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcsubi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzsub_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzsubi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Reciprocal: r[i] = 1.0 / a[i]

      INTERFACE
        SUBROUTINE vsinv_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsinvi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdinv_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdinvi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsinv_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsinvi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdinv_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdinvi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Square Root: r[i] = a[i]^0.5

      INTERFACE
        SUBROUTINE vssqrt_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vssqrti_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsqrt_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsqrti_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssqrt_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssqrti_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsqrt_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsqrti_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Square Root: r[i] = a[i]^0.5

      INTERFACE
        SUBROUTINE vcsqrt_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcsqrti_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzsqrt_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzsqrti_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcsqrt_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcsqrti_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzsqrt_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzsqrti_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Reciprocal Square Root: r[i] = 1/a[i]^0.5

      INTERFACE
        SUBROUTINE vsinvsqrt_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsinvsqrti_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdinvsqrt_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdinvsqrti_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsinvsqrt_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsinvsqrti_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdinvsqrt_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdinvsqrti_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Cube Root: r[i] = a[i]^(1/3)

      INTERFACE
        SUBROUTINE vscbrt_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vscbrti_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcbrt_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcbrti_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscbrt_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscbrti_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcbrt_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcbrti_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Reciprocal Cube Root: r[i] = 1/a[i]^(1/3)

      INTERFACE
        SUBROUTINE vsinvcbrt_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsinvcbrti_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdinvcbrt_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdinvcbrti_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsinvcbrt_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsinvcbrti_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdinvcbrt_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdinvcbrti_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Squaring: r[i] = a[i]^2

      INTERFACE
        SUBROUTINE vssqr_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vssqri_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsqr_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsqri_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssqr_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssqri_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsqr_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsqri_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Exponential Function: r[i] = e^a[i]

      INTERFACE
        SUBROUTINE vsexp_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsexpi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdexp_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdexpi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsexp_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsexpi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdexp_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdexpi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Exponential Function: r[i] = e^a[i]

      INTERFACE
        SUBROUTINE vcexp_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcexpi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzexp_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzexpi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcexp_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcexpi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzexp_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzexpi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Exponential of arguments decreased by 1: r[i] = e^(a[i]-1)

      INTERFACE
        SUBROUTINE vsexpm1_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsexpm1i_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdexpm1_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdexpm1i_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsexpm1_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsexpm1i_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdexpm1_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdexpm1i_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Logarithm (base e): r[i] = ln(a[i])

      INTERFACE
        SUBROUTINE vsln_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vslni_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdln_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlni_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsln_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslni_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdln_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlni_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Logarithm (base e): r[i] = ln(a[i])

      INTERFACE
        SUBROUTINE vcln_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vclni_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzln_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzlni_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcln_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmclni_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzln_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzlni_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Logarithm (base 10): r[i] = lg(a[i])

      INTERFACE
        SUBROUTINE vslog10_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vslog10i_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlog10_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlog10i_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslog10_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslog10i_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlog10_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlog10i_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Logarithm (base e) of arguments increased by 1: r[i] = log(1+a[i])

      INTERFACE
        SUBROUTINE vslog1p_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vslog1pi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlog1p_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlog1pi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslog1p_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslog1pi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlog1p_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlog1pi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Logarithm (base 10): r[i] = lg(a[i])

      INTERFACE
        SUBROUTINE vclog10_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vclog10i_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzlog10_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzlog10i_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmclog10_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmclog10i_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzlog10_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzlog10i_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Sine: r[i] = sin(a[i])

      INTERFACE
        SUBROUTINE vssin_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vssini_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsin_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsini_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssin_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssini_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsin_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsini_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Sine: r[i] = sin(a[i])

      INTERFACE
        SUBROUTINE vcsin_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcsini_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzsin_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzsini_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcsin_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcsini_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzsin_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzsini_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Cosine: r[i] = cos(a[i])

      INTERFACE
        SUBROUTINE vscos_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vscosi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcos_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcosi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscos_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscosi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcos_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcosi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Cosine: r[i] = cos(a[i])

      INTERFACE
        SUBROUTINE vccos_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vccosi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzcos_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzcosi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmccos_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmccosi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzcos_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzcosi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Tangent: r[i] = tan(a[i])

      INTERFACE
        SUBROUTINE vstan_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vstani_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtan_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtani_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstan_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstani_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtan_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtani_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Tangent: r[i] = tan(a[i])

      INTERFACE
        SUBROUTINE vctan_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vctani_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vztan_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vztani_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmctan_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmctani_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmztan_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmztani_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Hyperbolic Sine: r[i] = sh(a[i])

      INTERFACE
        SUBROUTINE vssinh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vssinhi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsinh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsinhi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssinh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssinhi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsinh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsinhi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Hyperbolic Sine: r[i] = sh(a[i])

      INTERFACE
        SUBROUTINE vcsinh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcsinhi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzsinh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzsinhi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcsinh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcsinhi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzsinh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzsinhi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Hyperbolic Cosine: r[i] = ch(a[i])

      INTERFACE
        SUBROUTINE vscosh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vscoshi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcosh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcoshi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscosh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscoshi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcosh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcoshi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Hyperbolic Cosine: r[i] = ch(a[i])

      INTERFACE
        SUBROUTINE vccosh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vccoshi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzcosh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzcoshi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmccosh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmccoshi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzcosh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzcoshi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Hyperbolic Tangent: r[i] = th(a[i])

      INTERFACE
        SUBROUTINE vstanh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vstanhi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtanh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtanhi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstanh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstanhi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtanh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtanhi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Hyperbolic Tangent: r[i] = th(a[i])

      INTERFACE
        SUBROUTINE vctanh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vctanhi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vztanh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vztanhi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmctanh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmctanhi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmztanh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmztanhi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Arc Cosine: r[i] = arccos(a[i])

      INTERFACE
        SUBROUTINE vsacos_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsacosi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdacos_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdacosi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsacos_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsacosi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdacos_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdacosi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Arc Cosine: r[i] = arccos(a[i])

      INTERFACE
        SUBROUTINE vcacos_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcacosi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzacos_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzacosi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcacos_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcacosi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzacos_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzacosi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Arc Sine: r[i] = arcsin(a[i])

      INTERFACE
        SUBROUTINE vsasin_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsasini_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdasin_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdasini_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsasin_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsasini_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdasin_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdasini_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Arc Sine: r[i] = arcsin(a[i])

      INTERFACE
        SUBROUTINE vcasin_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcasini_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzasin_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzasini_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcasin_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcasini_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzasin_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzasini_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Arc Tangent: r[i] = arctan(a[i])

      INTERFACE
        SUBROUTINE vsatan_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsatani_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdatan_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdatani_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsatan_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsatani_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdatan_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdatani_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Arc Tangent: r[i] = arctan(a[i])

      INTERFACE
        SUBROUTINE vcatan_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcatani_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzatan_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzatani_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcatan_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcatani_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzatan_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzatani_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Hyperbolic Arc Cosine: r[i] = arcch(a[i])

      INTERFACE
        SUBROUTINE vsacosh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsacoshi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdacosh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdacoshi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsacosh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsacoshi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdacosh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdacoshi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Hyperbolic Arc Cosine: r[i] = arcch(a[i])

      INTERFACE
        SUBROUTINE vcacosh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcacoshi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzacosh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzacoshi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcacosh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcacoshi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzacosh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzacoshi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Hyperbolic Arc Sine: r[i] = arcsh(a[i])

      INTERFACE
        SUBROUTINE vsasinh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsasinhi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdasinh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdasinhi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsasinh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsasinhi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdasinh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdasinhi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Hyperbolic Arc Sine: r[i] = arcsh(a[i])

      INTERFACE
        SUBROUTINE vcasinh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcasinhi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzasinh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzasinhi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcasinh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcasinhi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzasinh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzasinhi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Hyperbolic Arc Tangent: r[i] = arcth(a[i])

      INTERFACE
        SUBROUTINE vsatanh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsatanhi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdatanh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdatanhi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsatanh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsatanhi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdatanh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdatanhi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Hyperbolic Arc Tangent: r[i] = arcth(a[i])

      INTERFACE
        SUBROUTINE vcatanh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcatanhi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzatanh_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzatanhi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcatanh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcatanhi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzatanh_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzatanhi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Error Function: r[i] = erf(a[i])

      INTERFACE
        SUBROUTINE vserf_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vserfi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vderf_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vderfi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmserf_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmserfi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmderf_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmderfi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Inverse error function: r[i] = erfinv(a[i])

      INTERFACE
        SUBROUTINE vserfinv_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vserfinvi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vderfinv_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vderfinvi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmserfinv_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmserfinvi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmderfinv_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmderfinvi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Square root of the sum of the squares: r[i] = hypot(a[i],b[i])

      INTERFACE
        SUBROUTINE vshypot_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(IN)    :: b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vshypoti_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(IN)    :: b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdhypot_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(IN)    :: b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdhypoti_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(IN)    :: b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmshypot_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(IN)    :: b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmshypoti_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(IN)    :: b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdhypot_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(IN)    :: b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdhypoti_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(IN)    :: b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complementary Error Function: r[i] = 1 - erf(a[i])

      INTERFACE
        SUBROUTINE vserfc_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vserfci_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vderfc_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vderfci_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmserfc_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmserfci_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmderfc_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmderfci_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Inverse complementary error function: r[i] = erfcinv(a[i])

      INTERFACE
        SUBROUTINE vserfcinv_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vserfcinvi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vderfcinv_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vderfcinvi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmserfcinv_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmserfcinvi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmderfcinv_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmderfcinvi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Cumulative normal distribution function: r[i] = cdfnorm(a[i])

      INTERFACE
        SUBROUTINE vscdfnorm_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vscdfnormi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcdfnorm_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcdfnormi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscdfnorm_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscdfnormi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcdfnorm_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcdfnormi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Inverse cumulative normal distribution function:
!  r[i] = cdfnorminv(a[i])

      INTERFACE
        SUBROUTINE vscdfnorminv_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vscdfnorminvi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcdfnorminv_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcdfnorminvi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscdfnorminv_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscdfnorminvi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcdfnorminv_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcdfnorminvi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Logarithm (base e) of the absolute value of gamma function:
!  r[i] = lgamma(a[i])

      INTERFACE
        SUBROUTINE vslgamma_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vslgammai_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlgamma_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlgammai_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslgamma_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslgammai_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlgamma_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlgammai_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Gamma function: r[i] = tgamma(a[i])

      INTERFACE
        SUBROUTINE vstgamma_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vstgammai_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtgamma_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtgammai_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstgamma_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstgammai_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtgamma_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtgammai_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Arc Tangent of a/b: r[i] = arctan(a[i]/b[i])

      INTERFACE
        SUBROUTINE vsatan2_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsatan2i_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdatan2_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdatan2i_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsatan2_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsatan2i_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdatan2_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdatan2i_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Multiplicaton: r[i] = a[i] * b[i]

      INTERFACE
        SUBROUTINE vsmul_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsmuli_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdmul_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdmuli_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsmul_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsmuli_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdmul_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdmuli_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex multiplicaton: r[i] = a[i] * b[i]

      INTERFACE
        SUBROUTINE vcmul_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          COMPLEX(KIND=4),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcmuli_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          COMPLEX(KIND=4),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzmul_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          COMPLEX(KIND=8),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzmuli_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          COMPLEX(KIND=8),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcmul_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          COMPLEX(KIND=4),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN)    :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcmuli_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          COMPLEX(KIND=4),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN)    :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzmul_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          COMPLEX(KIND=8),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN)    :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzmuli_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          COMPLEX(KIND=8),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN)    :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Division: r[i] = a[i] / b[i]

      INTERFACE
        SUBROUTINE vsdiv_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsdivi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vddiv_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vddivi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsdiv_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsdivi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmddiv_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmddivi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex division: r[i] = a[i] / b[i]

      INTERFACE
        SUBROUTINE vcdiv_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          COMPLEX(KIND=4),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcdivi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          COMPLEX(KIND=4),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzdiv_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          COMPLEX(KIND=8),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzdivi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          COMPLEX(KIND=8),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcdiv_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          COMPLEX(KIND=4),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN)    :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcdivi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          COMPLEX(KIND=4),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN)    :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzdiv_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          COMPLEX(KIND=8),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN)    :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzdivi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          COMPLEX(KIND=8),INTENT(IN)    :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN)    :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Power Function: r[i] = a[i]^b[i]

      INTERFACE
        SUBROUTINE vspow_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vspowi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpow_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpowi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmspow_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmspowi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdpow_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdpowi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Power Function: r[i] = a[i]^b[i]

      INTERFACE
        SUBROUTINE vcpow_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcpowi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzpow_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzpowi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcpow_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcpowi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzpow_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzpowi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Power Function: r[i] = a[i]^(3/2)

      INTERFACE
        SUBROUTINE vspow3o2_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vspow3o2i_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpow3o2_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpow3o2i_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmspow3o2_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmspow3o2i_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdpow3o2_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdpow3o2i_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Power Function: r[i] = a[i]^(2/3)

      INTERFACE
        SUBROUTINE vspow2o3_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vspow2o3i_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpow2o3_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpow2o3i_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmspow2o3_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmspow2o3i_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdpow2o3_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdpow2o3i_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Power Function with Fixed Degree: r[i] = a[i]^b

      INTERFACE
        SUBROUTINE vspowx_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: b
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vspowxi_64(n,a,inca,b,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: b
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpowx_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: b
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpowxi_64(n,a,inca,b,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: b
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmspowx_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: b
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmspowxi_64(n,a,inca,b,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: b
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdpowx_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: b
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdpowxi_64(n,a,inca,b,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: b
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex Power Function with Fixed Degree: r[i] = a[i]^b

      INTERFACE
        SUBROUTINE vcpowx_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: b
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcpowxi_64(n,a,inca,b,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: b
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzpowx_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: b
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzpowxi_64(n,a,inca,b,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: b
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcpowx_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: b
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcpowxi_64(n,a,inca,b,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: b
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzpowx_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: b
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzpowxi_64(n,a,inca,b,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: b
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Sine & Cosine: r1[i] = sin(a[i]), r2[i]=cos(a[i])

      INTERFACE
        SUBROUTINE vssincos_64(n,a,r1,r2)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r1(n),r2(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vssincosi_64(n,a,inca,r1,incr1,r2,incr2)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr1
          INTEGER(KIND=8),INTENT(IN) :: incr2
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsincos_64(n,a,r1,r2)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r1(n),r2(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsincosi_64(n,a,inca,r1,incr1,r2,incr2)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr1
          INTEGER(KIND=8),INTENT(IN) :: incr2
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssincos_64(n,a,r1,r2,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssincosi_64(n,a,inca,r1,incr1,r2,incr2,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr1
          INTEGER(KIND=8),INTENT(IN) :: incr2
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsincos_64(n,a,r1,r2,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsincosi_64(n,a,inca,r1,incr1,r2,incr2,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr1
          INTEGER(KIND=8),INTENT(IN) :: incr2
        END SUBROUTINE
      END INTERFACE

!  Linear fraction: r[i] = (a[i]*scalea + shifta)/(b[i]*scaleb + shiftb)

      INTERFACE
        SUBROUTINE vslinearfrac_64(n,a,b,scalea,shifta,scaleb,shiftb,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(IN)    :: scalea,shifta,scaleb,shiftb
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vslinearfraci_64(n,a,inca,b,incb,scalea,shifta,      &
     &      scaleb,shiftb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(IN)    :: scalea,shifta,scaleb,shiftb
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlinearfrac_64(n,a,b,scalea,shifta,scaleb,shiftb,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(IN)    :: scalea,shifta,scaleb,shiftb
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlinearfraci_64(n,a,inca,b,incb,scalea,shifta,      &
     &      scaleb,shiftb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(IN)    :: scalea,shifta,scaleb,shiftb
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslinearfrac_64(n,a,b,scalea,shifta,scaleb,shiftb,r,&
     &                           mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(IN)    :: scalea,shifta,scaleb,shiftb
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslinearfraci_64(n,a,inca,b,incb,scalea,shifta,     &
     &      scaleb,shiftb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(IN)    :: scalea,shifta,scaleb,shiftb
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlinearfrac_64(n,a,b,scalea,shifta,scaleb,shiftb,r,&
     &                           mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(IN)    :: scalea,shifta,scaleb,shiftb
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlinearfraci_64(n,a,inca,b,incb,scalea,shifta,     &
     &      scaleb,shiftb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(IN)    :: scalea,shifta,scaleb,shiftb
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Integer value rounded towards plus infinity: r[i] = ceil(a[i])

      INTERFACE
        SUBROUTINE vsceil_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsceili_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdceil_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdceili_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsceil_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsceili_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdceil_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdceili_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Integer value rounded towards minus infinity: r[i] = floor(a[i])

      INTERFACE
        SUBROUTINE vsfloor_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsfloori_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfloor_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfloori_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfloor_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfloori_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfloor_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfloori_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Signed fraction part

      INTERFACE
        SUBROUTINE vsfrac_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsfraci_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfrac_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfraci_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfrac_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfraci_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfrac_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfraci_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE


!  Truncated integer value and the remaining fraction part

      INTERFACE
        SUBROUTINE vsmodf_64(n,a,r1,r2)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r1(n),r2(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsmodfi_64(n,a,inca,r1,incr1,r2,incr2)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr1
          INTEGER(KIND=8),INTENT(IN) :: incr2
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdmodf_64(n,a,r1,r2)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r1(n),r2(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdmodfi_64(n,a,inca,r1,incr1,r2,incr2)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr1
          INTEGER(KIND=8),INTENT(IN) :: incr2
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsmodf_64(n,a,r1,r2,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsmodfi_64(n,a,inca,r1,incr1,r2,incr2,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr1
          INTEGER(KIND=8),INTENT(IN) :: incr2
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdmodf_64(n,a,r1,r2,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdmodfi_64(n,a,inca,r1,incr1,r2,incr2,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r1(n),r2(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr1
          INTEGER(KIND=8),INTENT(IN) :: incr2
        END SUBROUTINE
      END INTERFACE

!  Rounded integer value in the current rounding mode:
!  r[i] = nearbyint(a[i])

      INTERFACE
        SUBROUTINE vsnearbyint_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsnearbyinti_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdnearbyint_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdnearbyinti_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsnearbyint_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsnearbyinti_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdnearbyint_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdnearbyinti_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Rounded integer value in the current rounding mode with inexact
!  result exception raised for rach changed value: r[i] = rint(a[i])

      INTERFACE
        SUBROUTINE vsrint_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsrinti_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdrint_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdrinti_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsrint_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsrinti_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdrint_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdrinti_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Value rounded to the nearest integer: r[i] = round(a[i])

      INTERFACE
        SUBROUTINE vsround_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsroundi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdround_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdroundi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsround_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsroundi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdround_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdroundi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Truncated integer value and the temaining fraction part:
!  r[i] = trunc(a[i])

      INTERFACE
        SUBROUTINE vstrunc_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vstrunci_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtrunc_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtrunci_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstrunc_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstrunci_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtrunc_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtrunci_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Element by element conjugation: r[i] = conj(a[i])

      INTERFACE
        SUBROUTINE vcconj_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcconji_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzconj_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzconji_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcconj_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcconji_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzconj_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzconji_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Element by element multiplication of vector A element and
!  conjugated vector B element: r[i] = mulbyconj(a[i],b[i])

      INTERFACE
        SUBROUTINE vcmulbyconj_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcmulbyconji_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzmulbyconj_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzmulbyconji_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcmulbyconj_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmcmulbyconji_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=4),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzmulbyconj_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzmulbyconji_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          COMPLEX(KIND=8),INTENT(IN)  :: a(n),b(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Complex exponent of real vector elements: r[i] = CIS(a[i])

      INTERFACE
        SUBROUTINE vccis_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          REAL(KIND=4),INTENT(IN)     :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vccisi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          REAL(KIND=4),INTENT(IN)     :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzcis_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN)  :: n
          REAL(KIND=8),INTENT(IN)     :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzcisi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN)  :: n
          REAL(KIND=8),INTENT(IN)     :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmccis_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          REAL(KIND=4),INTENT(IN)     :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmccisi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          REAL(KIND=4),INTENT(IN)     :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzcis_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          REAL(KIND=8),INTENT(IN)     :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmzcisi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN)  :: n
          REAL(KIND=8),INTENT(IN)     :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: r(n)
          INTEGER(KIND=8),INTENT(IN)  :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Exponential integral: r[i] = e1(a[i])

      INTERFACE
        SUBROUTINE vsexpint1_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsexpint1i_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdexpint1_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdexpint1i_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsexpint1_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsexpint1i_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdexpint1_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdexpint1i_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Cosine: r[i] = cos(a[i]*PI)

      INTERFACE
        SUBROUTINE vscospi_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vscospii_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcospi_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcospii_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscospi_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscospii_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcospi_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcospii_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Sine: r[i] = sin(a[i]*PI)

      INTERFACE
        SUBROUTINE vssinpi_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vssinpii_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsinpi_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsinpii_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssinpi_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssinpii_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsinpi_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsinpii_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Tangent: r[i] = tan(a[i]*PI)

      INTERFACE
        SUBROUTINE vstanpi_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vstanpii_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtanpi_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtanpii_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstanpi_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstanpii_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtanpi_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtanpii_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Arc cosine: r[i] = acos(a[i])/PI

      INTERFACE
        SUBROUTINE vsacospi_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsacospii_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdacospi_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdacospii_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsacospi_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsacospii_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdacospi_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdacospii_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Arc sine: r[i] = asin(a[i])/PI

      INTERFACE
        SUBROUTINE vsasinpi_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsasinpii_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdasinpi_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdasinpii_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsasinpi_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsasinpii_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdasinpi_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdasinpii_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Arc tangent: r[i] = atan(a[i])/PI

      INTERFACE
        SUBROUTINE vsatanpi_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsatanpii_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdatanpi_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdatanpii_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsatanpi_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsatanpii_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdatanpi_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdatanpii_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Cosine: r[i] = cos(a[i]*PI/180)

      INTERFACE
        SUBROUTINE vscosd_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vscosdi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcosd_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcosdi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscosd_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscosdi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcosd_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcosdi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Sine: r[i] = sin(a[i]*PI/180)

      INTERFACE
        SUBROUTINE vssind_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vssindi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsind_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdsindi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssind_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmssindi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsind_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdsindi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Tangent: r[i] = tan(a[i]*PI/180)

      INTERFACE
        SUBROUTINE vstand_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vstandi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtand_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdtandi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstand_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmstandi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtand_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdtandi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Exponential function (base 2): r[i] = 2^a[i]

      INTERFACE
        SUBROUTINE vsexp2_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsexp2i_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdexp2_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdexp2i_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsexp2_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsexp2i_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdexp2_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdexp2i_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Exponential function (base 10): r[i] = 10^a[i]

      INTERFACE
        SUBROUTINE vsexp10_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsexp10i_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdexp10_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdexp10i_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsexp10_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsexp10i_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdexp10_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdexp10i_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Logarithm (base 2): r[i] = lb(a[i])

      INTERFACE
        SUBROUTINE vslog2_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vslog2i_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlog2_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlog2i_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslog2_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslog2i_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlog2_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlog2i_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Computes the exponent: r[i] = logb(a[i])

      INTERFACE
        SUBROUTINE vslogb_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vslogbi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlogb_64(n,a,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdlogbi_64(n,a,inca,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslogb_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmslogbi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlogb_64(n,a,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdlogbi_64(n,a,inca,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

! Arc Tangent of a/b Divided by PI: r[i] = arctan(a[i]/b[i])/PI

      INTERFACE
        SUBROUTINE vsatan2pi_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsatan2pii_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdatan2pi_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdatan2pii_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsatan2pi_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsatan2pii_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdatan2pi_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdatan2pii_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Power Function with a[i]>=0: r[i] = a[i]^b[i]

      INTERFACE
        SUBROUTINE vspowr_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vspowri_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpowr_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpowri_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmspowr_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmspowri_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdpowr_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdpowri_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Remainder Function: r[i] = remainder(a[i], b[i])

      INTERFACE
        SUBROUTINE vsremainder_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsremainderi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdremainder_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdremainderi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsremainder_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsremainderi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdremainder_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdremainderi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Modulus Function: r[i] = fmod(a[i], b[i])

      INTERFACE
        SUBROUTINE vsfmod_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsfmodi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfmod_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfmodi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfmod_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfmodi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfmod_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfmodi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Copy Sign Function: r[i] = copysign(a[i], b[i])

      INTERFACE
        SUBROUTINE vscopysign_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vscopysigni_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcopysign_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdcopysigni_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscopysign_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmscopysigni_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcopysign_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdcopysigni_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Next After Function: r[i] = nextafter(a[i], b[i])

      INTERFACE
        SUBROUTINE vsnextafter_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsnextafteri_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdnextafter_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdnextafteri_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsnextafter_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsnextafteri_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdnextafter_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdnextafteri_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Positive Difference Function: r[i] = fdim(a[i], b[i])

      INTERFACE
        SUBROUTINE vsfdim_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsfdimi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfdim_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfdimi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfdim_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfdimi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfdim_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfdimi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Maximum Function: r[i] = fmax(a[i], b[i])

      INTERFACE
        SUBROUTINE vsfmax_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsfmaxi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfmax_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfmaxi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfmax_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfmaxi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfmax_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfmaxi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Minimum Function: r[i] = fmin(a[i], b[i])

      INTERFACE
        SUBROUTINE vsfmin_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsfmini_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfmin_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdfmini_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfmin_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsfmini_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfmin_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdfmini_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Maximum Magnitude Function: r[i] = maxmag(a[i], b[i])

      INTERFACE
        SUBROUTINE vsmaxmag_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsmaxmagi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdmaxmag_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdmaxmagi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsmaxmag_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsmaxmagi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdmaxmag_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdmaxmagi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

!  Minimum magnitude function: r[i] = minmag(a[i], b[i])

      INTERFACE
        SUBROUTINE vsminmag_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vsminmagi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdminmag_64(n,a,b,r)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdminmagi_64(n,a,inca,b,incb,r,incr)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsminmag_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmsminmagi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=4),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=4),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdminmag_64(n,a,b,r,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vmdminmagi_64(n,a,inca,b,incb,r,incr,mode)
          INTEGER(KIND=8),INTENT(IN) :: n
          REAL(KIND=8),INTENT(IN)    :: a(n),b(n)
          REAL(KIND=8),INTENT(OUT)   :: r(n)
          INTEGER(KIND=8),INTENT(IN) :: mode
          INTEGER(KIND=8),INTENT(IN) :: inca
          INTEGER(KIND=8),INTENT(IN) :: incb
          INTEGER(KIND=8),INTENT(IN) :: incr
        END SUBROUTINE
      END INTERFACE


!++
!  VML PACK FUNCTION INTERFACES.
!--

!  Positive Increment Indexing
      INTERFACE
        SUBROUTINE vspacki(n,a,incra,y)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: incra
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpacki(n,a,incra,y)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: incra
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcpacki(n,a,incra,y)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: incra
          COMPLEX(KIND=4),INTENT(IN)    :: a(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzpacki(n,a,incra,y)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: incra
          COMPLEX(KIND=8),INTENT(IN)    :: a(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

!  Index Vector Indexing
      INTERFACE
        SUBROUTINE vspackv(n,a,ia,y)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: ia(n)
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpackv(n,a,ia,y)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: ia(n)
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcpackv(n,a,ia,y)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: ia(n)
          COMPLEX(KIND=4),INTENT(IN)    :: a(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzpackv(n,a,ia,y)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: ia(n)
          COMPLEX(KIND=8),INTENT(IN)    :: a(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

!  Mask Vector Indexing
      INTERFACE
        SUBROUTINE vspackm(n,a,ma,y)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: ma(n)
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpackm(n,a,ma,y)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: ma(n)
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcpackm(n,a,ma,y)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: ma(n)
          COMPLEX(KIND=4),INTENT(IN)    :: a(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzpackm(n,a,ma,y)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: ma(n)
          COMPLEX(KIND=8),INTENT(IN)    :: a(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

!++
!  VML UNPACK FUNCTION DECLARATIONS.
!--

!  Positive Increment Indexing
      INTERFACE
        SUBROUTINE vsunpacki(n,a,y,incry)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: incry
          REAL(KIND=4),INTENT(IN)  :: a(n)
          REAL(KIND=4),INTENT(OUT) :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdunpacki(n,a,y,incry)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: incry
          REAL(KIND=8),INTENT(IN)  :: a(n)
          REAL(KIND=8),INTENT(OUT) :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcunpacki(n,a,y,incry)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: incry
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzunpacki(n,a,y,incry)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: incry
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: y(n)
        END SUBROUTINE
      END INTERFACE

!  Index Vector Indexing
      INTERFACE
        SUBROUTINE vsunpackv(n,a,y,iy)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: iy(n)
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdunpackv(n,a,y,iy)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: iy(n)
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcunpackv(n,a,y,iy)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: iy(n)
          COMPLEX(KIND=4),INTENT(IN)    :: a(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzunpackv(n,a,y,iy)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: iy(n)
          COMPLEX(KIND=8),INTENT(IN)    :: a(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

!  Mask Vector Indexing
      INTERFACE
        SUBROUTINE vsunpackm(n,a,y,my)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: my(n)
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdunpackm(n,a,y,my)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: my(n)
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcunpackm(n,a,y,my)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: my(n)
          COMPLEX(KIND=4),INTENT(IN)    :: a(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzunpackm(n,a,y,my)
          INTEGER,INTENT(IN) :: n
          INTEGER,INTENT(IN) :: my(n)
          COMPLEX(KIND=8),INTENT(IN)    :: a(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

!  Positive Increment Indexing
      INTERFACE
        SUBROUTINE vspacki_64(n,a,incra,y)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: incra
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpacki_64(n,a,incra,y)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: incra
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcpacki_64(n,a,incra,y)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: incra
          COMPLEX(KIND=4),INTENT(IN)    :: a(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzpacki_64(n,a,incra,y)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: incra
          COMPLEX(KIND=8),INTENT(IN)    :: a(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

!  Index Vector Indexing
      INTERFACE
        SUBROUTINE vspackv_64(n,a,ia,y)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: ia(n)
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpackv_64(n,a,ia,y)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: ia(n)
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcpackv_64(n,a,ia,y)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: ia(n)
          COMPLEX(KIND=4),INTENT(IN)    :: a(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzpackv_64(n,a,ia,y)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: ia(n)
          COMPLEX(KIND=8),INTENT(IN)    :: a(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

!  Mask Vector Indexing
      INTERFACE
        SUBROUTINE vspackm_64(n,a,ma,y)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: ma(n)
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdpackm_64(n,a,ma,y)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: ma(n)
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcpackm_64(n,a,ma,y)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: ma(n)
          COMPLEX(KIND=4),INTENT(IN)    :: a(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzpackm_64(n,a,ma,y)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: ma(n)
          COMPLEX(KIND=8),INTENT(IN)    :: a(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

!++
!  VML UNPACK FUNCTION DECLARATIONS.
!--

!  Positive Increment Indexing
      INTERFACE
        SUBROUTINE vsunpacki_64(n,a,y,incry)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: incry
          REAL(KIND=4),INTENT(IN)  :: a(n)
          REAL(KIND=4),INTENT(OUT) :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdunpacki_64(n,a,y,incry)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: incry
          REAL(KIND=8),INTENT(IN)  :: a(n)
          REAL(KIND=8),INTENT(OUT) :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcunpacki_64(n,a,y,incry)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: incry
          COMPLEX(KIND=4),INTENT(IN)  :: a(n)
          COMPLEX(KIND=4),INTENT(OUT) :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzunpacki_64(n,a,y,incry)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: incry
          COMPLEX(KIND=8),INTENT(IN)  :: a(n)
          COMPLEX(KIND=8),INTENT(OUT) :: y(n)
        END SUBROUTINE
      END INTERFACE

!  Index Vector Indexing
      INTERFACE
        SUBROUTINE vsunpackv_64(n,a,y,iy)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: iy(n)
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdunpackv_64(n,a,y,iy)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: iy(n)
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcunpackv_64(n,a,y,iy)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: iy(n)
          COMPLEX(KIND=4),INTENT(IN)    :: a(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzunpackv_64(n,a,y,iy)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: iy(n)
          COMPLEX(KIND=8),INTENT(IN)    :: a(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

!  Mask Vector Indexing
      INTERFACE
        SUBROUTINE vsunpackm_64(n,a,y,my)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: my(n)
          REAL(KIND=4),INTENT(IN)    :: a(n)
          REAL(KIND=4),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vdunpackm_64(n,a,y,my)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: my(n)
          REAL(KIND=8),INTENT(IN)    :: a(n)
          REAL(KIND=8),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vcunpackm_64(n,a,y,my)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: my(n)
          COMPLEX(KIND=4),INTENT(IN)    :: a(n)
          COMPLEX(KIND=4),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

      INTERFACE
        SUBROUTINE vzunpackm_64(n,a,y,my)
          INTEGER(KIND=8),INTENT(IN) :: n
          INTEGER(KIND=8),INTENT(IN) :: my(n)
          COMPLEX(KIND=8),INTENT(IN)    :: a(n)
          COMPLEX(KIND=8),INTENT(OUT)   :: y(n)
        END SUBROUTINE
      END INTERFACE

!++
!  VML ERROR HANDLING FUNCTION DECLARATIONS.
!--

!  Set VML Error Status
      INTERFACE
        INTEGER(KIND=4) FUNCTION vmlseterrstatus(err)
          INTEGER,INTENT(IN) :: err
        END FUNCTION
      END INTERFACE

!  Get VML Error Status
      INTERFACE
        INTEGER(KIND=4) FUNCTION vmlgeterrstatus()
        END FUNCTION
      END INTERFACE

!  Clear VML Error Status
      INTERFACE
        INTEGER(KIND=4) FUNCTION vmlclearerrstatus()
        END FUNCTION
      END INTERFACE

!  Set VML Error Callback Function
      INTERFACE
        INTEGER(KIND=4) FUNCTION vmlseterrorcallback(cb)
          INTEGER,EXTERNAL :: cb
        END FUNCTION vmlseterrorcallback
      END INTERFACE

!  Get VML Error Callback Function
      INTERFACE
        INTEGER(KIND=4) FUNCTION vmlgeterrorcallback()
        END FUNCTION vmlgeterrorcallback
      END INTERFACE

!  Reset VML Error Callback Function
      INTERFACE
        INTEGER(KIND=4) FUNCTION vmlclearerrorcallback()
        END FUNCTION vmlclearerrorcallback
      END INTERFACE

!  Set VML Error Status
      INTERFACE
        INTEGER(KIND=8) FUNCTION vmlseterrstatus_64(err)
          INTEGER(KIND=8),INTENT(IN) :: err
        END FUNCTION
      END INTERFACE

!  Get VML Error Status
      INTERFACE
        INTEGER(KIND=8) FUNCTION vmlgeterrstatus_64()
        END FUNCTION
      END INTERFACE

!  Clear VML Error Status
      INTERFACE
        INTEGER(KIND=8) FUNCTION vmlclearerrstatus_64()
        END FUNCTION
      END INTERFACE

!  Set VML Error Callback Function
      INTERFACE
        INTEGER(KIND=8) FUNCTION vmlseterrorcallback_64(cb)
          INTEGER(KIND=8),EXTERNAL :: cb
        END FUNCTION vmlseterrorcallback_64
      END INTERFACE

!  Get VML Error Callback Function
      INTERFACE
        INTEGER(KIND=8) FUNCTION vmlgeterrorcallback_64()
        END FUNCTION vmlgeterrorcallback_64
      END INTERFACE

!  Reset VML Error Callback Function
      INTERFACE
        INTEGER(KIND=8) FUNCTION vmlclearerrorcallback_64()
        END FUNCTION vmlclearerrorcallback_64
      END INTERFACE

!++
!  VML MODE FUNCTION DECLARATIONS.
!--

!  Set VML Mode
      INTERFACE
        INTEGER(KIND=4) FUNCTION vmlsetmode(n)
          INTEGER,INTENT(IN) :: n
        END FUNCTION
      END INTERFACE

!  Get VML Mode
      INTERFACE
        INTEGER(KIND=4) FUNCTION vmlgetmode()
        END FUNCTION
      END INTERFACE

!  Set VML Mode
      INTERFACE
        INTEGER(KIND=8) FUNCTION vmlsetmode_64(n)
          INTEGER(KIND=8),INTENT(IN) :: n
        END FUNCTION
      END INTERFACE

!  Get VML Mode
      INTERFACE
        INTEGER(KIND=8) FUNCTION vmlgetmode_64()
        END FUNCTION
      END INTERFACE
