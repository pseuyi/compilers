aList = ["cat", "dog", "mouse"]

-- :t aList
data Icecream
  = Chocolate
  | Vanilla
  deriving (Show, Eq, Ord) -- q13.1
  {-
     it looks like you can use the Word type class the same way as the Int type class
     -}

-- q13.2
-- the succ function is more generic, and throws exceptions
-- q13.3
cycleSucc :: (Bounded a, Enum a, Eq a) => a -> a
cycleSucc n =
  if n == maxBound
    then n
    else succ n
