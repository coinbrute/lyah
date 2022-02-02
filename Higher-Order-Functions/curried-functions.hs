-- so heres the deal..
-- all those functions that took multiple parameters
    -- spoiler they didn't

-- EVERY FUNCTION IN HASKELL OFFICIALLY TAKES ONE PARAMETER

-- but wait how are we defining things like (zip) or (max) and all that stuff
-- CURRIED FUNCTIONS is the answer.
    -- all fucntion that accept >1 parameter so far have been CURRIED FUNCTIONS

-- take a look at (max)
    -- max at first glance looks to accept 2 parameters and return the bigger one
-- However, 
    -- calling max 4 5 actually
    -- creates a function that takes one parameter and returns either 4 or that parameter
        -- whichever is bigger
    -- then 5 is applied to that function and that function produces the final output
-- so these are the same
    -- max 4 5
    -- (max 4) 5
-- putting that space there is just FUNCTION APPLICATION
    -- and that has the highest precedence.
-- looking at the type signature for (max)
    -- these two versions are the same
        -- max :: (Ord a) -> a -> a -> a
        -- max :: (Ord a) -> a -> (a -> a)
    -- this could be read as 
        -- "max takes an a and returns a function that takes an a and returns an a"

-- cool so wtf do I do with this little tidbit
    -- if we call a function with not enough params we get back a PARTIALLY APPLIED function
        -- this means a function that accepts an many parameters as we left out
    -- Using partial application is a way to create functions on the fly to pass them to another function

-- example time
mult3Nums :: (Num a) => a -> a -> a -> a
mult3Nums x y z = x * y * z
-- yes this function will multiply 3 numbers but let's look at what is actually going on
    -- mult3Nums 3 5 9 and ((mult3Nums 3) 5) 9 are the same
    -- first 3 is applied to mult3Nums since FUNCTION APPLICATION dictates it so
        -- this is because they are separated by a space
    -- that will create a function that takes one paramter and returns a function
    -- then 5 is applied to that which creates a function 
        -- this function takes a parameter and multiplies by 15 or 3*5
    -- 9 is then applied to that function 
    -- this function type definition can also be written as
        -- mult3Nums :: (Num a) -> a -> (a -> (a -> a))
        -- the type before the (->) is the paramter given to the function
        -- the type after the (->) is what it returns
-- so mult3Nums takes an (a) and returns a function of type (Num a) => a -> (a -> a)
    -- then this function (Num a) => a -> (a -> a)
        -- takes an (a) and returns a function of type (Num a) => a -> a
    -- then this function finally takes an (a) and returns an (a)
{-
    ghci> let multTwoWithNine = mult3Nums 9  
    ghci> multTwoWithNine 2 3  
    54  
    ghci> let multWithEighteen = multTwoWithNine 2  
    ghci> multWithEighteen 10  
    180  
-}

-- by calling a function with too few parameters you are making new functions

-- take a comparison function
compareWith100 :: (Num a, Ord a) => a -> Ordering
compareWith100 x = compare 100 x
-- called with a number less than 100 it will return GT since 100 is > something less than 100
-- since the x is on the right side of both the compareWith100 and compare functions it can be simplified and rewritten
compare100 :: (Num a, Ord a) => a -> Ordering
compare100 = compare 100
-- okay whoa what happened
    -- the type declaration stays the same since (compare 100) returns a function
        -- compare has a type declaration of (Ord a) => a -> (a -> Ordering)
        -- and calling it with (100) returns a (Num a, Ord a) => a -> Ordering
        -- because we use 100 the extra constraint is there for (Num a)

-- infix functions can also be partially applied by using SECTIONS
    -- to section an infix function 
        -- surround it with ()
        -- only supply a paramter to one side
    -- this will create a function that takes one parameter
        -- and applies it to the side that is missing the operand
divideBy10 :: (Floating a) => a -> a
divideBy10 = (/10)
-- this way calling divideBy10 200 is the same as doing 200 / 10 or (/10) 200

-- character example with infix function
isUpperAlpha :: Char -> Bool
isUpperAlpha = (`elem` ['A'..'Z'])

-- one thing to note with sections is the use of (-)
    -- from the section definition
        -- (-4) would result in a function that takes a number and subtracts 4 from it
            -- however for convenience (-4) means negative 4
        -- so if you want to make a function that subtracts 4 partially apply (subtract)
            -- so (subtract 4) instead of (-4)

-- how about how ghci handles partial application of functions
    -- inputting mult3Nums 3 4 into ghci instead of binding to a name with let or passing another function
    {-
        <interactive>:4:1: error:
        * No instance for (Show (Integer -> Integer))
            arising from a use of `print'
            (maybe you haven't applied a function to enough arguments?)
        * In a stmt of an interactive GHCi command: print it
    -}
    -- ghci is telling us that the expression produced a function for type (Integer -> Integer)
        -- however it doesn't know how to print it to screen
        -- this is because functions are not instances of Show typeclass
        -- when we say 1 + 1 ghci calcs it to 2 then calls show 2 to print to screen
            -- this is because show gets the string version of the type input
    