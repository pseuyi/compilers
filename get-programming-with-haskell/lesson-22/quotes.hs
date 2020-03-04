quotes :: [String]
quotes =
  [ "I don't know why people expect art to make sense. They accept the fact that life doesn't make sense."
  , "The more unknowable the mystery, the more beautiful it is."
  , "The world is as you are."
  , "We only dream of images we already have inside of us."
  , "I like things that go into hidden, mysterious places, places I want to explore that are very disturbing. In that disturbing thing, there is sometimes tremendous poetry and truth."
  ]

findQuote :: [String] -> [String]
findQuote [] = []
findQuote ("n":xs) = []
findQuote (x:xs) = quote : (findQuote xs)
  where
    quote = quotes !! (read x - 1)

main :: IO ()
main = do
  print "select a number between 1 and 5"
  input <- getContents
  mapM_ print (findQuote (lines input))
