local function square_of_sum(n)
  local val = 0
  for i=1, n do
    val = val + i
  end
  return val*val
end

local function sum_of_squares(n)
  local val = 0
  for i=1, n do
    val = val + i*i
  end
  return val
end

local function difference_of_squares(n)
  return square_of_sum(n) - sum_of_squares(n)
end

return {
  square_of_sum = square_of_sum,
  sum_of_squares = sum_of_squares,
  difference_of_squares = difference_of_squares
}
