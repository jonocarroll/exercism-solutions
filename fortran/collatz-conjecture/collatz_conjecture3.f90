
module divide
  implicit none
contains

  integer function steps(i)
    integer :: i

    steps = 0

    do while (i > 0)
       write(*,*) i, i/2
       i = i / 2
       steps = steps + 1
       if ( i <= 1.0 ) return
    end do

  end function

end module divide

program main

  use divide

  integer :: x, y

  y = 16
  x = steps(y)
  write(*,*) x

end program main





