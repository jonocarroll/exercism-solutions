let sum l = List.fold_left (+.) 0. l

let square_of_sum n =
  let s = sum (List.init n (fun x -> float_of_int (x + 1))) in
  int_of_float (s *. s)

let sum_of_squares n =
  int_of_float (sum (List.init n (fun x -> float_of_int ((x + 1) * (x + 1)))))

let difference_of_squares n =
  square_of_sum n - sum_of_squares n
