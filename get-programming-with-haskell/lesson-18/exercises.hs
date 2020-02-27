wrap :: a -> Box a
wrap x = Box x
-- 18.1
-- wrap (Box 'a') :: Box (Box char)
-- 18.2
-- transform takes an identity (a -> a), map takes (a -> b)
