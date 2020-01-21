import Data.Char

remove test [] = []
remove test (x:xs) =
  if test x
    then remove test xs
    else x : remove test xs

myProduct ns = foldl (*) 1 ns

myElem n [] = False
myElem n xs = len > 0
  where
    len = length (filter (== n) xs)

isPalindrome x = word == reverse word
  where
    word = map toLower (filter (/= ' ') x)

harmonic n = foldl (+) 0 (take n values)
  where
    values = map (\n -> 1 / n) [1 ..]
