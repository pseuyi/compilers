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

-- text encoding stuff
nagarjunaText :: T.Text
nagarjunaText = "नागर्जुनॅ"

nagarjunaB :: B.ByteString
nagarjunaB = (BC.pack . T.unpack) nagarjunaText

nagarjunaSafe :: B.ByteString
nagarjunaSafe = E.encodeUtf8 nagarjunaText
--TIO.putStrLn ((T.pack . BC.unpack) nagarjunaB) won't work
--TIO.putStrLn (E.decodeUtf8 nagarjunaSafe) works
