data SixSidedDie
  = S1
  | S2
  | S3
  | S4
  | S5
  | S6

instance Show SixSidedDie where
  show S1 = "1"
  show S2 = "2"
  show S3 = "3"
  show S4 = "4"
  show S5 = "5"
  show S6 = "6"

instance Eq SixSidedDie where
  (==) S6 S6 = True
  (==) S5 S5 = True
  (==) S4 S4 = True
  (==) S3 S3 = True
  (==) S2 S2 = True
  (==) S1 S1 = True
  (==) _ _ = False

{-
compare S4 S4 = EQ
compare S4 _ = GT
compare _ S4 = LT
-}
-- data SixSidedDie ... deriving (Eq, Ord)
newtype Name =
  Name (String, String)
  deriving (Show, Eq)
