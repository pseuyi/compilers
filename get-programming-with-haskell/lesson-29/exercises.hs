--29.1
maybeHello = Just "hello"

maybeWorld = Just "world"

res = (++) <$> maybeHello <*> maybeWorld

--29.2
answer :: IO string
answer = pure "hello world"
--29.3
--there is a type mismatch:w
