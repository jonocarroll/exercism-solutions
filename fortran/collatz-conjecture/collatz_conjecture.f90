
module collatz_conjecture
  implicit none
contains

  integer function steps(i)
    integer :: i, j
    steps = -1

    j = i

    if (j .le. 0) then
       return
    end if

    steps = 0

    do while ( (j .ne. 1) )
       if (mod(j, 2) .eq. 0) then
          j = j / 2
       else
          j = 3 * j + 1
       end if
       steps = steps + 1
    end do

  end function

end module
