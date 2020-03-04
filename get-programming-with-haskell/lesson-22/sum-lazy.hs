main :: IO ()
main = do
  userInput <- getContents
  mapM_ print userInput

--22.3
main2 :: IO ()
main2 = do
  userInput <- getContents
  putStrLn (reverse userInput)

-- print vs putStrLn? => print x = putStrLn (show x)
toInts :: String -> [Int]
toInts = map read . lines

main3 :: IO ()
main3 = do
  userInput <- getContents
  let numbers = toInts userInput
  print (sum numbers)

--22.4
mainSumSquares :: IO ()
mainSumSquares = do
  userInput <- getContents
  let sum = map (^ 2) (toInts userInput)
  print sum
