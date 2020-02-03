data AuthorName =
  AuthorName
    { first :: String
    , last :: String
    }

-- 16.2
-- data SportsCar = SportsCar Car Spoiler
-- 16.3
data Creator
  = AuthorCreator Author
  | ArtistCreator Artist

data Author =
  Author Name

data Artist
  = Person Name
  | Band String

type FirstName = String

type LastName = String

type MiddleName = String

data Name
  = Name FirstName LastName
  | NameWithMiddle FirstName MiddleName LastName
  | TwoInitialsWithLast Char Char LastName

data Book =
  Book
    { author :: Creator
    , isbn :: String
    , bookTitle :: String
    , bookYear :: Int
    , bookPrice :: Double
    }

data VinylRecord =
  VinylRecord
    { artist :: Creator
    , recordTitle :: String
    , recordYear :: Int
    , recordPrice :: Double
    }

data CollectibleToy =
  CollectibleToy
    { name :: String
    , descrption :: String
    , toyPrice :: Double
    }

data Pamphlet =
  Pamphlet
    { pamphletTitle :: String
    , pamphletDescription :: String
    , pamphletConatct :: Creator
    }

data StoreItem
  = BookItem Book
  | RecordItem VinylRecord
  | ToyItem CollectibleToy
  | PamphletItem Pamphlet

price :: StoreItem -> Double
price (BookItem book) = bookPrice book
price (RecordItem record) = recordPrice record
price (ToyItem toy) = toyPrice toy
price (PamphletItem pamphlet) = 0.0
  {-
madeBy :: StoreItem -> String
madeBy (BookItem book) = show (author book)
madeBy (RecordItem record) = show (artist record)
madeBy (ToyItem toy) = "collectible toy"
madeBy _ = "no creator"
-}

-- q16.2
type Height = Double

type Width = Double

data Shape
  = Circle Double
  | Square Height
  | Rectangle Height Width

perimeter :: Shape -> Double
perimeter (Square height) = 4 * (height)
perimeter (Rectangle height width) = 2 * height + 2 * width
perimeter (Circle radius) = 2 * pi * radius

area :: Shape -> Double
area (Square height) = 2 * height
area (Rectangle height width) = height * width
area (Circle radius) = pi * radius ^ 2
