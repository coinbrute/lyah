-- similar to mapM only it has parameters switched around.
 -- so the first parameter is the list and the second is the function to map over the list with. 
import Control.Monad

main = forever $ do
 colors <- forM [1,2,3,4] (\a -> do
  putStrLn $ "Which color do you associate with the number " ++ show a ++ "?"
  getLine)
 putStrLn "The colors that you associate with 1, 2, 3 and 4 are: "
 mapM putStrLn colors