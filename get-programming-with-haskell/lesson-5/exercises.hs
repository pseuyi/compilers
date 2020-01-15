genIfXEven f =
  (\x ->
     if even x
       then f x
       else x)

genApiRequestBuilder hostBuilder apiKey resource =
  (\id -> hostBuilder apiKey resource id)

-- myExampleUrlBuilder = exampleUrlBuilder "1337hAsk3ll" "books"
myExampleUrlBuilder = getRequestUrl "http://example.com" "1337hAsk3ll" "books"

subTract2 = flip (-) 2

-- q5.1
ifEven f n =
  if even n
    then f n
    else n

inc n = n + 1

double n = n + n

square n = n ^ 2

ifEvenInc = ifEven inc

ifEvenDouble = ifEven double

ifEvenSquare = ifEven square

--q5.2
binaryPartialApplication f a = flip f a
