myLast :: [a] -> Maybe a
myLast [] = Nothing
myLast x =
  case (drop (length (x) - 1) x) of
    [x] -> Just x

myLast' [] = Nothing
myLast' [x] = Just x
myLast' (x:xs) = myLast' xs

myButLast [] = Nothing
myButLast [x] = Nothing
myButLast [x, y] = Just x
myButLast (x:xs) = myButLast xs

elementAt :: [a] -> Int -> Maybe a
elementAt [] _ = Nothing
elementAt _ 0 = Nothing
elementAt (x:xs) 1 = Just x
elementAt (x:xs) a = elementAt xs (a - 1)

myLength :: [a] -> Int
myLength [] = 0
myLength [a] = 1
myLength (x:xs) = 1 + myLength xs

myReverse :: [a] -> [a]
myReverse [] = []
myReverse [a] = [a]
myReverse (x:xs) = (myReverse xs) ++ [x]

isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome [a] = True
isPalindrome a = (myReverse a) == a

{-
isPalindrome [] = True 
isPalindrome [a] = True 
isPalindrome x:xs = (x == myLast xs) && ...
-}
{-- [1, [1,2,3]]
List [Elem 1, List[Elem 1, Elem 2, Elem 3]]
Elem 2
data NestedList a = 
    Elem a 
  | List [NestedList a]

flatten :: Nested 
--}
--data List a = Nil | Cons (a, List)
-- [] --> Nil
-- [x] --> Cons (x, Nil)
data NestedList a
  = Elem a
  | List [NestedList a]

flatten :: NestedList a -> [a]
flatten (Elem a) = [a]
flatten (List []) = []
flatten (List ((Elem x):xs)) = x : flatten (List xs)
flatten (List ((List []):xs)) = flatten (List xs)
flatten (List (x:xs)) = (flatten x) ++ (flatten (List xs))

-- problem 8
-- compress "aaaabccaadeeee"
-- "abcade"
compress :: Eq a => [a] -> [a] -> [a]
compress [] l = l
compress (x:xs) l =
  case xs of
    [] -> l ++ [x]
    (y:ys) ->
      if x == y
        then compress xs l
        else compress xs (l ++ [x])

compress' :: Eq a => [a] -> [a] -> [a]
compress' [] l = l
compress' [x] l = l ++ [x]
compress' (x:y:xs) l =
  if x == y
    then compress' tail l
    else compress' tail l ++ [x]
  where
    tail = [y] ++ xs

foldingFunc8 :: Eq a => [a] -> a -> [a]
foldingFunc8 [] x = [x]
foldingFunc8 l x =
  if x == (last l)
    then l
    else l ++ [x]

compressThird :: Eq a => [a] -> [a]
compressThird l = foldl foldingFunc8 [] l

-- x = [1 2 2 2 3 3 2 2]
-- 1 : 2  : 3 : 2 : 1
-- random x []
{- 
for ea el in the list
compare it with head of tail
if el != head of tail, keep the el
keep iterating
if at end of tail, list of one el returns list of one el
-}
-- random [2 2 2 3 3 2 2] [1]
-- random [2 2 3 3 2 2] [1]
-- Problem 9 (from outer space)
foldingFunc9 :: Eq a => [[a]] -> a -> [[a]]
foldingFunc9 [] x = [[x]]
foldingFunc9 l x =
  if (last (last l)) == x
    then (take ((length l) - 1) l) ++ [((last l) ++ [x])]
    else (l ++ [[x]])

subList :: Eq a => [a] -> [[a]]
subList l = foldl foldingFunc9 [] l

encode :: Eq a => [a] -> [(Int, a)]
encode l = map (\s -> (length s, head s)) sub
  where
    sub = subList l
