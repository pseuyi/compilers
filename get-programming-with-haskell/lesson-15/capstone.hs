data FourLetterAlphabet
  = L1
  | L2
  | L3
  | L4
  deriving (Show, Enum, Bounded)

rotN :: (Bounded a, Enum a) => Int -> a -> a
rotN n c = toEnum rotation
  where
    halfAlphabet = n `div` 2
    offset = fromEnum c + halfAlphabet
    rotation = offset `mod` n

fourLetterAlphabetEncoder :: [FourLetterAlphabet] -> [FourLetterAlphabet]
fourLetterEncoder vals = map rot 41 vals
  where
    alphaSize = 1 + fromEnum (maxBound :: FourLetterAlphabet)
    rot41 = rotN alphaSize

-- decoder for odd-numbered alphabets
rotNdecoder :: (Bounded a, Enum a) => Int -> a -> a
rotNdecoder n c = toEnum rotation
  where
    halfN = n `div` 2
    offset =
      if even n
        then from Enum c + halfN
        else 1 + fromEnum c + halfN
    rotation = offset `mod` n
