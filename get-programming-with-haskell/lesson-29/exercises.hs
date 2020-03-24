--29.1
maybeHello = Just "hello"

maybeWorld = Just "world"

res = (++) <$> maybeHello <*> maybeWorld

--29.2
answer :: IO string
answer = pure "hello world"

--29.3
--there is a type mismatch
--29.4
doorPrize :: [Int]
doorPrize = [1000, 2000, 3000]

boxPrize :: [Int]
boxPrize = [500, 20000]

multiplierPrize :: [Int]
multiplierPrize = [10, 50]

totalPrize :: [Int]
totalPrize = (pure *) <*> doorPrize <*> multiplierPrize

data User =
  User
    { name :: String
    , gamerId :: Int
    , score :: Int
    }
  deriving (Show)

testNames :: [String]
testNames =
  [ "John Smith"
  , "Robert'); DROP TABLE Students;--"
  , "Christina NULL"
  , "Randall Munroe"
  , "@pseuyi"
  ]

testIds :: [Int]
testIds = [1337, 0123, 999999]

testScores :: [Int]
testScores = [0, 100000, -99999]

testData :: [User]
testData = pure User <*> testNames <*> testIds <*> testScores

-- length testData => 45
--q29.1
allFmap :: Applicative f => (a -> b) -> f a -> f bc
allFmap f x = (pure f) <*> x

--q29.2
example :: Int
example = (*) ((+) 2 4) 6

exampleMaybe :: Maybe Int
exampleMaybe = pure (*) <*> (pure (+) <*> pure 2 <*> pure 4) <*> pure 6

--q29.3
purchased = [6, 12]

drankLastNight = -2

friends = [2, 3]

gamingConsumption = [-3, -4]

possibleBeerShortage = demand - available
  where
    available = (\b -> b - drankLastNight) <$> purchased
    demand = (pure (*)) <*> totalGamers <*> gamingConsumption
    totalGamers = (+ 2) <$> friends
