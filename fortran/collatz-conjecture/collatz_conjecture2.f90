
module collatz_conjecture
  implicit none
contains

  integer function steps(i)
    integer :: i, n
    steps = -1

    if (i .le. 0) then
       return
    end if

    steps = 0

    do n = 1, 100
       !write(*,*) i, n, steps   
       !write(*,*) steps
       write(*,*) i / 2,  mod(i, 2) .eq. 0

       if (mod(i, 2) .eq. 0) then
          write(*,*) "is even", i/2
           i = i/2
        else
           i = 3 * i + 1
        end if
       steps = steps + 1
    end do

  end function

end module collatz_conjecture

program main

  use collatz_conjecture

  integer :: x

  x = steps(16)
  write(*,*) x

end program main
