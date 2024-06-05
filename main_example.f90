program test

   use idea

   implicit none
   character(:), allocatable :: modeldir
   character(:), allocatable :: errlev
   character(:), allocatable :: unit_info
   character(:), allocatable :: initlog
   character(:), allocatable :: finlog
   real(kind=8) :: D, E, P, grad(2), hess(3)
   real(kind=8) :: Ds(2), Es(2), Ps(2)

   continue

   ! Print the list of units used by IDEA
   unit_info = IDEA_Units()
   print *, trim(unit_info)

   ! Initialize IDEA
   modeldir = 'models/15000K/'
   errlev = 'ALL = 1, PTD=3, DEP=4'
   initlog = IDEA_Init(modeldir, errlev)
   print *, trim(initlog)

   ! Usage examples of IDEA subroutines

   D = 0.1d0 ! density [kg/m3]
   E = 1.4d5 ! specific energy [m2/s2]
   P = 0.0d0 ! pressure [Pa]
   ! grad[0] = derivative of pressure with respect to density (dP/dD)
   ! grad[1] = derivative of pressure with respect to specific energy (dP/dE)
   grad = 0.0d0
   ! hess[0] = second derivative of pressure (d**2P/dD**2)
   ! hess[1] = mixed second derivative of pressure (d**2P/dDdE)
   ! hess[2] = second derivative of pressure (d**2P/dE**2)
   hess = 0.0d0
   print *, 'Density (D) = ', D, ' kg/m3'
   print *, 'Specific energy (E) = ', E, ' m2/s2'

   ! input: D, E
   ! output : P
   P = IDEA_DEP(D, E)
   print *, ''
   print *, 'Example 1. IDEA_DEP'
   print *, 'Pressure (P) = ', P, ' Pa'

   ! input: D, E
   ! output: P, grad
   P = IDEA_DEP_Grad(grad, D, E)
   print *, ''
   print *, 'Example 2. IDEA_DEP_Grad'
   print *, 'Pressure (P) = ', P, ' Pa'
   print *, 'dP/dD = ', grad(1)
   print *, 'dP/dE = ', grad(2)

   ! input: D, E
   ! output: P, grad, hess
   P = IDEA_DEP_Hess(hess, grad, D, E)
   print *, ''
   print *, 'Example 3. IDEA_DEP_Hess'
   print *, 'Pressure (P) = ', P, ' Pa'
   print *, 'dP/dD = ', grad(1)
   print *, 'dP/dE = ', grad(2)
   print *, 'd**2P/dD**2 = ', hess(1)
   print *, 'd**2P/dDdE  = ', hess(2)
   print *, 'd**2P/dE**2 = ', hess(3)

   ! input: Ds(2), Es(2)
   ! output: Ps(2)
   Ds = D
   Es = E
   Ps = 0.0d0
   call IDEA_DEP_batch(2, Ds, Es, Ps)
   print *, ''
   print *, 'Example 4. IDEA_DEP_batch'
   print *, 'Pressure (Ps(1)) = ', Ps(1), ' Pa'
   print *, 'Pressure (Ps(2)) = ', Ps(2), ' Pa'

   ! Finalize IDEA
   finlog = IDEA_Finalize()
   print *, ''
   print *, trim(finlog)

end program
