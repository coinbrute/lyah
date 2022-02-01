-- many times the types in functions may need to be ambiguous
-- this is because a function may accept many different types 
-- or a function may return many different types
-- take the head function
    -- it can accept any type of list and returns the first element regardless of type
    -- ghci> :t head
    -- head :: [a] -> a

-- because a is in the spot a type may go it's easy to think of it as a type
-- it is not one though since it is not Capitalized

-- These are called TYPE VARIABLES
    -- simply it means this can be of any type
    -- very similar to generics in Java so <T>

-- In Haskell any function that has type variables is considered a POLYMORPHIC FUNCTION
    -- this is because the function can have many states 

-- best practice is to assign type variables single letters a,b,c,d etc

-- take fst which grabs the first component of a tuple pair
    -- ghci> :t fst
    -- fst :: (a, b) -> a
    -- see how fst takes in one tuple containing two different components of any type
    -- the first component is of type a
    -- the second is of type b
    -- just because a and b are different type variables DOES NOT mean they have to be different types
    -- this is just to say that the ouput type needs to match the first component of the input type
    