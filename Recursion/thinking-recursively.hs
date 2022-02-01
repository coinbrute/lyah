-- with recursion there is a thought pattern to learn
-- as with the patterns in the coding
    -- there is typically an edge case being defined
    -- as well as some function definition
        -- this function does stuff between some element
        -- the function is then applied tothe remainder
    -- this doesn't matter if its a list, tree, or whatever really
-- a sum is always the first element plus the sum of the rest
-- a product is always the first element times the product of the rest
-- the length is always one plus the length of the tail of the list
-- etc..

-- edge cases are usually there when a recursive application would not make sense
-- dealing with lists  
    -- edge case is often an empty lists
-- dealing with trees
    -- edge case is often a node with no children
-- this is similar when working recursively with numbers
    -- this is usually when you get towards zero or 1
    -- think factorial 
        -- a recursive application wouldn't make sense with 0
-- many times edge case values have to do with the identity of the data
    -- the identity for multiplication is 1 
        -- because if you multiply something by 1 you get that something back
    -- the identity for addition is 0 
        -- this is true in all forms
        -- think about summing a list
            -- if the base identity was 1 then the sum would always be +1
-- in qsort the identity is an empty list
    -- if you add an empty list to an empty list you just get the same list out
    
-- when working recursively and trying to solve recursive problems do the following
    -- apply edge cases first
    -- think about the identities of the data types being handled
    -- think if you will deconstruct any parameters and on which part the recursion will occur