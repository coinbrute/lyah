import Control.Monad 
-- when basicaclly is a control flow
-- it takes a boolean conditional and an IO action. 
 -- if the boolean is true it returns the same IO action if its false it returns ()
main = do
 c <- getChar 
 when (c /= ' ') $ do
   putChar c 
   main