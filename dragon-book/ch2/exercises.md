## 2.2

2.2.1 

a)b)

        S
        | \
    S   S  *
    |   |
  S S + a
  / | 
 a  a     

aa+a\*

c) postfix notation adder/multiplier

2.2.2

a) zeroes followed by ones
S -> 0^n S 1^n

b) prefix notation adder/subtracter

c) lang w endless parenthetical nesting

d) any strings consisting of at least one a and b, starting with a or b

e) ? 

2.2.3

c) and d) are ambiguous. maybe e)?

2.2.4

a)
e:
 ee+
 ee-
 ee\*
 ee/
 e
 int

b)
%left ','
e:
 e , e
 e
 id

c)
%right ','
e: 
 e , e
 e
 id

d)
e:
 e + e
 e - e
 e * e
 e / e
 e
 int

!e)
e:
 e + e
 e - e
 e * e
 e / e
 +e
 -e
 e
 int

2.2.5

a) string must end with 11 110 1001 10010 (3,6,9,18)

  11011 (27)
   / \
 num num
  |\   |
num 0  11
  |
 11    

b) yes

2.2.6

## 2.3

2.3.1

 9-5+2 --> -95+2 -> +-952

 e:
  {print('+')} e + e
  |
  {print('-')} e - e
  |
  {print(int)} int

2.3.2

  95-2\*
  952\*-

 e:
  e e -
  e e *
  
2.3.3
 t:
  0 error
  1 {print(I)}
  2 {print(II)}
  3 {print(III)}
  4 {print(IV)}
  5 {print(V)}
  6 {print(VI)}
  7 {print(VII)}
  8 {print(VIII)}
  9 {print(IX)}
  10{print(X)}




! 2.3.4
2.3.5

2.4.1

a) 

S = () => {
  switch(i) {
    case +: 
      match(+)
      S() 
      S()
      break;
    case -:
      match(-) 
      S() 
      S()
      break;
    case a:
      match(a)
      break;
    default:
     throw new Error('syntax');
  }
} 

b)

S = () => {
  switch(i) {
    case '(': 
      match('(')
      S()
      match(')')
      break;
    case '': 
      match('')
      break;
    default:
      // throw new Error('syntax')
      S();
  }
}

c)

S = () => {
  switch(i) {
    case 0:
      break;
    case 1: 
      break;
  }
}


