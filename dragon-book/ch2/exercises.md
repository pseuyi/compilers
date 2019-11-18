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


