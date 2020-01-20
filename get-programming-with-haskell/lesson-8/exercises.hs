mDrop n (x:xs) = myDrop (n - 1) xs

myDrop 0 list = list

myLength [] = 0
myLength (x:xs) = 1 + myLength xs

myReverse [] = []
myReverse [x] = [x]
myReverse (x:xs) = myReverse (xs ++ [x])

fastFib 1 n1 _ = n1
fastFib n n1 n2 = fastFib (n - 1) (n1 + n2) n1
