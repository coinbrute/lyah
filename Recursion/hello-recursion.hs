-- recursion is a key part of the Haskell ecosystem
-- recursion is a way of defining functions in which the function is applied to itself
-- this is a heavily used concept in mathematics

-- the fibonacci sequence is defined recursively
    -- as was the factorial function used heavily throughout the tutorial

-- for fibonacci 
    -- we would define the first two numbers non-recursively 
        -- saying 0th and 1st fib nums are always 0 and 1 respectively
    -- something like F(0) = 0 and F(1) = 1
    -- then we would say that for ANY OTHER natural number 
        -- the fibonacci number is the sum of the previous two fibonacci numbers
        -- so...
        -- F(n) = F(n-1) + F(n-2)
    -- in this way F(3) would work out to
        -- F(2) + F(1) -> (F(1) + F(0)) + F(1) -> (1 + 0) + 1
        -- so we know its 2 because F(1) and F(0) are predefined as non-recursive
    
-- the non-recursive conditions are called EDGE CONDITIONS
    -- these are important if you want your function to be able to terminate
    -- without this in the fibonacci function we would enter negative numbers and never exit

-- recursion is important to Haskell because
    -- in Haskell you declare what SOMETHING IS
    -- in imperative languages you declare how you GET SOMETHING

-- this is why there are no for/while loops in Haskell
