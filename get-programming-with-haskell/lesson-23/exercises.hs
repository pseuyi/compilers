{-# LANGUAGE OverloadedStrings #-}

-- w/ language pragma ^ above
import qualified Data.Text as Text

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
