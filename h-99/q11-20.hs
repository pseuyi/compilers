-- problem 14
dupli :: [a] -> [a]
dupli [] = []
dupli (x:xs) = [x] ++ [x] ++ dupli xs

-- problem 15
repli :: [a] -> Int -> [a]
repli [] _ = []
repli list n = concatMap (\v -> map (\n -> v) [1 .. n]) list
