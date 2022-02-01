-- case expressions in Hasell functionally work similarly to Java
-- take a varaiable and then execute code for specific values of that variable
-- possibly include a catch-all in case there is some value which was unintended

-- Haskell goes one more step
-- Haskell uses case expressions as exactly that...expressions
-- they work similar to if/then/else and let-in
    -- they can be used to evaluate expressions based on possible cases
    -- they can do pattern matching

-- Take a look at the two definitions for head below
    -- these do the same thing just 
    -- one uses pattern matching on function parameters
    -- one uses case expression evaluation on pattern matching
headPM :: [a] -> a
headPM [] = error "No head for empty lists."
headPM (x:_) = x

headCE :: [a] -> a
headCE xs = case xs of []    -> error "No head for empty lists."
                       (x:_) -> x

-- looking at the syntax it is pretty straight forward
    -- case <expr> of <pattern1> -> <result1>
    --                <pattern2> -> <result2>
    --                <pattern3> -> <result3>
    --                ...

-- the <expr> is matched against patterns.
    -- the matching sequence is as expected being from top down
-- if no pattern is found to match then a runtime error is thrown

-- while pattern matching on function parameters can only be done when defining functions
    -- case expressions can be used much more freely
describeList :: [a] -> String
describeList xs = "The list is " ++ case xs of []  -> "empty."
                                               [x] -> "a singleton list."
                                               xs  -> "a longer list."

-- they allow for pattern matching against something in the middle of an expression
-- this is because pattern matching is just syntactic sugar for case expressions
-- the above could have been defined as 
describeListPM :: [a] -> String
describeListPM xs = "The list is " ++ what xs
    where what []  = "empty."
          what [x] = "a singleton list."
          what xs  = "a longer list."