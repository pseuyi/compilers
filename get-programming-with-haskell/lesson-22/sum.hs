import Control.Monad
  {-
main :: IO ()
main = do
  args <- getArgs
  mapM_ putStrLn args
  -}
  {- well this below is bad bc the the mapM returns IO [String]
main :: IO ()
main = do
  mapM_ putStrLn (mapM (\_ -> getLine) [0 .. 2])
  -}

import System.Environment

main :: IO ()
main
  -- vals pattern matches the inside of expr to the right of <-
 = do
  vals <- mapM (\_ -> getLine) [0 .. 2]
  mapM_ putStrLn vals

mainSum :: IO ()
mainSum = do
  args <- getArgs
  let linesToRead =
        if length args > 0
          then read (head args)
          else 0
  numbers <- replicateM linesToRead getLine
  let ints = map read numbers :: [Int]
  print (sum ints)

myReplicateM ioAction n = do
  mapM (\_ -> ioAction) [1 .. n]
