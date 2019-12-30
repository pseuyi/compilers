// 1.
function id<T>(a:T):T { return a; }

// 2.
const compose = (f, g) => (x) => g(f(x)) 

// 3.

const add3 = (x) => x + 3
const add2 = (x) => x + 2
const add5 = (x) => x + 5

compose(add2, add3)(1) == add5(1)

// 4.
/*
 *identity - links can go to the same page they are on
 *composability - links can be composed to go to the same place
 *associative - one could follow links in any order if the next page has the following links
 */

// 5.
/*
 *facebook is not a category
 *identity - not sure if one can be one's own friend
 *composability - friendships can't be composed
 *associative - i think this is true?
 */

// 6.
// a directed graph could be catetgory but ea node needs an arrow pointing to itself
