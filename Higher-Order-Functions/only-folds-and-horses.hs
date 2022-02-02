-- with recursion there is a theme
    -- have an edge case for the empty list or argument
    -- then introduce the x:xs pattern 
        -- do some action that involves a single element and the rest of the list

-- this is a very common pattern 
    -- for this Haskell provides folds functions 
    -- they work similar to map only they reduce the list to some single value
        -- instead of producing a new list like map

-- a fold function takes
    -- a BINARY FUNCTION
    -- a starting value (the accumulator)
    -- a list to fold up

-- the BINARY FUNCTION takes two parameters
    -- it is called with the accumulator and the first or last element 
    -- it produces a new accumulator

-- then the binary function is called again using the new accumulator and the now new first/last element
-- so on and so forth

-- after the entire list is traversed only the accumulator remains

-- lets look at (foldl) first
    -- it folds the list from the left side
    -- the binary function is appied to the starting value and the head of list
    -- this creates the new accumulator
    -- the binary function is then called with that value and the next element
    -- so on and so forth
-- here is sum using fold
sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs 
-- 0 + 3
-- [3,5,2,1]
--
-- 3 + 5
-- [5,2,1]
--
-- 8 + 2
-- [2,1]
--
-- 10 + 1
-- [1]
--
-- 11

-- closer inspection:
    -- (\acc x -> acc + x) is the binary function 
    -- 0 is the starting value supplied 
    -- xs is the list to be folded 
    -- 0 is used as the (acc) parameter bound to the binary function at the start
    -- 3 is used as the (x) parameter bound to the binary function 
    -- add up 0 + 3 and that becomes the new accumulator

-- because the list is curried we can write the function shorter like so
sum'' :: (Num a) => [a] -> a 
sum'' = foldl (+) 0
-- the lambda (\acc x -> acc + x) is the same as (+) 
-- we can omit the xs parameter because calling foldl (+) 0 will return a function that takes a list

-- generally speaking if there is a function foo a = bar b a
    -- you can write it as foo = bar b
    -- this is thanks to currying


