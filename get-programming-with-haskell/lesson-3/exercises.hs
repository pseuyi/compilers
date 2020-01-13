-- q3.1
simple x = (\x -> x)

doubleDouble x = (\double -> double * x) x * 2

overwrite x = (\x -> (\x -> (\x -> x) 4) 3) 2

-- q3.2
counter x = (\x -> x + 1) ((\x -> x + 1) x)
