-- q2.1 an if statement does not return a value, a function must always return a value
-- q2.2
inc n = n + 1

double n = n * 2

square n = n ^ 2

--q2.3
weirdFun n =
  if even n
    then n - 2
    else 3 * n + 1
