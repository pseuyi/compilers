-- problem 14
dupli :: [a] -> [a]
dupli [] = []
dupli (x:xs) = [x] ++ [x] ++ dupli xs
