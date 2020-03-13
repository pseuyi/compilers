{-# LANGUAGE OverloadedStrings #-}

import qualified Data.ByteString as B
import Data.Maybe
import qualified Data.Text as T
import qualified Data.Text.Encoding as E
import qualified Data.Text.IO as TIO

type Author = T.Text

type Title = T.Text

data Book =
  Book
    { author :: Author
    , title :: Title
    }
  deriving (Show)

type Html = T.Text

bookToHtml :: Book -> Html
bookToHtml book = mconcat ["<p>\n", titleInTags, authorInTags, "</p>\n"]
  where
    titleInTags = mconcat ["<strong>", (title book), "</strong>\n"]
    authorInTags = mconcat ["<em>", (author book), "</em>\n"]

book1 :: Book
book1 =
  Book
    { title = "The Conspiracy Against the Human Race"
    , author = "Ligotti, Thomas"
    }

book2 :: Book
book2 = Book {title = "A Short History of Decay", author = "Cioran, Emil"}

book3 :: Book
book3 = Book {title = "The Tears of Eros", author = "Bataille, Georges"}

myBooks :: [Book]
myBooks = [book1, book2, book3]

booksToHtml :: [Book] -> Html
booksToHtml books =
  mconcat
    [ "<html>\n"
    , "<head><title>books</title>"
    , "<meta charset='utf-8'/>"
    , "</head>\n"
    , "<body>\n"
    , booksHtml
    , "\n</body>\n"
    , "</html>"
    ]
  where
    booksHtml = mconcat (map bookToHtml books)

type MarcLeaderRaw = B.ByteString

leaderLength :: Int
leaderLength = 24

type MarcDirectoryRaw = B.ByteString

type MarcRecordRaw = B.ByteString

type MarcDirectoryEntryRaw = B.ByteString

dirEntryLength :: Int
dirEntryLength = 12

data FieldMetadata =
  FieldMetadata
    { tag :: T.Text
    , fieldLength :: Int
    , fieldStart :: Int
    }
  deriving (Show)

type FieldText = T.Text

getLeader :: MarcRecordRaw -> MarcLeaderRaw
getLeader record = B.take leaderLength record

rawToInt :: B.ByteString -> Int
rawToInt = (read . T.unpack . E.decodeUtf8)

-- recprd length is first 5 bytes of leader
getRecordLength :: MarcLeaderRaw -> Int
getRecordLength leader = rawToInt (B.take 5 leader)

-- takes the next record off the file stream
nextAndRest :: B.ByteString -> (MarcRecordRaw, B.ByteString)
nextAndRest marcStream = B.splitAt recordLength marcStream
  where
    recordLength = getRecordLength marcStream

allRecords :: B.ByteString -> [MarcRecordRaw]
allRecords marcStream =
  if marcStream == B.empty
    then []
    else next : allRecords rest
  where
    (next, rest) = nextAndRest marcStream

-- this is the address for where the record starts
getBaseAddress :: MarcLeaderRaw -> Int
getBaseAddress leader = rawToInt (B.take 5 remainder)
  where
    remainder = B.drop 12 leader

getDirectoryLength :: MarcLeaderRaw -> Int
getDirectoryLength leader = getBaseAddress leader - (leaderLength + 1)

getDirectory :: MarcRecordRaw -> MarcDirectoryRaw
getDirectory record = B.take directoryLength afterLeader
  where
    directoryLength = getDirectoryLength record
    afterLeader = B.drop leaderLength record

-- split up the directory into entries
splitDirectory :: MarcDirectoryRaw -> [MarcDirectoryEntryRaw]
splitDirectory directory =
  if directory == B.empty
    then []
    else nextEntry : splitDirectory restEntries
  where
    (nextEntry, restEntries) = B.splitAt dirEntryLength directory

makeFieldMetadata :: MarcDirectoryEntryRaw -> FieldMetadata
makeFieldMetadata entry = FieldMetadata textTag length start
  where
    (rawTag, rest) = B.splitAt 3 entry
    textTag = E.decodeUtf8 rawTag
    (rawLength, rawStart) = B.splitAt 4 rest
    length = rawToInt rawLength
    start = rawToInt rawStart

getFieldMetadata :: [MarcDirectoryEntryRaw] -> [FieldMetadata]
getFieldMetadata rawEntries = map makeFieldMetadata rawEntries

getTextField :: MarcRecordRaw -> FieldMetadata -> FieldText
getTextField record fieldMetadata = E.decodeUtf8 byteStringValue
  where
    recordLength = getRecordLength record
    baseAddress = getBaseAddress record
    baseRecord = B.drop baseAddress record
    baseAtEntry = B.drop (fieldStart fieldMetadata) baseRecord
    byteStringValue = B.take (fieldLength fieldMetadata) baseAtEntry

-- subfield delimiter
fieldDelimiter :: Char
fieldDelimiter = toEnum 31

-- getting title and author
titleTag :: T.Text
titleTag = "245"

titleSubfield :: Char
titleSubfield = 'a'

authorTag :: T.Text
authorTag = "100"

authorSubfield :: Char
authorSubfield = 'a

lookupFieldMetadata :: T.Text -> MarcRecordRaw -> Maybe FieldMetadata
lookupFieldMetadata tgtTag record =
  if length results < 1
    then Nothing
    else Just (head results)
  where
    metadata = (getFieldMetadata . splitDirectory . getDirectory) record
    results = filter ((== tgtTag) . tag) metadata

lookupSubfield :: (Maybe FieldMetadata) -> Char -> MarcRecordRaw -> Maybe T.Text
lookupSubfield Nothing subfield record = Nothing
lookupSubfield (Just fieldMetadata) subfield record =
  if results == Nothing
    then []
    else Just ((T.drop 1 . head) results)
  where
    rawField = getTextField record fieldMetadata
    subfields = T.split (== fieldDelimiter) rawField
    results = filter ((== subfield) . T.head) subfields

lookupValue :: T.Text -> Char -> MarcRecordRaw -> Maybe T.Text
lookupValue aTag subfield record = lookupSubfield entryMetadata subfield record
  where
    entryMetadata = lookupFieldMetadata aTag record

lookupTitle :: MarcRecordRaw -> Maybe Title
lookupTitle = lookupValue titleTag titleSubfield

lookupAuthor :: MarcRecordRaw -> Maybe Author
lookupAuthor = lookupValue authorTag authorSubfield

{-- convert sample data to html
main :: IO ()
main = do
  let text = booksToHtml myBooks
  putStrLn (T.unpack text)
  TIO.writeFile "books.html" text
--}
main :: IO ()
main = do
  marcStream <- B.readFile "sample.mrc"
  let records = allRecords marcStream
  putStrLn ((show . length) records)
