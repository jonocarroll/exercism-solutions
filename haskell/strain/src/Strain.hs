module Strain (keep, discard) where

import Data.Function

--applyWhen :: Bool -> (a -> a) -> a -> a
--applyWhen True f x = f x
--applyWhen False _ x = x

keep :: (a -> Bool) -> [a] -> [a]
keep p = keep' where
  keep' [] = []
  keep' (x:xs) = (applyWhen (p x) (x :)) $ keep' xs

discard :: (a -> Bool) -> [a] -> [a]
discard = keep . (not .)
