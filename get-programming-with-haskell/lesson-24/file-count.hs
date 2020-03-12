import qualified Data.Text.Lazy as T
import qualified Data.Text.Lazy.IO as TIO
import System.Environment
import System.IO

getCounts :: String -> (Int, Int, Int)
getCounts input = (charCount, wordCount, lineCount)
  where
    charCount = length input
    wordCount = (length . words) input
    lineCount = (length . lines) input

countsText :: (Int, Int, Int) -> String
countsText (cc, wc, lc) =
  unwords ["chars: ", show cc, " words: ", show wc, " lines: ", show lc]

{--
readFile :: FilePath -> IO String
readFile name = do
   inputFile <- openFile name ReadMode
   hGetContents inputFile
--}
main :: IO ()
main = do
  args <- getArgs
  let fileName = head args
  --input <- readFile fileName
  file <- openFile fileName ReadMode
  input <- hGetContents file
  let summary = (countsText . getCounts) input
  putStrLn summary
  hClose file
  appendFile "stats.dat" (mconcat [fileName, " ", summary, "\n"])

--24.4
--readFile needs to retturn an IO String that is not yet evaluated
--q24.1
cp :: IO ()
cp = do
  args <- getArgs
  let (fileName:rest) = head args
  let newFile = head rest
  contents <- TIO.readFile fileName
  TIO.appendFile newFile contents
