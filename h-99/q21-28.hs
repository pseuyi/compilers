--q21
insertAt :: a -> Int -> [a] -> [a]
insertAt k 1 xs = [k] ++ xs
insertAt k _ [] = [k]
insertAt k n (x:xs) = [x] ++ (insertAt k (n - 1) xs)
