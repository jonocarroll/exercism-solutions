
module divide
  implicit none
contains

  integer function steps(i)
    real :: i, j

    j = i
    steps = 0

    do while (j > 0)
       write(*,*) j, j/2
       j = j / 2
       steps = steps + 1
       if ( j <= 1.0 ) return
    end do

  end function steps

end module divide

program main

  use divide

  integer :: x

  x = steps(16.0)
  write(*,*) x

end program main



