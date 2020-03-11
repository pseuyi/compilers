import System.IO

--24.1
--openFile :: FilePath -> IOMode -> IO Handle
--myFile <- openFile "stuff.txt" ReadMode
--24.2
main :: IO ()
main = do
  helloFile <- openFile "hello.txt" ReadMode
  hasLine <- hIsEof helloFile
  firstLine <-
    if not hasLine
      then hGetLine helloFile
      else return "empty"
  putStrLn firstLine
  hasSecondLine <- hIsEof helloFile
  secondLine <-
    if not hasSecondLine
      then hGetLine helloFile
      else return ""
  goodbyeFile <- openFile "goodbye.txt" WriteMode
  hPutStrLn goodbyeFile secondLine
  hClose helloFile
  hClose goodbyeFile
  putStrLn "done!"
