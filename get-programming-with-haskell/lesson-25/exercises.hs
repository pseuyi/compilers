{-# LANGUAGE OverloadedStrings #-}

import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
  {--
sampleBytes :: B.ByteString
sampleBytes = "Hello!"

sampleString :: String
sampleString = B.unpack sampleBytes
--}

--25.1
bcInt :: BC.ByteString
bcInt = "6"

intFromBc :: BC.ByteString -> Int
intFromBc = read . BC.unpack
