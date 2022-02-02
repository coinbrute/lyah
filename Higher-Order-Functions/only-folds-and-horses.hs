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

-- here is another function that uses a left fold (foldl)
    -- (elem) checks if a value is in a list and returns a Bool
elem' :: (Eq a) => a -> [a] -> Bool 
elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys 
-- so this looks a bit more complicated 
-- lets break it down
    -- the starting value and accumulator is a Bool
    -- the type of the accumulator/starting value and the output result type are ALWAYS the same 
        -- this should help give an idea of what to use for the starting value
    -- in this case it makes sense to assume its false i.e (else False)
        -- this would mean we assume it is not there
        -- this would mean if we call foldl on an empty list the result will be the starting value/accumulator
    -- then check the current element to be the element we are looking for
        -- if it is set the accumulator to True

-- lets take a look at (foldr) now
    -- by the name it can be assumed that it folds from the right
    -- foldl's binary function is this (\acc x -> ...)
        -- the accumulator is the first param
        -- the current value is the second param
    -- foldr's binary function is this (\x acc -> ...)
        -- the current value is the first param
        -- the accumulator is the second param
    -- this should be easy to remember since foldr accumulates from the right
        -- the accumulator param should go on the right
    
-- here is the (map) function using the foldr function
    -- map takes a function and a list and outputs a new list after applying the function to the input list
map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs
-- the accumulator here is a list since the output type is a list
-- we accumulate the mapped list element by element
-- the starting value to give the accumulator is an empty list 
{-
    so mapping (+3) to [1,2,3] we start at the right
    map' (+3) [1,2,3] = foldr (\[3] [] -> (+3) [3] : []) [] [1,2]
    accumulator is now 6:[] or [6]
    so...
    map' (+3) [1,2,3] = foldr (\[2] [6] -> (+3) [2] : [6]) [6] [1]
    accumulator is now 5:[6] or [5,6]
    soo...
    map (+3) [1,2,3] = foldr (\[1] [5,6] -> (+3) [1] : [5,6]) [5,6] []
    accumulator is now 4:[5,6] or [4,5,6]
    sooo...
    map (+3) [1,2,3] = foldr (\[] [4,5,6] -> (+3) [] : [4,5,6]) [4,5,6] []
    soooo...
    map (+3) [1,2,3] = []:[4,5,6] = [4,5,6]
-}

-- this can be done with foldl using (++) but the (:) is cheaper and faster for list building
-- here is map with foldl
mapl :: (a -> b) -> [a] -> [b]
mapl f xs = foldl (\acc x -> acc ++ [f x]) [] xs

-- some other points on folds
    -- if you reverse a list you can right fold it, or left fold it
    -- the (sum) function can be implemented the same with a left or right fold
    -- right folds work on infinite lists
        -- left folds DO NOT
        -- if you take a list and fold from the right you get to the beginning of the list
            -- even if its infinite
        -- if you take a list and fold from the left you go towards the end
            -- an infinite list has no end
    -- folds can be used to define ANY function where you 
        -- walk a list once 
        -- hit every element
        -- return something based on that
    
-- there are two other versions of fold
    -- foldl1 and foldr1
        -- these functions work similar to their counterparts with one key difference
        -- they do not need an explicit starting value
        -- instead they assume the first or last element of the list is the starting value
            -- then start folding with the next element
-- so sum could be simplified to 
sumFoldl1 :: (Num a) => [a] -> a
sumFoldl1 = foldl1 (+)
-- NOTE: because foldl1 and foldr1 assume a non-empty list they throw runtime errors when given []
-- in this line of thinking if the function makes no sense to be given an empty list then you should probably use foldl1 or foldr1
-- here are some other standard library functions using foldl1/foldl foldr1/foldr
maximum' :: (Ord a) => [a] -> a 
maximum' = foldr1 (\x acc -> if x > acc then x else acc)
-- here we take the accumulator and check x against it. 
-- if x is bigger output that else keep folding

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []
-- give accumulator an empty list to append to x
-- it will take a list and pop off x to start the fold

product' :: (Num a) => [a] -> a
product' = foldr1 (*)
-- this will fold from the right using the last index as the starting value

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x acc -> if p x then x : acc else acc) []
-- here we start the accumulator as an empty list to use as appending or the default case
-- then we take the first value off the list passed in and check for it against the predicate

head' :: [a] -> a
head' = foldr1 (\x _ -> x)
-- here we don't care about the accumulator and just need x

last' :: [a] -> a 
last' = foldl1 (\_ x -> x)
-- here we don't care about the accumulator and just need x

-- here is another way to picture folding
    -- say there is a binary function (f) and a starting value(accumulator) of (z)
    -- if we want to foldr over a list [3,4,5,6]
    -- what it looks like broken down is 
        -- f 3 (f 4 (f 5 (f 6 z)))
    -- (f) is called on the last element first and the accumulator
    -- that value is then given as the accumulator to the next value in the list
        -- so on and so forth
    -- if (f) is (+) and the starting accumulator to be (0) then..
        -- (+) 3 ((+) 4 ((+) 5 ((+) 6 0))
        -- or 3 + (4 + (5 + (6 + 0)))

    -- if we wanted a left fold of a list [3,4,5,6] with binary function (f) and accumulator (z)
        -- f (f (f (f z 3) 4) 5) 6
        -- notice the accumulator is the parenthesized value being returned up the chain
        -- if we use (flip (:)) as the (f) function and [] as the accumulator start we would get
            -- flip (:) (flip (:) (flip (:) (flip (:) [] 3) 4) 5) 6
                -- flip (:) (flip (:) (flip (:) (3:[]) 4) 5) 6
                    -- flip (:) (flip (:) (4:3:[]) 5) 6 
                        -- flip (:) (5:4:3:[]) 6
                            -- 6:5:4:3:[] or 
                            -- [6,5,4,3]

-- what about if we need some kind of information about what is happening during the folding?
    -- we there is scanning for that

-- scanl and scanr are like their fold counterparts
    -- the difference is that the output a list of the accumulator states 

-- there is also scanl1 and scanr1 which are counterparts for foldl1 and foldr1
-- here are some examples of scan vs fold
{-
    ghci> scanl (+) 0 [3,5,2,1]  
    [0,3,8,10,11]  
    ghci> foldl (+) 0 [3,5,2,1]
    11

    ghci> scanr (+) 0 [3,5,2,1]  
    [11,8,3,1,0]  
    ghci> foldr (+) 0 [3,5,2,1]
    11

    ghci> scanl1 (\acc x -> if x > acc then x else acc) [3,4,5,3,7,9,2,1]  
    [3,4,5,5,7,9,9,9]  
    ghci> foldl1 (\acc x -> if x > acc then x else acc) [3,4,5,3,7,9,2,1]
    9

    ghci> scanl (flip (:)) [] [3,2,1]  
    [[],[3],[2,3],[1,2,3]]  
    ghci> foldl (flip (:)) [] [3,2,1]
    [1,2,3]
-}

-- scan functions are used to monitor the progression of a function that could be implemented with fold

-- try this one 
    -- How many elements does it take for the sum of the square roots of all natural numbers to exceed 1000
    -- this would be a good opportunity for a scan since we need to track a fold 
    -- lets break down the question
        -- "How many elements does it take"
            -- this is the need for a scan
        -- Get the "sum of the square roots of all natural numbers to exceed 1000"
            -- this we can do by mapping the (sqrt) to a list
            -- to get the sums we do a scan on that whole output
                -- then just take all from the list less than 1000
            -- add 1 to the end of the output since the result will give you up to 1000
sqrtSums :: Int 
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1
-- takewhile works with infinite lists and filter does not which is the reason for the choice
-- takeWhile will cut the scanned list off at the first element with a sum greater than 1000
