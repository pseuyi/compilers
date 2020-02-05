--17.1
myAny :: (a -> Bool) -> [a] -> Bool
myAny testFn = (foldl (||) False) . map testFn
