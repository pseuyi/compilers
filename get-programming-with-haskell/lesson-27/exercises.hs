--27.1
reverseMaybe :: Maybe String -> Maybe String
reverseMaybe Nothing = Nothing
reverseMaybe (Just str) = Just (reverse str)

incMaybe :: Maybe Int -> Maybe Int
incMaybe (Just n) = Just (n + 1)
incMaybe Nothing = Nothing

instance Functor Maybe where
  fmap func (Just n) = Just (func n)
  fmap func Nothing = Nothing

fReverseMaybe :: Maybe String -> Maybe String
fReverseMaybe str = fmap reverse str
