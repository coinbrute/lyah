-- takes an IO action and returns an IO action that just repeats whatever it got forever.
import Control.Monad
import Data.Char

main = forever $ do
 putStr "Give me some input: "
 l <- getLine 
 putStrLn $ map toUpper l 