module DNA (toRNA) where

dnaToRNA :: Char -> Either Char Char
dnaToRNA x = case x of 
  'A' -> Right 'U'
  'G' -> Right 'C'
  'C' -> Right 'G'
  'T' -> Right 'A'
  other -> Left other

toRNA :: String -> Either Char String
toRNA xs = sequence $ map dnaToRNA xs


