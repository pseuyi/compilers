-- problem 14
dupli :: [a] -> [a]
dupli [] = []
dupli (x:xs) = [x] ++ [x] ++ dupli xs

-- problem 15
repli :: [a] -> Int -> [a]
repli [] _ = []
repli list n = concatMap (\v -> map (\n -> v) [1 .. n]) list

-- p16
dropEvery :: [a] -> Int -> [a]
dropEvery [] _ = []
dropEvery ls 0 = ls
dropEvery _ 1 = []
dropEvery (x:xs) n = [x] ++ (_dE xs (n - 1) n)

_dE :: [a] -> Int -> Int -> [a]
_dE [] _ _ = []
_dE [x] 1 _ = []
_dE (x:xs) 1 o = dropEvery xs o
_dE ls n _ = dropEvery ls n

dropEveryLC :: [a] -> Int -> [a]
dropEveryLC xs 0 = xs
dropEveryLC xs n = [i | (i, c) <- zip xs [1,2 ..], c `mod` n /= 0]

-- p17
split :: [a] -> Int -> ([a], [a])
split xs n
  | n <= 0 = ([], xs)
  | length xs <= n = (xs, [])
split (x:xs) n = split' [x] xs
  where
    split' a (b:bs) =
      if length a == n
        then (a, [b] ++ bs)
        else split' (a ++ [b]) bs

-- p 18
slice :: [a] -> Int -> Int -> [a]
slice [] _ _ = []
slice (x:_) _ 1 = [x]
slice xs a b = [x | (x, i) <- ls, i >= a, i <= b]
  where
    ls = zip xs [1 .. last]
    last = length xs
