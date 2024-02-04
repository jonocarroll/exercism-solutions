
module matrix
  implicit none

contains

  function row(matrix, dims, i) result(r)
    !! Matrix dimensions (nrows, ncols)
    integer, dimension(2), intent(in) :: dims

    !! Matrix as a 1-d array of strings
    character(len=*), dimension(dims(1)), intent(in) :: matrix

    !! Row index
    integer, intent(in) :: i

    !! Output row
    integer, dimension(dims(2)) :: r

    read(matrix(i), *) r

  end function

  function column(matrix, dims, j) result(c)
    !! Matrix dimensions (nrows, ncols)
    integer, dimension(2), intent(in) :: dims

    !! Matrix as a 1-d array of strings
    character(len=*), dimension(dims(1)), intent(in) :: matrix

    !! Column index
    integer, intent(in) :: j

    !! iterator
    integer :: x

    !! Output column
    integer, dimension(dims(1)) :: c

    !! Output row
    integer, dimension(dims(2)) :: r

    do x = 1, dims(1)
       read(matrix(x), *) r
       c(x) = r(j)
    end do

  end function

end module
