module reverse_string
  implicit none
contains

  function reverse(input) result(reversed)

    character(*), intent(in) :: input
    character(len=len(input)) :: reversed
    integer :: i, l

    l = len(input)

    if ( l == 0 ) then
       return
    end if

    do i = 1, l
       reversed(i:i) = input(l-i+1:l-i+1)
    end do

  end function

end module
