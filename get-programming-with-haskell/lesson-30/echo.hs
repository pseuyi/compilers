import System.IO

echo :: IO ()
echo = getLine >>= putStrLn

main :: IO ()
main = echo

echoVerbose :: IO ()
echoVerbose =
  putStrLn "Enter a String an we'll echo it!" >> getLine >>= putStrLn
