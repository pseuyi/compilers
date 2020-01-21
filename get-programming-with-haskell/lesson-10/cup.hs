-- 10.1
cup f10z = \message -> message f10z

getOz aCup = aCup (\oz -> oz)

drink c oz =
  if ozDiff >= 0
    then c ozDiff
    else c 0
  where
    cOz = getOz c
    ozDiff = cOz - oz

isEmpty c = getOz c == 0
-- 10.2
