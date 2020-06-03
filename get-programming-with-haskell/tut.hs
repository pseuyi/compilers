-- :r to reload in ghci
--
-- lists
--
primes = [1, 2, 3, 5, 7, 11]

-- null primes
-- last primes
-- init primes
is7P = elem 7 primes

maxP = maximum primes

minP = minimum primes

prod = product primes

zeroToTen = [0 .. 10]

evenNums = [2,4 .. 20]

everyOtherChar = ['A','C' .. 'Z']

listTimes2 = [x * 2 | x <- [1 .. 10]]

divBy9N13 = [x | x <- [1 .. 500], x `mod` 13 == 0, x `mod` 9 == 0]

-- fizzBuzz
--
multTable = [[x * y | y <- [1 .. 10]] | x <- [1 .. 10]]

firstChar :: String -> String
firstChar [] = "empty string"
firstChar all@(x:xs) = "the first letter in " ++ all ++ " is " ++ [x]
