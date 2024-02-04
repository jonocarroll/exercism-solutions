module rna_transcription
  implicit none
contains

  function to_rna(dna)
      character(*) :: dna
      character(len(dna)) :: to_rna

      character :: tmp

      integer :: l, i

      l = len(dna)

      do i = 1, l
         select case (dna(i:i))
         case ("A")
            tmp = "U"
         case ("G")
            tmp = "C"
         case ("C")
            tmp = "G"
         case ("T")
            tmp = "A"
         case default
            tmp = dna(i:i)
         end select

         to_rna(i:i) = tmp
      end do

  end function to_rna

end module rna_transcription
