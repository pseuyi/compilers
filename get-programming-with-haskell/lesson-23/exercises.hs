{-# LANGUAGE OverloadedStrings #-}

-- w/ language pragma ^ above
import qualified Data.Text as T

firstWord :: String
firstWord = "pessimism"

secondWord :: T.Text
secondWord = T.pack firstWord

thirdWord :: String
thirdWord = T.unpack secondWord

fourthWord :: T.Text
fourthWord = T.pack thirdWord

aWord :: T.Text
aWord = "Cheese"

main :: IO ()
main = do
  print aWord

-- 23.2
-- {-# LANGUAGE TemplateHaskell #-}
-- 23.3
sampleInput :: T.Text
sampleInput = "this\nis\ninput"

myTLines :: T.Text -> [T.Text]
myTLines t = T.splitOn break t
  where
    break = "\n"

myTUnlines :: [T.Text] -> T.Text
myTUnlines t = T.intercalate break t
  where
    break = "\n"
