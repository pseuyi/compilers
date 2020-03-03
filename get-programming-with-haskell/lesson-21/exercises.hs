--21.1
--name <- getLine, gets a String
--21.2
--no, main must return (), getLine returns IO String
--21.3
--no, getLine value must be assigned using <-
areaGivenDiameter :: Double -> Double
areaGivenDiameter size = pi * (size / 2) ^ 2

type Pizza = (Double, Double)

costPerInch :: Pizza -> Double
costPerInch (size, cost) = cost / areaGivenDiameter size

comparePizzas :: Pizza -> Pizza -> Pizza
comparePizzas p1 p2 =
  if costP1 < costP2
    then p1
    else p2
  where
    costP1 = costPerInch p1
    costP2 = costPerInch p2

describePizza :: Pizza -> String
describePizza (size, cost) =
  "The " ++
  show size ++
  " pizza " ++ "is cheaper at " ++ show costSqInch ++ " per square inch"
  where
    costSqInch = costPerInch (size, cost)

main :: IO ()
main = do
  putStrLn "What is the size of pizza 1"
  size1 <- getLine
  putStrLn "What is the cost of pizza 1"
  cost1 <- getLine
  putStrLn "What is the size of pizza 2"
  size2 <- getLine
  putStrLn "What is the cost of pizza 2"
  cost2 <- getLine
  let pizza1 = (read size1, read cost1)
  let pizza2 = (read size2, read cost2)
  let betterPizza = comparePizzas pizza1 pizza2
  putStrLn (describePizza betterPizza)

-- Maybe Monad example
costData :: Map.Map Int Double
costData = Map.fromList [(1, 18.0), (2, 16.0)]

sizeData :: Map.Map Int Double
sizeData = Map.fromList [(1, 20.0), (2, 15.0)]

maybeMain :: Maybe String
maybeMain = do
  size1 <- Map.lookup 1 sizeData
  cost1 <- Map.lookup 1 costData
  size2 <- Map.lookup 2 sizeData
  cost2 <- Map.lookup 2 costData
  let pizza1 = (size1, cost1)
  let pizza2 = (size2, cost2)
  let betterPizza = comparePizzas pizza1 pizza2
  return (describePizza betterPizza)

--q21.1
helloPerson :: String -> String
helloPerson name = "Hello" ++ " " ++ name ++ "!"

nameData :: Map.Map Int String
nameData = Map.fromList [(1, "wworld")]

maybeMain2 :: Maybe String
maybeMain2 = do
  putStrLn "Hello! What's your name?"
  name <- Map.lookup 1 nameData
  let statement = helloPerson name
  putStrLn statement

--q21.2

fastFib 1 n1 _ = n1
fastFib n n1 n2 = fastFib (n - 1) (n1 + n2) n1

mainFib :: IO ()
mainFib ::
  n <- getLine
  let nth = fastFib n 1 1
  putStrLn "the nth fib num is: " ++ nth
