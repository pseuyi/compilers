askForName :: IO ()
askForName = putStrLn "What is your name?"

nameStatement :: String -> String
nameStatement name = "Hello, " ++ name ++ "!"

helloName :: IO ()
helloName =
  askForName >> getLine >>= (\name -> return (nameStatement name)) >>= putStrLn

helloNameDo :: IO ()
helloNameDo = do
  askForName
  name <- getLine
  putStrLn (nameStatement name)

{--
main :: IO ()
main = do
  name <- getLine
  let statement = helloPerson name
  putStrLn statement
--}
main :: IO ()
main =
  getLine >>= (\name -> (\statement -> putStrLn statement) (helloPerson name))

--31.1
echo :: IO ()
echo = getLine >>= putStrLn

echoDo :: IO ()
echoDo = do
  input <- getLine
  putStrLn input
