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
robot (name, attack, hp) = \msg -> msg (name, attack, hp)

name (n, _, _) = n

attack (_, a, _) = a

hp (_, _, hp) = hp

getName r = r name

getAttack r = r attack

getHP r = r hp

setName r newName = r (\(n, a, h) -> r (newName, a, h))

setAttack r newAttack = r (\(n, a, h) -> r (n, newAttack, h))

setHP r newHP = r (\(n, a, h) -> r (n, a, newHP))

printRobot r =
  r (\(n, a, h) -> n ++ " attack:" ++ (show a) ++ " hp:" ++ (show h))

damage r atk = r (\(n, a, h) -> r (n, a, h - atk))

fight attacker defender = damage defender attack
  where
    attack =
      if getHP attacker > 10
        then getAttack attacker
        else 0
