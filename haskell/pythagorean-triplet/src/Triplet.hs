module Triplet (tripletsWithSum) where

tripletsWithSum :: Int -> [(Int, Int, Int)]
tripletsWithSum n = [ (a, b, c) | a <- [1..(n `div` 3)], let (b, remainder) = ((n*(n-2*a)) `divMod` (2*(n-a))), remainder == 0, let c = n - a - b, b > a, b < c]
