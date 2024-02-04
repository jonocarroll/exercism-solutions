"Square the sum of the first `n` positive integers"
function square_of_sum(n)
    sum(1:n)^2
end

"Sum the squares of the first `n` positive integers"
function sum_of_squares(n)
    sum([i^2 for i in 1:n])
end

"Subtract the sum of squares from square of the sum of the first `n` positive ints"
function difference(n)
    square_of_sum(n) - sum_of_squares(n)
end
