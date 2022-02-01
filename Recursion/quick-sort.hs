-- hokay... so we have gone through quite a bit..
    -- list comprehension
    -- pattern matching
    -- where clauses
    -- let-in bindings
    -- case <binding> of <expr> 
    -- recursion
    -- guards
    -- typeclasses
    -- name/definitions
    -- basic syntax for function writing

-- Now lets implement a quicksort.
    -- this is a classic sorting algorithm that is somewhat of a posterchild for Haskell beginners
    -- very clean and elegant in Haskell while not so much so in imperative languages

-- Since we know we are working with the Ordered typeclass 
    -- we need to use a class constraint on the function type definition
    -- it will input a list
    -- it will output a list
    -- edge condition will be an empty list
-- the rules of quicksort are straightforward
    -- a sorted list is...
        -- all values <= the head in front (these are sorted)
        -- then the head is in the middle
        -- then all values > the head are after (these are sorted)
qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort (x:xs) =
    let smaller = qsort [y | y <- xs, y <= x] -- need all values sorted in a list <= x, excluding x
        bigger  = qsort [y | y <- xs, y > x] -- same as above but > than x
    in smaller ++ [x] ++ bigger 

{-
                                        [5,1,9,4,6,7,3]
                            [1,4,3]     ++     [5]       ++      [9,6,7]
                          []++[1]++[4,3]                      [6,7] ++ [9] ++ []
                              [3]++[4]++[]                []++[6]++[7]
                          []++[3]++[]                            []++[7]++[]
        
        All the centered elements drop down
        so...from left to right
        [1]:[3]:[4]:[5]:[6]:[7]:[9]
        [1,3,4,5,6,7,9]

-}