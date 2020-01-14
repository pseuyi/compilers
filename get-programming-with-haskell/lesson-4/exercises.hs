-- ifEvenThenX
ifEven f n =
  if even n
    then f n
    else n

ifEvenCube n = ifEven (\n -> n ^ 3) n

-- sortBy
compaireLastNames a b =
  if lasta > lastb
    then GT
    else if lasta < lastb
           then LT
           else if firsta > firstb
                  then GT
                  else if firsta < firstb
                         then LT
                         else EQ
  where
    lasta = snd a
    lastb = snd b
    firsta = fst a
    firstb = fst b
