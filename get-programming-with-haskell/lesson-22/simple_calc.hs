input :: String
input = "2+2"

evaluate :: [String] -> Int
evaluate [e:'+':es] = read [e] + read es
evaluate [e:'*':es] = read [e] * read es

main :: IO ()
main = do
  equation <- getContents
  let solution = evaluate (lines equation)
  print solution
