import qualified Data.Text.Lazy as T
import qualified Data.Text.Lazy.IO as TIO
import System.Environment
import System.IO

main :: IO ()
main = do
  args <- getArgs
  let fileName = head args
  contents <- TIO.readFile fileName
  TIO.writeFile fileName (T.toUpper contents)
