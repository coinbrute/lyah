-- map is a function that takes a function and a list 
    -- it applies that function to each element in the list
    -- then ouputs the new list
map' :: (a -> b) -> [a] -> [b]
map' _ []     = [] -- edge case for empty list
map' f (x:xs) = f x : map f xs -- apply f to the head then the rest of the function recursively
-- deconstruction of the type
    -- it takes in a function (a -> b)
        -- this function takes an (a) and returns a (b)
    -- it takes in a list of [a]
    -- it returns a list of [b]
    -- from this we can surmise that the function needs to do something with the original list
        -- then create a new list of (b)
{-
    ghci> map (+3) [1,5,3,1,6]  
    [4,8,6,4,9]  
    ghci> map (++ "!") ["BIFF", "BANG", "POW"]  
    ["BIFF!","BANG!","POW!"]  
    ghci> map (replicate 3) [3..6]  
    [[3,3,3],[4,4,4],[5,5,5],[6,6,6]]  
    ghci> map (map (^2)) [[1,2],[3,4,5,6],[7,8]]  
    [[1,4],[9,16,25,36],[49,64]]  
    ghci> map fst [(1,2),(3,5),(6,3),(2,6),(2,5)]  
    [1,3,6,2,2]
-}
-- these could also be achieved with list comprehension
    -- map (+3) [1,5,3,1,6] is the same as 
        -- [x+3 | x < [1,5,3,1,6]]
    -- map (++ "!") ["BIFF", "BANG", "POW"] is the same as 
        -- [x ++ "!" | x <- ["BIFF", "BANG", "POW"]]
    -- map (replicate 3) [3..6] is the same as
        -- [replicate 3 x | x <- [3..6]]
    -- map (map (^2)) [[1,2],[3,4,5,6],[7,8]] is the same as 
        -- [map (^2) x | x <- [[1,2],[3,4,5,6],[7,8]]]
    -- map fst [(1,2),(3,5),(6,3),(2,6),(2,5)]
        -- [fst (x,y) | (x,y) <- [(1,2),(3,5),(6,3),(2,6),(2,5)]]
-- map is more readable in most cases
    -- esspecially where nested map calls occur

-- filter is a function that takes a predicate and a list
    -- then returns a list that satisfy the predicate 
-- a PREDICATE is a function that tells whether something is true or not
    -- i.e. a function that returns a Boolean value
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = [] -- edge case for empty list
filter' p (x:xs) 
    | p x       = x : filter' p xs
    | otherwise = filter p xs
-- so here if the (p) evaluates to true on (x) 
    -- pass (x) to the new list and recursively call (filter') on the tail of the list (xs)
    -- otherwise just call (filter') on the tail of the list
{-
    ghci> filter' (>3) [1,5,3,2,1,6,4,3,2,1]
    [5,6,4]
    ghci> filter' (==3) [1,2,3,4,5]
    [3]
    ghci> filter even [1..10]
    [2,4,6,8,10]
    ghci> let notNull x = not (null x) in filter' notNull [[1,2,3],[],[3,4,5],[2,2],[],[],[]]
    [[1,2,3],[3,4,5],[2,2]]
    ghci> filter' (`elem` ['a'..'z']) "u LaUgH aT mE BeCaUsE I aM diFfeRent"
    "uagameasadifeent"
    ghci> filter' (`elem` ['A'..'Z']) "i lauGh At You BecAuse u r aLL the Same"
    "GAYBALLS"
-}
-- the above examples can be done with list comprehension and the use of a predicate
    -- filter' (>3) [1,5,3,2,1,6,4,3,2,1]
        -- [x | x <- [1,5,3,2,1,6,4,3,2,1], x > 3]
    -- filter' (==3) [1,2,3,4,5]
        -- [x | x <- [1,2,3,4,5], x == 3]
    -- filter even [1..10]
        -- [x | x <- [1..10], even x]
    -- let notNull x = not (null x) in filter' notNull [[1,2,3],[],[3,4,5],[2,2],[],[],[]]
        -- [x | x <- [[1,2,3],[],[3,4,5],[2,2],[],[],[]], not (null x)]
    -- filter' (`elem` ['a'..'z']) "u LaUgH aT mE BeCaUsE I aM diFfeRent"
        -- [x | x <- "u LaUgH aT mE BeCaUsE I aM diFfeRent", x `elem` ['a'..'z']]
    -- filter' (`elem` ['A'..'Z']) "i lauGh At You BecAuse u r aLL the Same"
        -- [x | x <- "i lauGh At You BecAuse u r aLL the Same", x `elem` ['A'..'Z']]
-- filter is the same as applying a predicate in list comprehension so the choice is up to readability and context

-- quicksort can also be done using filter
    -- before we made it using list comprehension
    -- as seen here filter/map and list comprehension are interchangeable
qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort (x:xs) =
    let smaller = qsort (filter (<=x) xs)
        bigger  = qsort (filter (>x) xs)
    in smaller ++ [x] ++ bigger 

-- lets try something else
    -- make a function that finds the largest number under 100k thats divisible by 3829
    -- so we need 
        -- a list from [100000,99999..] to check against
        -- a predicate to filter against
            -- we can use mode to know what would return remainder of 0 when divided by 3829
                -- x `mod` 3829 == 0 should work
        -- it should take nothing
        -- return (a) but it needs to be a whole number so should be constrained to Integral typeclass
largestDiv :: (Integral a) => a
largestDiv = head (filter p [100000,99999..])
    where p x = x `mod` 3829 == 0
-- first an infinite list is constructed desc from 100k
-- then we filter using the (filter) function and a predicate defined in the where clause 
-- here we call our (p) predicate with filter and the list generated
-- then take the head off the resulting list for our output


-- next lets find the sum of all odd square that are smaller than 10k
    -- for this we need an auxillary function called (takeWhile) so lets look closer at that

-- takeWhile deconstruction
    -- takes a predicate (p) and a list (a)
    -- it goes through the list from the beginning and returns elements until the predicate is not met
        -- takeWhile (/=' ') "my, this is quite a string"
            -- this would output "my,"

-- back to sum of all odd squares smaller than 10k
    -- first we need to map (^2) [1..]
        -- this maps an infinite list to the squared value of each element
    -- then we filter that resulting list for odd numbers
        -- filter odd
    -- then take the elements from that list less than 10k using takeWhile
        -- takeWhile (<10000)
    -- finally we will sum the result
sumOfOddSquaresTo10k :: Integer
sumOfOddSquaresTo10k = sum (takeWhile (<10000) (filter odd (map (^2) [1..])))
-- again using list comprehension
sumOfOddSquaresTo10kLC :: Integer
sumOfOddSquaresTo10kLC = sum (takeWhile (<10000) [x^2 | x <- [1..], odd (x^2)])

-- lets move onto something called the COLLATZ SEQUENCES 
    -- take a natural number
    -- if its even divide it by two
    -- if its odd multiply by 3 then add 1 to that
    -- take the resulting number and apply the same sequence to it
    -- we should end up with a chain of numbers
    -- if we get a result of one end the chain
    -- in theory any starting number should produce a chain ending in 1
        -- starting with 13 the sequence is
            -- 13,40,20,10,5,16,8,4,2,1
    
-- so for all starting numbers between 1 and 100 how many chains have a length greater than 15
chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
    | even n = n:chain (n `div` 2)
    | odd n  = n:chain (n*3 + 1)
-- this chain function executes the collatz sequence
-- we will use it to get our chains from 1-100
numOfLongChains :: Int 
numOfLongChains = length (filter isLong (map chain [1..100]))
    where isLong xs = length xs > 15
-- length returns an Int for historical reasons instead of (Num a)
-- to get (Num a) we could use fromIntegral on the length result

-- Using map we can also do stuff like map (*) [0..] 
-- So far, we've only mapped functions that take one parameter over lists
    -- like map (*2) [0..] to get a list of type (Num a) => [a]
    -- but we can also do map (*) [0..] without a problem
    -- What happens here is that the number in the list is applied to the function *
    -- which has a type of (Num a) => a -> a -> a 
    -- Applying only one parameter to a function that takes two parameters returns a function that takes one parameter. 
    -- If we map * over the list [0..], we get back a list of functions that only take one parameter, so (Num a) => [a -> a].
    -- map (*) [0..] produces a list like the one we'd get by writing [(0*),(1*),(2*),(3*),(4*),(5*)..

{-
    ghci> let listOfFuns = map (*) [0..]  
    ghci> (listOfFuns !! 4) 5  
    20 
-}
-- getting the element out of the list at index 4 returns a function (4*)
    -- we apply 5 to that i.e. (4*) 5 or 4*5
    

