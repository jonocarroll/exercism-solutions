module Acronym (abbreviate) where

import Data.Char

splitReplace :: String -> String
splitReplace [] = []
splitReplace (x1 : x2 : xs)
  | isLower x1 && isUpper x2 = x1 : ' ' : x2 : splitReplace xs
splitReplace ('-' : xs) = ' ' : splitReplace xs
splitReplace ('_' : xs) = ' ' : splitReplace xs
splitReplace (x1 : xs) = x1 : splitReplace xs

abbreviate :: String -> String
abbreviate = map (toUpper . head) . words . splitReplace

