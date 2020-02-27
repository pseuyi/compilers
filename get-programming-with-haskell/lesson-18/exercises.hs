import qualified Data.Map as Map

data Box a =
  Box a
  deriving (Show)

data Triple a =
  Triple a a a
  deriving (Show)

wrap :: a -> Box a
wrap x = Box x

-- 18.1
-- wrap (Box 'a') :: Box (Box char)
-- 18.2
-- transform takes an identity (a -> a), map takes (a -> b)
-- 18.3
-- you wouldn't be able to
-- 18.4
-- :kind (,,)
-- (,,) :: * -> * -> * -> *
-- q18.1
boxMap :: (a -> b) -> Box a -> Box b
boxMap f (Box x) = Box (f x)

tripleMap :: (a -> b) -> Triple a -> Triple b
tripleMap f (Triple x y z) = Triple (f x) (f y) (f z)

-- q18.2
data Organ
  = Heart
  | Brain
  | Kidney
  | Spleen
  deriving (Show, Eq, Ord)

organs :: [Organ]
organs = [Heart, Heart, Brain, Spleen, Spleen, Kidney]

ids :: [Int]
ids = [2, 7, 13, 14, 21, 24]

organPairs :: [(Int, Organ)]
organPairs = zip ids organs

organCatalog :: Map.Map Int Organ
organCatalog = Map.fromList organPairs

organCount :: [Organ] -> Organ -> Int
organCount organs organ = length (filter (\o -> o == organ) organs)

organCounts :: [Int]
organCounts = map (organCount organs) organs

organCountPairs :: [(Organ, Int)]
organCountPairs = zip organs organCounts

organInventory :: Map.Map Organ Int
organInventory = Map.fromList organCountPairs
