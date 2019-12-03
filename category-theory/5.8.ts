// 1.
// a terminal object can only have a single morphism pointing to it from any set. this means it can be isomorphic with only one other object

// 2.
// if a & b are both in the poset, then the product is (a, b)

// 3.
// if a & b are both in the poset, then the coproduct is a | b

// 4.
interface L<A> { kind: 'left', A }
interface R<B> { kind: 'right', B }

type Either<A, B> = L<A> | R<B> 

// 5.

const i = (n: number) => n
const j = (b: boolean) => b ? 0 : 1

type norb = Either<number, boolean>

const m = (i, j) => (k: norb) => {
  if(k.kind == 'left') {
    i(k)
  } else if(k.kind == 'right') {
    j(k)
  }
}

// 6.

// 7.

// 8.
