-- so cool we know that functions can take functions as parameters
    -- and we know they can also return functions

-- lets demonstrate this by writing a function that takes a function and applies it twice to something
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

-- notice the type declaration
    -- (a -> a) -> a -> a
    -- before we did not require the parentheses but here we do since the first parameter is a function
        -- this first parameter is a function that takes something of type (a)
            -- and returns something of type (a)
        -- the second parameter is something of the same type (a) also
        -- the return value is also of the same type (a)
    -- the first parameter function could be defined as (Int -> Int) or (String -> String)
        -- but because all the types are the same in this instance
            -- that would require all the rest of the types to be that as well
    
-- NOTE: from here out I will refer to functions that take more than one parameter as just that.
    -- for simplicity sake only
    -- Even though yes they are all curried functions taking one parameter 
        -- returning partially applied functions until we reach a function that has a solid value
    -- so (a -> a -> a) takes 2 parameters and returns type (a)

-- back to applyTwice
    -- it just takes a function (f) and some value (x) 
        -- then applies (x) to the function (f)
        -- then applies the result to the function (f)
    {-
        ghci> applyTwice (+3) 10  
        16  
        ghci> applyTwice (++ " HAHA") "HEY"  
        "HEY HAHA HAHA"  
        ghci> applyTwice ("HAHA " ++) "HEY"  
        "HAHA HAHA HEY"  
        ghci> applyTwice (mult3Nums 2 2) 9  
        144  
        ghci> applyTwice (3:) [1]  
        [3,3,1]  
    -}

-- so basically if our function requires us to pass a function in that takes only 1 parameter
    -- we can partially apply a function to the point where it only takes 1 parameter 
    -- then pass it along 


-- here is a useful standard library function that uses this concept
-- zipWith takes a function and two lists as parameters
    -- it joins those lists by applying the passed in function between the elements
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = [] -- return empty list if first list is empty
zipWith' _ _ [] = [] -- return empty list if second list is empty
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys 
-- so let's look under the hood
    -- the first parameter is a function that takes 2 things and creates a third
        -- (a -> b -> c)
            -- they don't have to be of the same type
    -- the second and third parameter are lists 
        -- [a] -> [b]
    -- the output is also a list
        -- -> [c]
    -- the first list has to be a list of [a]'s 
        -- since the parameter function takes [a]'s as it's first argument
    -- the second list has to be of [b]'s 
        -- since the parameter function takes [b]'s as its second argument
    -- the result is a list of type [c]'s 
    -- the parameter function says it will accept an (a -> b -> c) function as a parameter
        -- it also would accept (a -> a -> a) but not the other way. 
-- if you are ever unsure of the type to use 
    -- delete the declaration and type (:t funcName) in ghci
-- the application of this is similar to (zip)
    -- edge conditions check for empty lists and return empty lists
    -- the twist comes with the extra argument called the JOINING FUNCTION
    -- we don't care about the joining function in the edge cases so (_) works there
    -- in the main body we apply the joining function and create the new list from the two supplied
    {-
        ghci> zipWith' (+) [4,2,5,6] [2,6,2,3]  
        [6,8,7,9]  
        ghci> zipWith' max [6,3,2,1] [7,3,1,5]  
        [7,3,2,5]  
        ghci> zipWith' (++) ["foo ", "bar ", "baz "] ["fighters", "hoppers", "aldrin"]  
        ["foo fighters","bar hoppers","baz aldrin"]  
        ghci> zipWith' (*) (replicate 5 2) [1..]  
        [2,4,6,8,10]  
        ghci> zipWith' (zipWith' (*)) [[1,2,3],[3,5,6],[2,3,4]] [[3,2,2],[3,4,5],[5,4,3]]  
        [[3,4,6],[9,20,30],[10,12,12]] 
    -}
-- seen above this can be a versatile approach as it is abstract in its definition

-- lets try this with another function from the standard library
    -- flip' takes a function and returns a function that is like the original
        -- the difference being the first two arguments are flipped
flip' :: (a -> b -> c) -> (b -> a -> c) 
-- see how the return of both functions are the type (c)
    -- but the inputs are flipped (b -> a) and (a -> b)
flip' f = g
    where g x y = f y x 
-- reading the declaration 
    -- we can see that flip' takes one function (a -> b -> c)
        -- this function recieves (a) and (b)
    -- flip' then returns a function (b -> a -> c)
        -- this function recieves (b) and (a)
-- because function are curried the second parentheses are optional as (->) is right associative
    -- (a -> b -> c) -> (b -> a -> c) is the same as 
    -- (a -> b -> c) -> (b -> (a -> c)) is the same as 
    -- (a -> b -> c) -> b -> a -> c
-- since we wrote above that (g x y = f y x) then it should stand that
    -- it should also equal (f y x = g x y)
-- being that that is the case we can simplify it
flip'' :: (a -> b -> c) -> b -> a -> c
flip'' f x y = f y x 
-- here we take advantage of currying 
    -- when (flip'' f) is called without (y) and (x)
    -- it returns an (f) that will take those to (y) and (x) paramters but will call them flipped
{-
ghci> zip [1,2,3,4,5] "hello"
[(1,'h'),(2,'e'),(3,'l'),(4,'l'),(5,'o')]
ghci> zip "hello" [1,2,3,4,5]  
[('h',1),('e',2),('l',3),('l',4),('o',5)]  
ghci> flip' zip [1,2,3,4,5] "hello"  
[('h',1),('e',2),('l',3),('l',4),('o',5)]  

ghci> zipWith div [2,2..] [10,8,6,4,2]
[0,0,0,0,1]
ghci> zipWith div [10,8,6,4,2] [2,2..]
[5,4,3,2,1]
ghci> zipWith (flip' div) [2,2..] [10,8,6,4,2]  
[5,4,3,2,1]  
-}

