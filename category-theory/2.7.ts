// 1

const memoize = f => {
  const memo = {};
  return n => {
    let value;
    if (memo[n]) {
      value = memo[n];
    } else {
      value = f(n);
      memo[n] = value;
    }
    return value;
  };
};

// 2

const random = n => Math.random() * Math.floor(n)
const memoizedRandom = memoize(random)
// this won't work

// 3
// in js, it does no seem possible to select a seed for Math.random
// it seems like one could implement a random fn that has a memoized seed?

// 4
/*
a) pure
b) impure
c) impure, has side effects
d) pure, given the static var y is scoped to the fn block (not sure this is the case in c++)
*/

// 5
// 4 ways from bool to bool 
const boolId = b => b
const boolToTrue = b => true
const boolToFalse = b => false
const notBool = b => !b

//6
