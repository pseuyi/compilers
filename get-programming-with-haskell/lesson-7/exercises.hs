myTake n (x:xs) =
  if n > 0
    then x ++ myTake (n - 1) xs
    else []

-- in myGCD a can be smaller than b
myGCD a b =
  if remainder == 0
    then b
    else myGCD b remainder
  where
    remainder = mod a b

myTail (_:xs) = xs
myTail [] = []

myGCD' a b = myGCD b (mod a b)
myGCD' a 0 = a
