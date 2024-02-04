module hamming
  implicit none
contains

  function compute(strand1, strand2, distance)
      character(*) :: strand1, strand2
      integer :: distance, len1, len2, i
      logical :: compute

      distance = 0
      len1 = len(strand1)
      len2 = len(strand2)

      if ( len1 == 0 .and. len2 == 0 ) then
         compute = .true.
         return
      end if

      if ( len1 /= len2 ) then
         compute = .false.
         return
      end if

      do i = 1, len1
         if ( strand1(i:i) /= strand2(i:i) ) then
            distance = distance + 1
         end if
      end do

      compute = .true.

  end function compute

end module hamming
