// construct a kleisli category for partial functions

/* 
partial fns
const root = (x) = Math.sqrt(x)
const reciprocal = (x) => 1/x

const compose = (f, g) => {
  return (x) => {
    g(f(x))    
  }
}
*/

interface Optional<A> {
  value?: A;
  isValid: boolean;
}

// embelished fns
const safeRoot = (x: number): Optional<number> =>
  x < 0
    ? {value: undefined, isValid: false}
    : {value: Math.sqrt(x), isValid: true};

const safeReciprocal = (x: number): Optional<number> =>
  x <= 0 ? {value: undefined, isValid: false} : {value: 1 / x, isValid: true};

const compose = (f, g) => {
  return x => {
    const {value, isValid} = f(x);
    return isValid ? g(value) : undefined;
  };
};
