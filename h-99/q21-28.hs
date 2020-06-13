--q21
insertAt :: a -> Int -> [a] -> [a]
insertAt k 1 xs = [k] ++ xs
insertAt k _ [] = [k]
insertAt k n (x:xs) = [x] ++ (insertAt k (n - 1) xs)

--q22
range :: Int -> Int -> [Int]
range a b
  | b < a = [0]
  | a == b = [a]
  | otherwise = [a] ++ range (a + 1) b
