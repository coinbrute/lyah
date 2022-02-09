import Data.Char

-- Data.Char exports functions that deal with characters. 

-- iscontrol checks if a char is a control char

-- isSpace checks if is whitespace

-- isLower checks if is lower cased

-- isUpper checks if is upper cased

-- isAlpha checks if is a letter

-- isAlphaNum checks if is azAZ09

-- isPrint checks if is printable. Control chars are not

-- isDigit checks if is digit

-- isOctDigit checks if is octal digit

-- isHexDigit checks if is hex digit

-- isLetter checks if is letter

-- isMark checks if is Unicode mark chars. These are chars rthat combine with preceding letters to form letters with accents.

-- isNumber checks if is numeric

-- isPunctuation checks if is punctuation

-- isSymbol checks if is a fancy math or currency symbol

-- isSeparator checks if is space or separator

-- isAscii check if falls into first 128 unicode set

-- isLatinl checks if falls into 256 unicode set

-- isAsciiUpper checks if is Ascii uppercase

-- isAsciLower checks if is ascii lowercase

-- GeneralCategory datatype is an enumeration presenting a several categories that a char can fall into. 

-- toUpper converts to uppercase

-- toLower converts to lowercase

-- toTitle converts to Titlecase

-- digitToInt convert to int if is in 09afAF range

-- intToDigit converts if 0-15

-- ord and chr convert to corresponding numbers and vice versa

-- the caesar cipher encodes messages by shifting each character a fixed number of positions in the alphabet. 
encode :: Int -> String -> Stirng
encode shift msg = 
  let ords = map ord msg
      shifted = map (+ shift) ords
  in  map char shifted

decode :: Int -> String -> String 
decode shift msg = encode (negate shfit) msg