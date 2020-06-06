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
_dE [x] 1 o = []
_dE (x:xs) 1 o = dropEvery xs o
_dE ls n o = dropEvery ls n
