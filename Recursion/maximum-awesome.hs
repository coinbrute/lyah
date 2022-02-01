-- here we will take a look at the (maximum) function
-- its purpose is to take a list of things that can be ordered
    -- i.e. instances of (Ord) typeclass
    -- then with that list return the biggest item out of them

-- In Java or other imperative languages we would create a variable to hold a value
    -- then loop through the list and compare the elements to the value being stored 
    -- at the end whatever value is in the variable is the maximum

-- In haskell we would define it recursively 
    -- first set up some edge condition to exit on
        -- if there is no list then return an error
        -- if there is only one item then return that since its the biggest
    -- then we say that the maximum of a longer list is the head at first
        -- if the head is bigger than the maximum of the tail then x
        -- otherwise we end up calling the function on the tail 

-- in practice
findMax :: (Ord a) => [a] -> a
findMax [] = error "no maximum in empty list"
findMax [x] = x
findMax (x:xs)
    | x > maxTail = x
    | otherwise   = maxTail
    where maxTail = findMax xs

-- pattern matching is very useful with recursion as seen above
-- in Java this would require several nested if-else statements to test for edge conditions

-- Let's take an example list of numbers and check out how this would work on them: 
    -- [2,5,1]. If we call maximum' on that, the first two patterns won't match. 
    -- The third one will and the list is split into 2 and [5,1]. 
    -- The where clause wants to know the maximum of [5,1], so we follow that route. 
    -- It matches the third pattern again and [5,1] is split into 5 and [1]. 
    -- Again, the where clause wants to know the maximum of [1]. 
    -- Because that's the edge condition, it returns 1. 
    -- So going up one step, comparing 5 to the maximum of [1] (which is 1), we obviously get back 5. 
    -- So now we know that the maximum of [5,1] is 5. 
    -- We go up one step again where we had 2 and [5,1]. 
    -- Comparing 2 with the maximum of [5,1], which is 5, we choose 5.

-- you could also write that function recursively calling the (max) function
-- (max) takes two numbers and outputs the bigger of them
findMax' :: (Ord a) => [a] -> a 
findMax' [] = error "no maximum of empty list"
findMax' [x] = x
findMax' (x:xs) = max x (findMax' xs) -- call max on x and the findMax' of xs

{-
    findMax' [2,5,1] = max 2 (findMax' [5,1] = max 5 (findMax' [1] = 1))
    so...
    findMax' [2,5,1] = max 2 (findMax' [5,1] = max 5 (1))
    soo...
    findMax' [2,5,1] = max 2 (findMax' [5,1] = 5)
    sooo...
    findMax' [2,5,1] = max 2 (5) = 5
    soooo...
    findMax' [2,5,1] = 5
-}
