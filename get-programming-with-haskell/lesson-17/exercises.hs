import Data.Semigroup

--17.1
myAny :: (a -> Bool) -> [a] -> Bool
myAny testFn = foldr (||) False . map testFn
--17.2
--(/) can return a non Int as a result so it cannot be a semigroup
--17.3
--(+) addition on Integers is associative
--17.4
--the mempty value would be 1
