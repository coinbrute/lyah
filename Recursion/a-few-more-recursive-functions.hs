-- This file will be to go through recursion practice
-- Remember to think about pattern matching
    -- edge case recognition
    -- pattern deconstruction
    -- how to utilize the function within itself

-- implement a replicate function 
    -- it should input an Int and some element
    -- it should output a list 
        -- this list should have n repititions of k element
repl :: Int -> a -> [a]
repl n x
    | n <= 0    = []
    | otherwise = x:repl (n-1) x

-- it makes more sense to use gaurds here since we are testing a boolean condition


-- implement a take function
    -- this should take n elements from the front of a list
    -- it will receive a value to take and a list to take from
    -- it will output a list
take' :: Int -> [a] -> [a]
take' n _
    | n <= 0   = []
take' _ []     = []
take' n (x:xs) = x:take' (n-1) xs

-- in the first pattern we check for n to be <= 0 
    -- if so return an empty list
-- in the second we check for an empty list being passed
    -- if so return an empty list
-- otherwise we take the first element
    -- then call the function over again using n-1 and the remainder

{-
    take 3 [4,3,2,1] = 4:(take 2 [3,2,1])
    so...
    take 3 [4,3,2,1] = 4:(3:(take 1 [2,1]))
    soo...
    take 3 [4,3,2,1] = 4:(3:(2:(take 0 [1])))
    sooo...
    take 3 [4,3,2,1] = 4:(3:(2:([])))
    soooo...
    take 3 [4,3,2,1] = 4:3:2:[] = [4,3,2]
-}

-- implement a reverse function recursively
    -- should take a list and return a list
    -- edge case 1: empty list being passed in
    -- list of length 1 output the list
    -- otherwise take the last and call function on rest
revLst :: [a] -> [a]
revLst []     = []
revLst (x:xs) = revLst xs ++ [x]

{-
    revLst [1,2,3,4] = revLst [2,3,4] ++ [1]
    so...
    revLst [1,2,3,4] = (revLst [3,4] ++ [2]) ++ [1]
    soo...
    revLst [1,2,3,4] = ((revLst [4] ++ [3]) ++ [2]) ++ [1]
    sooo...
    revLst [1,2,3,4] = (((revLst [] ++ [4]) ++ [3]) ++ [2]) ++ [1]
    soooo...
    revLst [1,2,3,4] = ((([] ++ [4]) ++ [3]) ++ [2]) ++ [1]
    sooooo...
    revLst [1,2,3,4] = [] ++ [4] ++ [3] ++ [2] ++ [1] = [4,3,2,1]
-}

-- haskell supporting infinite lists allows for us to not need an edge condition in all scenarios
-- however without one the program will keep running until memory runs out or it will produce an infinite data structure
-- we can cut lists like this wherever we need them though

-- write a repeat function 
    -- it should take an element and return an infinite list with just that element

rpt :: a -> [a]
rpt x = x:rpt x 
-- as seen this will go on forever unless given another function outside to stop its running off

-- zip is a useful function that will take two lists and create tuple pairs from the elements within
zip' :: [a] -> [b] -> [(a,b)]
zip' _ []          = []
zip' [] _          = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys
-- first two cases suggest that one of the supplied lists is empty
    -- in this case return an empty list
-- else take the first two elements of each list and create a tuple pair
    -- from their recursively call zip' on the remainder of each list

-- we can do recursion as well to check if an element exists in a list
    -- this function should take a list and an element to check for 
    -- it should output a boolean
    -- because we will be checking for equality within this function the element and elements of the list need to be of typeclass (Eq)
elem' :: (Eq a) => a -> [a] -> Bool 
elem' a []      = False -- empty list passed in obviously not in it
elem' a (x:xs) -- use guards here to check conditions
    | a == x    = True -- we found the elem
    | otherwise = a `elem'` xs -- using infix to make it more readable "otherwise check is a an elem of xs"


