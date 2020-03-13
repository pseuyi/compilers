{-# LANGUAGE OverloadedStrings #-}

import Control.Monad
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
import System.Environment
import System.IO
import System.Random

main :: IO ()
main = do
  args <- getArgs
  let filename = head args
  image <- BC.readFile filename
  glitched <-
    foldM
      (\bytes func -> func bytes)
      imageFile
      [ randomReplaceByte
      , randomSortSection
      , randomReplaceByte
      , randomSortSection
      , randomReplaceByte
      ]
  let newFile = mconcat ["glitched_", filename]
  BC.writeFile newFile glitched
  print "all done"

intToChar :: Int -> Char
intToChar int = toEnum safeInt
  where
    safeInt = int `mod` 255

-- BC.pack takes a string so wrap Char in List
intToBC :: Int -> BC.ByteString
intToBC int = BC.pack [intToChar int]

replaceByte :: Int -> Int -> BC.ByteString -> BC.ByteString
replaceByte loc charVal bytes = mconcat [before, newChar, after]
  where
    (before, rest) = BC.splitAt loc bytes
    after = BC.drop 1 rest
    newChar = intToBC charVal

randomReplaceByte :: BC.ByteString -> IO BC.ByteString
randomReplaceByte bytes = do
  let bytesLength = BC.length bytes
  location <- randomRIO (1, bytesLength)
  charVal <- randomRIO (0, 255)
  return (replaceByte location charVal bytes)

sortSection :: Int -> Int -> BC.ByteString -> BC.ByteString
sortSection start size bytes = mconcat [before, changed, after]
  where
    (before, rest) = BC.splitAt start bytes
    (target, after) = BC.splitAt size rest
    changed = BC.reverse (BC.sort target)

randomSortSection :: BC.ByteString -> IO BC.ByteString
randomSortSection bytes = do
  let sectionSize = 50
  let bytesLength = BC.length bytes
  start <- randomRIO (0, bytesLength - sectionSize)
  return (sortSection start sectionSize bytes)

--25.3
randomChar :: IO Char
randomChar = do
  randInt <- randomRIO (0, 255)
  return (toEnum randInt)

--25.4
glitchActions :: [BC.ByteString -> IO BC.ByteString]
glitchActions =
  [ randomReplaceByte
  , randomSortSection
  , randomReplaceByte
  , randomSortSection
  , randomReplaceByte
  ]

--q25.2
reverseByte :: Int -> Int -> BC.ByteString -> BC.ByteString
reverseByte start size b = mconcat [before, changed, after]
  where
    (before, rest) = BC.splitAt start bytes
    (target, after) = BC.splitAt size rest
    changed = BC.reverse target

randomReverseBytes :: BC.ByteString -> IO BC.ByteString
randomReverseBytes bytes = do
  let sectionSize = 50
  let bytesLength = BC.length bytes
  start <- randomRIO (1, bytesLength, sectionSize)
  return (reverseByte start sectionSize bytes)
