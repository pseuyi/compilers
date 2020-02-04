-- problem 1
myLast :: [a] -> Maybe a
myLast [] = Nothing
myLast x =
  case (drop (length (x) - 1) x) of
    [x] -> Just x

myLast' [] = Nothing
myLast' [x] = Just x
myLast' (x:xs) = myLast' xs

--problem 2
myButLast [] = Nothing
myButLast [x] = Nothing
myButLast [x, y] = Just x
myButLast (x:xs) = myButLast xs

-- problem 3
elementAt :: [a] -> Int -> Maybe a
elementAt [] _ = Nothing
elementAt _ 0 = Nothing
elementAt (x:xs) 1 = Just x
elementAt (x:xs) a = elementAt xs (a - 1)

-- problem 4
myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

-- problem 5
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = (myReverse xs) ++ [x]

-- problem 6
isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome a = (myReverse a) == a

-- problem 7
data NestedList a
  = Elem a
  | List [NestedList a]

flatten :: NestedList a -> [a]
flatten (Elem a) = [a]
flatten (List []) = []
flatten (List (x:xs)) = (flatten x) ++ (flatten (List xs))

-- problem 8
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

folder :: Eq a => [a] -> a -> [a]
folder [] x = [x]
folder l x =
  if x == (last l)
    then l
    else l ++ [x]

compress'' :: Eq a => [a] -> [a]
compress'' l = foldl folder [] l

-- problem 9 
folder' :: Eq a => [[a]] -> a -> [[a]]
folder' [] x = [[x]]
folder' l x =
  if (lastInSublist) == x
    then (take ((length l) - 1) l) ++ [(lastSublist ++ [x])]
    else (l ++ [[x]])
  where
    lastSublist = last l
    lastInSublist = last (last l)

pack :: Eq a => [a] -> [[a]]
pack l = foldl folder' [] l

-- problem 10
encode :: Eq a => [a] -> [(Int, a)]
encode l = map (\s -> (length s, head s)) sub
  where
    sub = pack l
