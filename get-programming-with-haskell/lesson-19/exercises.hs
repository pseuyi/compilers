import qualified Data.Map as Map

data Organ
  = Heart
  | Brain
  | Kidney
  | Spleen
  deriving (Show, Eq)

organs :: [Organ]
organs = [Heart, Heart, Brain, Spleen, Spleen, Kidney]

ids :: [Int]
ids = [2, 7, 13, 14, 21, 24]

organPairs :: [(Int, Organ)]
organPairs = zip ids organs

organCatalog :: Map.Map Int Organ
organCatalog = Map.fromList organPairs

-- 19.1
-- :t Nothing => Nothing :: Maybe a => Maybe Organ
-- 19.2
numOrZero :: Maybe Int -> Int
numOrZero
  | n == Nothing = 0
  | n == Just n = n

-- 19.3
data Container
  = Vat Organ
  | Cooler Organ
  | Bag Organ

data Location
  = Lab
  | Kitchen
  | Bathroom
  deriving (Show)

organToContainer :: Organ -> Container
organToContainer Brain = Vat Brain
organToContainer Heart = Cooler Heart
organToContainer organ = Bag organ

placeInLocation :: Container -> (Location, Container)
placeInLocation (Vat a) = (Lab, Vat a)
placeInLocation (Cooler a) = (Lab, Cooler a)
placeInLocation (Bag a) = (Kitchen, Bag a)

process :: Organ -> (Location, Container)
process organ = placeInLocation (organToContainer organ)

report :: Maybe (Location, Container) -> String
report (Just (location, container)) =
  show container ++ " in the " ++ show location
report Nothing = "error, organ not found"

processRequest :: Int -> Map.Map Int Organ -> String
processRequest id catalog = processAndReport organ
  where
    organ = Map.lookup id catalog

processAndReport :: (Maybe Organ) -> String
processAndReport (Just organ) = report (process organ)
processAndReport Nothing = report Nothing
--q19.1
--q19.2
