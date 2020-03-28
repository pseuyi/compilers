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
i

echo = getLine >>= putStrLn

echoDo :: IO ()
echoDo = do
  input <- getLine
  putStrLn input

--31.2
data Grade
  = F
  | D
  | C
  | B
  | A
  deriving (Eq, Ord, Enum, Show, Read)

data Degree
  = HS
  | BA
  | MS
  | PhD
  deriving (Eq, Ord, Enum, Show, Read)

data Candidate =
  Candidate
    { candidateId :: Int
    , codeReview :: Grade
    , cultureFit :: Grade
    , education :: Degree
    }
  deriving (Show)

viable :: Candidate -> Bool
viable candidate = all (== True) tests
  where
    passedCoding = codeReview candidate > B
    passedCultureFit = cultureFit candidate > C
    educationMin = education candidate >= MS
    tests = [passedCoding, passedCultureFit, educationMin]

potentialCandidate :: Candidate
potentialCandidate =
  Candidate {candidateId = 1, codeReview = A, cultureFit = A, education = HS}

readInt :: IO Int
readInt = getLine >>= (return . read)

readGrade :: IO Grade
readGrade = getLine >>= (return . read)

readDegree :: IO Degree
readDegree = getLine >>= (return . read)

readCandidate :: IO Candidate
readCandidate = do
  putStrLn "enter id:"
  cId <- readInt
  putStrLn "enter code grade:"
  codeGrade <- readGrade
  putStrLn "enter culture fit grade:"
  cultureGrade <- readGrade
  putStrLn "enter education:"
  degree <- readDegree
  return
    (Candidate
       { candidateId = cId
       , codeReview = codeGrade
       , cultureFit = cultureGrade
       , education = degree
       })

assessCandidateIO :: IO String
assessCandidateIO = do
  candidate <- readCandidate
  let passed = viable candidate
  let statement =
        if passed
          then "passed"
          else "failed"
  return statement

--31.3
readGradeDo :: IO Grade
readGradeDo = do
  input <- getLine
  return (read input)

candidate1 :: Candidate
candidate1 =
  Candidate {candidateId = 1, codeReview = A, cultureFit = A, education = BA}

candidate2 :: Candidate
candidate2 =
  Candidate {candidateId = 2, codeReview = C, cultureFit = A, education = PhD}

candidate3 :: Candidate
candidate3 =
  Candidate {candidateId = 3, codeReview = A, cultureFit = B, education = MS}

candidateDB :: Map.Map Int Candidate
candidateDB = Map.fromList [(1, candidate1), (2, candidate2), (3, candidate3)]

assessCandidateMaybe :: Int -> Maybe String
assessCandidateMaybe cId = do
  candidate <- Map.lookup cId candidateDB
  let passed = viable candidate
  let statement =
        if passed
          then "passed"
          else "failed"
  return statement
