-- x :: Int (bounded)
-- x :: Integer (unbounded)
half :: Int -> Double
half n = (fromIntegral n) / 2

halve :: Int -> Int
halve n = div n 2

printDouble :: Int -> String
printDouble n = show (n * 2)

makeAddressLambda :: Int -> String -> String -> (Int, String, String)
makeAddressLambda = (\n -> (\s -> (\t -> (n, s, t))))

makeAddressLambda1 :: String -> String -> (Int, String, String)
makeAddressLambda1 = makeAddressLambda 123

makeAddressLambda2 :: String -> (Int, String, String)
makeAddressLambda2 = makeAddressLambda1 "happy st"

-- myMap :: a -> b -> [a]
-- myMap show [1,2,3,4]
-- q11.1
-- filter :: a -> Bool -> [a] -> [a]
-- filter takes a function that takes a value in a list, runs it thru a test that returns a bool, then creates a list of passing elements
-- q11.2
safeTail :: [a] -> [a]
safeTail [] = []
safeTail (x:xs) = xs
{-
safeHead :: [a] -> [a]
safeHead [] = []
safeHead (x:xs) = x
-}
-- with just type variables, safeHead cannot both return [a] and a
-- q11.3
-- myFoldl :: (b -> a -> b) -> b -> [a] -> b
