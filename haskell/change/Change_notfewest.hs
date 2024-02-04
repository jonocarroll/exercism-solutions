--module Change (findFewestCoins) where

import Data.List (find)

largestCoin :: Integer -> [Integer] -> Integer
largestCoin target coins
  | target == 0 = 0
  | otherwise = case find (<= target) (reverse coins) of
      Just value -> value
      Nothing -> 0

findFewestCoins :: Integer -> [Integer] -> Maybe [Integer]
findFewestCoins target coins
  | target < 0 = Nothing
  | target > maximum coins = Nothing
  | target <= 0 = Just []
  | otherwise = case res of
      [] -> Nothing
      _ -> Just (concat res)
  where
    res = [ coin : rest | coin <- [largestCoin target coins],
            let chg = target - coin,
            let rest = fromMaybe [] (findFewestCoins chg coins)
        ]

fromMaybe :: a -> Maybe a -> a
fromMaybe def Nothing = def
fromMaybe _ (Just x) = x
