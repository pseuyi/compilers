type LatLong = (Double, Double)

locationDB :: Map.Map String LatLong
locationDB =
  Map.fromList
    [ ("Arkham", (42.6054, -70.7829))
    , ("Innsmouth", (42.8250, -70.8150))
    , ("Carcosa", (29.9714, -90.7694))
    , ("New York", (40.7776, -73.9691))
    ]

toRadians :: Double -> Double
toRadians degrees = degrees * pi / 180

latLongToRads :: LatLong -> (Double, Double)
latLongToRads (lat, long) = (rlat, rlong)
  where
    rlat = toRadians lat
    rlong = toRadians long

haversine :: LatLong -> LatLong -> Double
haversine coords1 coords2 = earthRadius * c
  where
    (rlat1, rlong1) = latLongToRads coords1
    (rlat2, rlong2) = latLongToRads coords2
    dlat = rlat2 - rlat1
    dlong = rlong2 - rlong1
    a = (sin (dlat / 2)) ^ 2 + cos rlat1 * cos rlat2 * (sin (dlong / 2)) ^ 2
    c = 2 * atan2 (sqrt a) (sqrt (1 - a))
    earthRadius = 3961.0

printDistance :: Maybe Double -> IO ()
printDistance Nothing = putStrLn "Error, invalid city entered"
printDistance (Just distance) = putStrLn (show distance ++ " miles")

haversineMaybe :: Maybe LatLong -> Maybe LatLong -> Maybe Double
haversineMaybe Nothing _ = Nothing
haversineMaybe _ Nothing = Nothing
haversineMaybe (Just val1) (Just val2) = Just (haversine val1 val2)

addMaybe :: Maybe Int -> Maybe Int -> Maybe Int
addMaybe Nothing _ = Nothing
addMaybe _ Nothing = Nothing
addMaybe (Just a) (Just b) = Just (a + b)

--28.2
--distanceFromNY = haversine newYork
--28.3
val1 = Just 10

val2 = Just 5

res1 = (*) <$> val1 <*> val2

res2 = div <$> val1 <*> val2

res3 = mod <$> val1 <*> val2

main :: IO ()
main = do
  putStrLn "Enter the starting city name:"
  startingInput <- getLine
  let startingCity = Map.lookup startingInput locationDB
  putStrLn "Enter the destination city name:"
  destInput <- getLine
  let destCity = Map.lookup destInput locationDB
  let distance = haversine <$> startingCity <*> destCity
  printDistance distance

--q28.1
haversineIO :: IO LatLong -> IO LatLong -> IO Double
haversineIO a b = do
  val1 <- a
  val2 <- b
  res <- haversine val1 val2
  putStrLn res

--q28.2
haversineIO2 :: IO LatLong -> IO LatLong -> IO Double
haversineIO2 val1 val2 = haversine <$> val1 <*> val2

--q28.3
data RobotPart =
  RobotPart
    { name :: String
    , description :: String
    , cost :: Double
    , count :: Int
    }
  deriving (Show)

leftArm :: RobotPart
leftArm =
  RobotPart
    { name = "left arm"
    , description = "left arm for face punching!"
    , cost = 1000.00
    , count = 3
    }

rightArm :: RobotPart
rightArm =
  RobotPart
    { name = "right arm"
    , description = "right arm for kind hand gestures"
    , cost = 1025.00
    , count = 5
    }

robotHead :: RobotPart
robotHead =
  RobotPart
    { name = "robot head"
    , description = "this head looks mad"
    , cost = 5092.25
    , count = 2
    }

partsDB :: Map.Map Int RobotPart
partsDB = Map.fromList keyVals
  where
    keys = [1, 2, 3]
    vals = [leftArm, rightArm, robotHead]
    keyVals = zip keys vals

lookupPart :: Int -> Maybe RobotPart
lookupPart id = Map.lookup id partsDB

showName :: Maybe String -> IO ()
showName Nothing = putStrLn "could not find part"
showName (Just name) = putStrLn name

cheapestPart :: IO ()
cheapestPart = do
  putStrLn "Enter two part ids:"
  id1 <- read getLine
  id2 <- read getLine
  let p1 = lookupPart id1
  let p2 = lookupPart id2
  res <- min <$> (cost <$> p1) <*> (cost <$> p2)
  showName res
