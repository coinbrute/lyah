-- pretty straightforward here. 
-- a nice break tbh from the heavy handed currying and recursion

-- the ($) function is called FUNCTION APPLICATION
-- here is the definition
($) :: (a -> b) -> a -> b
f $ x = f x
-- so what is the purpose of thsi if its just applying a function
    -- ($) function has the lowest precedence 
    -- it is also right associative
        -- so (f a b c) is the same as ((f a) b) c)
        -- but to write ((f a) b) c) with ($) it would be (f g $ z $ x)

-- typically this is used for convenience as opposed to parentheses
    -- take the expression sum (map sqrt [1..130])
        -- because of its low precedence this can be written as
            -- sum $ map sqrt [1..130]
    -- whenever ($) is seen the expression to the right is the parameter to the function on the left
    -- sqrt (3 + 4 + 9) is the same as sqrt $ 3 + 4 + 9

-- here is a more complex example
    -- sum (filter (>10) (map (*2) [2..10]))
    -- sum $ filter (>10) $ map (*2) [2..10]

-- other than that ($) can be treated like any other function
-- we could for instance map a function application over a list of functions...whoah
mapFuncs :: [Float]
mapFuncs = map (Prelude.$ 3) [(4+), (10*), (^2), sqrt]

