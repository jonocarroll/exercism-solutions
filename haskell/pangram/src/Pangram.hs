module Pangram (isPangram) where

import Data.Char

isPangram :: String -> Bool
isPangram text = all (`elem` (map toLower text)) ['a'..'z']
