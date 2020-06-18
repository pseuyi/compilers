import Control.Monad
import System.Random

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

--q23
rndSelect :: [a] -> Int -> IO [a]
rndSelect ls@(x:xs) n = do
  idxs <- replicateM n (randomRIO (1, (length xs) + 1))
  return [x | (x, i) <- (zip ls [1 .. (length ls)]), i `elem` idxs]

-- q23, recursive
rndSelect' :: [a] -> Int -> IO [a]
rndSelect' _ 0 = do
  return []
rndSelect' xs n = do
  idx <- randomRIO (1, (length xs))
  rest <- rndSelect' (removeAt xs idx) (n - 1)
  return ((xs !! idx) : rest)

removeAt :: [a] -> Int -> [a]
removeAt [] _ = []
removeAt xs 0 = xs
removeAt xs n = rest
  where
    rest = [x | (x, i) <- ls, i /= n]
    ls = zip xs [1 .. (length xs)]

--q24
diffSelect :: Int -> Int -> IO [Int]
diffSelect n m = rndSelect' [1 .. m] n

--q25
rndPermu :: [a] -> IO [a]
rndPermu [] = return []
rndPermu xs = do
  idx <- randomRIO (0, (length xs) - 1)
  rest <- rndPermu (removeAt xs (idx + 1))
  return ((xs !! idx) : rest)
