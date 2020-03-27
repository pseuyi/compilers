import System.IO

echo :: IO ()
echo = getLine >>= putStrLn

main :: IO ()
main = echo
