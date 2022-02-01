-- typeclasses can be thought of as an interface to define some set of behaviors
-- if a type belongs to a typeclass
    -- THEN it supports and will implement the behavior that typeclass defines

-- These are like Java Interfaces ON STEROIDS
    -- They simply hold a set of definitions and behaviors that any type belonging to it must adhere to

-- Take the type of the (==) function
    -- ghci> :t (==)  
    -- (==) :: (Eq a) => a -> a -> Bool  
    -- Notice the => symbol which acts as a constraint for the parameters
    -- This type definition states that (==) takes two parameters of the same type
    -- ALSO that those two parameters must be a member of the Eq class
        -- This is called a CLASS CONSTRAINT   
    -- then the function will return a Bool
    
-- in this case the Eq typeclass gives an interface for testing for equality.

-- Some basic typeclasses

-- Eq is used to test for equality 
-- ghci> :t (==)  
-- (==) :: (Eq a) => a -> a -> Bool  
    -- functions supported are (==) (/=)
    -- be sure to include this as a class constraint if using one of those functions
{-
    ghci> 5 == 5  
    True  
    ghci> 5 /= 5  
    False  
    ghci> 'a' == 'a'  
    True  
    ghci> "Ho Ho" == "Ho Ho"  
    True  
    ghci> 3.432 == 3.432  
    True  
-}

-- Ord is for types that have an ordering like lists or numbers
-- ghci> :t (>)  
-- (>) :: (Ord a) => a -> a -> Bool 
    -- this typeclass covers standard comparison functions 
    -- functions supported are (>) (<) (>=) (<=)
    -- Ordering is a type that can be GT, LT or EQ, 
        -- meaning greater than, lesser than and equal, respectively.
{-
    ghci> "Abrakadabra" < "Zebra"  
    True  
    ghci> "Abrakadabra" `compare` "Zebra"  
    LT  
    ghci> 5 >= 2  
    True  
    ghci> 5 `compare` 3  
    GT  
-}

-- Show can be presented as strings. 
-- All types covered so far except for functions are a part of Show. 
-- The most used function that deals with the Show typeclass is show. 
-- It takes a value whose type is a member of Show and presents it to us as a string.
    -- basically java's toString()
{-
    ghci> show 3  
    "3"  
    ghci> show 5.334  
    "5.334"  
    ghci> show True  
    "True"
-}

-- Read is sort of the opposite typeclass of Show. 
-- The read function takes a string and returns a type which is a member of Read.
    -- so essentially it will display it in its native type if possible
        -- else throwing an error
{-
    ghci> read "True" || False  
    True  
    ghci> read "8.2" + 3.8  
    12.0  
    ghci> read "5" - 2  
    3  
    ghci> read "[1,2,3,4]" ++ [3]  
    [1,2,3,4,3] 
-}
-- what happens with read "4"
    -- you would assume it should print 4?
    -- WRONG
    {-
    ghci> read "4"  
    <interactive>:1:0:  
        Ambiguous type variable `a' in the constraint:  
            `Read a' arising from a use of `read' at <interactive>:1:0-7  
        Probable fix: add a type signature that fixes these type variable(s) 
    -}
    -- ghci is saying it doesn't know what to return 
        -- ghci> :t read  
        -- read :: (Read a) => String -> a  
        -- see how read returns type a of Read 
            -- but if it doesn't know how to handle that Read type it will not continue
    -- we can add explicit type signatures and fix this.
    {-
        ghci> read "5" :: Int  
        5  
        ghci> read "5" :: Float  
        5.0  
        ghci> (read "5" :: Float) * 4  
        20.0  
        ghci> read "[1,2,3,4]" :: [Int]  
        [1,2,3,4]  
        ghci> read "(3, 'a')" :: (Int, Char)  
        (3, 'a')  
    -}

-- Enum is used for sequentially ordered types since they can be...enumerated
    -- Enum can be used on list ranging
    -- succ and pred functions are defined to get one previous and one after input
    -- types in this class:
        -- ()
        -- Bool
        -- Char
        -- Ordering
        -- Int
        -- Integer
        -- Float
        -- Double
    {-
        ghci> ['a'..'e']  
        "abcde"  
        ghci> [LT .. GT]  
        [LT,EQ,GT]  
        ghci> [3 .. 5]  
        [3,4,5]  
        ghci> succ 'B'  
        'C' 
    -}

-- Bounded members have upper and lower limits.
{-
    ghci> minBound :: Int  
    -2147483648  
    ghci> maxBound :: Char  
    '\1114111'  
    ghci> maxBound :: Bool  
    True  
    ghci> minBound :: Bool  
    False  
-}
    -- minBound and maxBound have a type of (Bounded a) => a
        -- they take no inputs and simply return the specified bound of a type
    -- any tuple that contains components who are part of Bounded is also part of Bounded

-- Num is a numeric typeclass 
    -- members have the property of being able to act like numbers 
    -- whole numbers behave as polymorphic constants
        -- since they can behave as any type thats a member of Num typeclass
    {-
        ghci> :t 20  
        20 :: (Num t) => t  
        ghci> 20 :: Int  
        20  
        ghci> 20 :: Integer  
        20  
        ghci> 20 :: Float  
        20.0  
        ghci> 20 :: Double  
        20.0  
    -}
-- this is why (*) operator and others are defined to accept a Num
    -- as opposed to having a definition for each type of number
    {-
        ghci> :t (*)  
        (*) :: (Num a) => a -> a -> a 
    -}
-- to be in Num a type must already be in Show and Eq

-- Integral is also a numberic typeclass
    -- Num includes all numbers 
    -- Integral only includes whole numbers
    -- In this typeclass are:
        -- Int 
        -- Integer

-- Floating includes only floating point numbers
    -- In this typeclass are:
        -- Float
        -- Double

-- useful function for dealing with numbers is fromIntegral
    -- fromIntegral :: (Num b, Integral a) => a -> b 
    -- this takes in an Integral and returns a Num
    -- very useful when you want integral and floating point types to work together
-- For Example:
    -- length has a type declaration of length :: [a] -> Int
    -- this makes getting a length of a list and adding 3.2 difficult as it results in an error
    -- we can call fromIntegral on the output of the length function though
        -- then add 3.2 and get our result that way
getLengthWFloat = fromIntegral (length [1,2,3,4]) + 3.2