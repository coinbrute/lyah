--this 
{-
main = do  
    a <- getLine  
    b <- getLine  
    c <- getLine  
    print [a,b,c] 
-}

-- is the same as this
main = do 
 rs <- sequence [getLine, getLine, getLine]
 print rs

-- a common patter to use with sequence is mapping functions like print or putstrln over lists 
{-
ghci> sequence (map print [1,2,3,4,5])  
1  
2  
3  
4  
5  
[(),(),(),(),()] 
-}

-- mapM keeps the resulting IO function
-- mapM_ throws out the resulting IO function output

