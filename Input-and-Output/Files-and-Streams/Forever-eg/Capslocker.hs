import Data.Char

-- read in the contents of a file and print them back out in uppercase
main = do
 contents <- getContents
 putStr (map toUpper contents)