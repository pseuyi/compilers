myDrop n (x:xs) = myDrop (n - 1) xs
myDrop 0 list = list

myLength [] = 0
myLength (x:xs) = 1 + myLength xs
