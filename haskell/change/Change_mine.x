module Change (findFewestCoins) where

import Data.List (find)
import Data.List (minimumBy)
import Data.Function (on)
import Debug.Trace
--import Control.Monad (mapM)

smallestLengthList :: [[Integer]] -> [Integer]
smallestLengthList = minimumBy (compare `on` length)

largestCoin :: Integer -> [Integer] -> Integer
largestCoin target coins
  | target == 0 = 0
  | otherwise = case find (<= target) (reverse coins) of
      Just value -> value
      Nothing -> 0

findCoins :: Integer -> [Integer] -> Maybe [Integer]
findCoins target coins
  | target < 0 = Nothing
  | target == 0 = Just []
  | otherwise = case res of
      [] -> Nothing
      _ -> Just (concat res)
  where
    res = [ coin : rest | coin <- [largestCoin target coins],
            let chg = target - coin,
            let rest = fromMaybe [] (findCoins chg coins)
        ]

dropCoin :: [Integer] -> Integer -> [Integer]
dropCoin coins n = (reverse (drop (fromIntegral n) (reverse coins)))

ffcDrop :: Integer -> [Integer] -> Integer -> [Integer]
ffcDrop target coins n = case findCoins target (dropCoin coins n) of
  Nothing -> []
  Just [] -> []
  Just [value] -> [value]
  Just (x:xs) -> (x:xs)

findFewestCoins :: Integer -> [Integer] -> Maybe [Integer]
findFewestCoins target coins
  | target < 0 = Nothing
  | target == 0 = Just []
  | target < minimum coins = Nothing
  | otherwise = do
  let r = [0..((fromIntegral (length coins))-1)]
  let opts = map (ffcDrop target coins) r
--  traceShow "lists:" (pure ())
--  traceShow opts (pure ())
  let res = smallestLengthList (filter (not . null) opts)
  case res of
    [] -> Nothing
    [x] -> Just [x]
    (x:xs) -> Just (x:xs)

fromMaybe :: a -> Maybe a -> a
fromMaybe def Nothing = def
fromMaybe _ (Just x) = x
