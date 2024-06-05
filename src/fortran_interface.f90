module idea

   use, intrinsic :: iso_c_binding, only : &
      c_ptr, c_char, c_null_char, c_size_t, c_int, c_double, c_f_pointer

   implicit none

   interface

      integer(c_size_t) function c_strlen(str_ptr) bind(C, name="strlen")
         import c_size_t, c_ptr
         type(c_ptr), value, intent(in) :: str_ptr
      end function

      type(c_ptr) function IDEA_Init_ptr(modeldir, errlev) bind(C, name="IDEA_Init")
         import c_ptr, c_char
         character(c_char), intent(in) :: modeldir(*)
         character(c_char), intent(in) :: errlev(*)
      end function

      type(c_ptr) function IDEA_Finalize_ptr() bind(C, name='IDEA_Finalize')
         import c_ptr
      end function

      type(c_ptr) function IDEA_Units_ptr() bind(C, name='IDEA_Units')
         import c_ptr
      end function

   end interface

   interface

      real(c_double) function IDEA_DEP(D, E) bind(C, name='IDEA_DEP')
         import c_double
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DET(D, E) bind(C, name='IDEA_DET')
         import c_double
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DEH(D, E) bind(C, name='IDEA_DEH')
         import c_double
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DES(D, E) bind(C, name='IDEA_DES')
         import c_double
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DEA(D, E) bind(C, name='IDEA_DEA')
         import c_double
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DEC(D, E) bind(C, name='IDEA_DEC')
         import c_double
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DEG(D, E) bind(C, name='IDEA_DEG')
         import c_double
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DEV(D, E) bind(C, name='IDEA_DEV')
         import c_double
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DEK(D, E) bind(C, name='IDEA_DEK')
         import c_double
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function


      real(c_double) function IDEA_PTD(P, T) bind(C, name='IDEA_PTD')
         import c_double
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTE(P, T) bind(C, name='IDEA_PTE')
         import c_double
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTH(P, T) bind(C, name='IDEA_PTH')
         import c_double
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTS(P, T) bind(C, name='IDEA_PTS')
         import c_double
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTA(P, T) bind(C, name='IDEA_PTA')
         import c_double
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTC(P, T) bind(C, name='IDEA_PTC')
         import c_double
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTG(P, T) bind(C, name='IDEA_PTG')
         import c_double
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTV(P, T) bind(C, name='IDEA_PTV')
         import c_double
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTK(P, T) bind(C, name='IDEA_PTK')
         import c_double
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function


      real(c_double) function IDEA_DPT(D, P) bind(C, name='IDEA_DPT')
         import c_double
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: P
      end function

      real(c_double) function IDEA_DPE(D, P) bind(C, name='IDEA_DPE')
         import c_double
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: P
      end function

   end interface

   interface

      real(c_double) function IDEA_DEP_Grad(grad, D, E) bind(C, name='IDEA_DEP_Grad')
         import c_double
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DET_Grad(grad, D, E) bind(C, name='IDEA_DET_Grad')
         import c_double
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DEH_Grad(grad, D, E) bind(C, name='IDEA_DEH_Grad')
         import c_double
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DES_Grad(grad, D, E) bind(C, name='IDEA_DES_Grad')
         import c_double
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DEA_Grad(grad, D, E) bind(C, name='IDEA_DEA_Grad')
         import c_double
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DEC_Grad(grad, D, E) bind(C, name='IDEA_DEC_Grad')
         import c_double
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DEG_Grad(grad, D, E) bind(C, name='IDEA_DEG_Grad')
         import c_double
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DEV_Grad(grad, D, E) bind(C, name='IDEA_DEV_Grad')
         import c_double
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DEK_Grad(grad, D, E) bind(C, name='IDEA_DEK_Grad')
         import c_double
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function


      real(c_double) function IDEA_PTD_Grad(grad, P, T) bind(C, name='IDEA_PTD_Grad')
         import c_double
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTE_Grad(grad, P, T) bind(C, name='IDEA_PTE_Grad')
         import c_double
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTH_Grad(grad, P, T) bind(C, name='IDEA_PTH_Grad')
         import c_double
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTS_Grad(grad, P, T) bind(C, name='IDEA_PTS_Grad')
         import c_double
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTA_Grad(grad, P, T) bind(C, name='IDEA_PTA_Grad')
         import c_double
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTC_Grad(grad, P, T) bind(C, name='IDEA_PTC_Grad')
         import c_double
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTG_Grad(grad, P, T) bind(C, name='IDEA_PTG_Grad')
         import c_double
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTV_Grad(grad, P, T) bind(C, name='IDEA_PTV_Grad')
         import c_double
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTK_Grad(grad, P, T) bind(C, name='IDEA_PTK_Grad')
         import c_double
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function


      real(c_double) function IDEA_DPT_Grad(grad, D, P) bind(C, name='IDEA_DPT_Grad')
         import c_double
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: P
      end function

      real(c_double) function IDEA_DPE_Grad(grad, D, P) bind(C, name='IDEA_DPE_Grad')
         import c_double
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: P
      end function

   end interface

   interface

      real(c_double) function IDEA_DEP_Hess(hess, grad, D, E) bind(C, name='IDEA_DEP_Hess')
         import c_double
         real(c_double), intent(out) :: hess(3)
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DET_Hess(hess, grad, D, E) bind(C, name='IDEA_DET_Hess')
         import c_double
         real(c_double), intent(out) :: hess(3)
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DEH_Hess(hess, grad, D, E) bind(C, name='IDEA_DEH_Hess')
         import c_double
         real(c_double), intent(out) :: hess(3)
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DES_Hess(hess, grad, D, E) bind(C, name='IDEA_DES_Hess')
         import c_double
         real(c_double), intent(out) :: hess(3)
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DEA_Hess(hess, grad, D, E) bind(C, name='IDEA_DEA_Hess')
         import c_double
         real(c_double), intent(out) :: hess(3)
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DEC_Hess(hess, grad, D, E) bind(C, name='IDEA_DEC_Hess')
         import c_double
         real(c_double), intent(out) :: hess(3)
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DEG_Hess(hess, grad, D, E) bind(C, name='IDEA_DEG_Hess')
         import c_double
         real(c_double), intent(out) :: hess(3)
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DEV_Hess(hess, grad, D, E) bind(C, name='IDEA_DEV_Hess')
         import c_double
         real(c_double), intent(out) :: hess(3)
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function

      real(c_double) function IDEA_DEK_Hess(hess, grad, D, E) bind(C, name='IDEA_DEK_Hess')
         import c_double
         real(c_double), intent(out) :: hess(3)
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: E
      end function


      real(c_double) function IDEA_PTD_Hess(hess, grad, P, T) bind(C, name='IDEA_PTD_Hess')
         import c_double
         real(c_double), intent(out) :: hess(3)
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTE_Hess(hess, grad, P, T) bind(C, name='IDEA_PTE_Hess')
         import c_double
         real(c_double), intent(out) :: hess(3)
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTH_Hess(hess, grad, P, T) bind(C, name='IDEA_PTH_Hess')
         import c_double
         real(c_double), intent(out) :: hess(3)
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTS_Hess(hess, grad, P, T) bind(C, name='IDEA_PTS_Hess')
         import c_double
         real(c_double), intent(out) :: hess(3)
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTA_Hess(hess, grad, P, T) bind(C, name='IDEA_PTA_Hess')
         import c_double
         real(c_double), intent(out) :: hess(3)
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTC_Hess(hess, grad, P, T) bind(C, name='IDEA_PTC_Hess')
         import c_double
         real(c_double), intent(out) :: hess(3)
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTG_Hess(hess, grad, P, T) bind(C, name='IDEA_PTG_Hess')
         import c_double
         real(c_double), intent(out) :: hess(3)
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTV_Hess(hess, grad, P, T) bind(C, name='IDEA_PTV_Hess')
         import c_double
         real(c_double), intent(out) :: hess(3)
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function

      real(c_double) function IDEA_PTK_Hess(hess, grad, P, T) bind(C, name='IDEA_PTK_Hess')
         import c_double
         real(c_double), intent(out) :: hess(3)
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: P
         real(c_double), value, intent(in) :: T
      end function


      real(c_double) function IDEA_DPT_Hess(hess, grad, D, P) bind(C, name='IDEA_DPT_Hess')
         import c_double
         real(c_double), intent(out) :: hess(3)
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: P
      end function

      real(c_double) function IDEA_DPE_Hess(hess, grad, D, P) bind(C, name='IDEA_DPE_Hess')
         import c_double
         real(c_double), intent(out) :: hess(3)
         real(c_double), intent(out) :: grad(2)
         real(c_double), value, intent(in) :: D
         real(c_double), value, intent(in) :: P
      end function

   end interface

   interface

      subroutine IDEA_DEP_batch(n, D, E, P) bind(C, name='IDEA_DEP_batch')
         import c_int, c_double
         integer(c_int), value, intent(in) :: n
         real(c_double), intent(in) :: D(n)
         real(c_double), intent(in) :: E(n)
         real(c_double), intent(out) :: P(n)
      end subroutine

      subroutine IDEA_DET_batch(n, D, E, T) bind(C, name='IDEA_DET_batch')
         import c_int, c_double
         integer(c_int), value, intent(in) :: n
         real(c_double), intent(in) :: D(n)
         real(c_double), intent(in) :: E(n)
         real(c_double), intent(out) :: T(n)
      end subroutine

      subroutine IDEA_DEH_batch(n, D, E, H) bind(C, name='IDEA_DEH_batch')
         import c_int, c_double
         integer(c_int), value, intent(in) :: n
         real(c_double), intent(in) :: D(n)
         real(c_double), intent(in) :: E(n)
         real(c_double), intent(out) :: H(n)
      end subroutine

      subroutine IDEA_DES_batch(n, D, E, S) bind(C, name='IDEA_DES_batch')
         import c_int, c_double
         integer(c_int), value, intent(in) :: n
         real(c_double), intent(in) :: D(n)
         real(c_double), intent(in) :: E(n)
         real(c_double), intent(out) :: S(n)
      end subroutine

      subroutine IDEA_DEA_batch(n, D, E, A) bind(C, name='IDEA_DEA_batch')
         import c_int, c_double
         integer(c_int), value, intent(in) :: n
         real(c_double), intent(in) :: D(n)
         real(c_double), intent(in) :: E(n)
         real(c_double), intent(out) :: A(n)
      end subroutine

      subroutine IDEA_DEC_batch(n, D, E, C) bind(C, name='IDEA_DEC_batch')
         import c_int, c_double
         integer(c_int), value, intent(in) :: n
         real(c_double), intent(in) :: D(n)
         real(c_double), intent(in) :: E(n)
         real(c_double), intent(out) :: C(n)
      end subroutine

      subroutine IDEA_DEG_batch(n, D, E, G) bind(C, name='IDEA_DEG_batch')
         import c_int, c_double
         integer(c_int), value, intent(in) :: n
         real(c_double), intent(in) :: D(n)
         real(c_double), intent(in) :: E(n)
         real(c_double), intent(out) :: G(n)
      end subroutine

      subroutine IDEA_DEV_batch(n, D, E, V) bind(C, name='IDEA_DEV_batch')
         import c_int, c_double
         integer(c_int), value, intent(in) :: n
         real(c_double), intent(in) :: D(n)
         real(c_double), intent(in) :: E(n)
         real(c_double), intent(out) :: V(n)
      end subroutine

      subroutine IDEA_DEK_batch(n, D, E, K) bind(C, name='IDEA_DEK_batch')
         import c_int, c_double
         integer(c_int), value, intent(in) :: n
         real(c_double), intent(in) :: D(n)
         real(c_double), intent(in) :: E(n)
         real(c_double), intent(out) :: K(n)
      end subroutine


      subroutine IDEA_PTD_batch(n, P, T, D) bind(C, name='IDEA_PTD_batch')
         import c_int, c_double
         integer(c_int), value, intent(in) :: n
         real(c_double), intent(in) :: P(n)
         real(c_double), intent(in) :: T(n)
         real(c_double), intent(out) :: D(n)
      end subroutine

      subroutine IDEA_PTE_batch(n, P, T, E) bind(C, name='IDEA_PTE_batch')
         import c_int, c_double
         integer(c_int), value, intent(in) :: n
         real(c_double), intent(in) :: P(n)
         real(c_double), intent(in) :: T(n)
         real(c_double), intent(out) :: E(n)
      end subroutine

      subroutine IDEA_PTH_batch(n, P, T, H) bind(C, name='IDEA_PTH_batch')
         import c_int, c_double
         integer(c_int), value, intent(in) :: n
         real(c_double), intent(in) :: P(n)
         real(c_double), intent(in) :: T(n)
         real(c_double), intent(out) :: H(n)
      end subroutine

      subroutine IDEA_PTS_batch(n, P, T, S) bind(C, name='IDEA_PTS_batch')
         import c_int, c_double
         integer(c_int), value, intent(in) :: n
         real(c_double), intent(in) :: P(n)
         real(c_double), intent(in) :: T(n)
         real(c_double), intent(out) :: S(n)
      end subroutine

      subroutine IDEA_PTA_batch(n, P, T, A) bind(C, name='IDEA_PTA_batch')
         import c_int, c_double
         integer(c_int), value, intent(in) :: n
         real(c_double), intent(in) :: P(n)
         real(c_double), intent(in) :: T(n)
         real(c_double), intent(out) :: A(n)
      end subroutine

      subroutine IDEA_PTC_batch(n, P, T, C) bind(C, name='IDEA_PTC_batch')
         import c_int, c_double
         integer(c_int), value, intent(in) :: n
         real(c_double), intent(in) :: P(n)
         real(c_double), intent(in) :: T(n)
         real(c_double), intent(out) :: C(n)
      end subroutine

      subroutine IDEA_PTG_batch(n, P, T, G) bind(C, name='IDEA_PTG_batch')
         import c_int, c_double
         integer(c_int), value, intent(in) :: n
         real(c_double), intent(in) :: P(n)
         real(c_double), intent(in) :: T(n)
         real(c_double), intent(out) :: G(n)
      end subroutine

      subroutine IDEA_PTV_batch(n, P, T, V) bind(C, name='IDEA_PTV_batch')
         import c_int, c_double
         integer(c_int), value, intent(in) :: n
         real(c_double), intent(in) :: P(n)
         real(c_double), intent(in) :: T(n)
         real(c_double), intent(out) :: V(n)
      end subroutine

      subroutine IDEA_PTK_batch(n, P, T, K) bind(C, name='IDEA_PTK_batch')
         import c_int, c_double
         integer(c_int), value, intent(in) :: n
         real(c_double), intent(in) :: P(n)
         real(c_double), intent(in) :: T(n)
         real(c_double), intent(out) :: K(n)
      end subroutine


      subroutine IDEA_DPT_batch(n, D, P, T) bind(C, name='IDEA_DPT_batch')
         import c_int, c_double
         integer(c_int), value, intent(in) :: n
         real(c_double), intent(in) :: D(n)
         real(c_double), intent(in) :: P(n)
         real(c_double), intent(out) :: T(n)
      end subroutine

      subroutine IDEA_DPE_batch(n, D, P, E) bind(C, name='IDEA_DPE_batch')
         import c_int, c_double
         integer(c_int), value, intent(in) :: n
         real(c_double), intent(in) :: D(n)
         real(c_double), intent(in) :: P(n)
         real(c_double), intent(out) :: E(n)
      end subroutine

   end interface

contains

   function IDEA_Init(modeldir, errlev) result(initlog)
      character(*), intent(in) :: modeldir
      character(*), intent(in) :: errlev
      character(:), allocatable :: initlog

      type(c_ptr) :: c_char_ptr
      character(:), pointer :: f_char_ptr

      continue

      c_char_ptr = IDEA_Init_ptr(trim(modeldir)//c_null_char, trim(errlev)//c_null_char)
      call c_f_pointer(c_char_ptr, f_char_ptr)
      initlog = f_char_ptr(1:c_strlen(c_char_ptr))

   end function

   function IDEA_Finalize() result(finlog)
      character(:), allocatable :: finlog

      type(c_ptr) :: c_char_ptr
      character(:), pointer :: f_char_ptr

      continue

      c_char_ptr = IDEA_Finalize_ptr()
      call c_f_pointer(c_char_ptr, f_char_ptr)
      finlog = f_char_ptr(1:c_strlen(c_char_ptr))

   end function

   function IDEA_Units() result(unit_info)
      character(:), allocatable :: unit_info

      type(c_ptr) :: c_char_ptr
      character(:), pointer :: f_char_ptr

      continue

      c_char_ptr = IDEA_Units_ptr()
      call c_f_pointer(c_char_ptr, f_char_ptr)
      unit_info = f_char_ptr(1:c_strlen(c_char_ptr))

   end function

end module
