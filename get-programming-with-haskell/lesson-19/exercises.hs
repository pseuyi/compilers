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
