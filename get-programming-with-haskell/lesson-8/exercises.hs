myDrop n (x:xs) = myDrop (n - 1) xs
myDrop 0 list = list

myLength [] = 0
myLength (x:xs) = 1 + myLength xs

reverse [] = []
reverse [x] = [x]
reverse (x:xs) = reverse xs ++ x

fastFib n1 _ 0 = n1
fastFib n1 n2 counter = fastFib (n1 + n2) n1 counter
