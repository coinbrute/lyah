-- defining a function will take the function name 
-- then a space
-- then any parameters space separated
-- then an equals sign
-- then the function implementation
doubleMe x = x + x
-- ghci> doubleMe 5
-- 10

-- this function will take two parameters 
-- like before just separate them by a space
doubleUs x y = x*2 + y*2
{-
    this is evaluated as such 
    since operators will follow function application
    then arithmetic application
    ghci> doubleUs 5 2
    5*2 + 2*2
    10 + 4
    14
-}
-- can also be defined as an extrusion of the (*) operation
doubleUs' x y = x + x + y + y
-- or as a call to our doubleMe function
doubleUs'' x y = doubleMe x + doubleMe' y
-- With this implementation we are making a call to our function doubleMe first 
-- before using the (+) operator to evaluate the output of those two function calls

-- NOTE: functions do not have to be in a specific order within the .hs file.
-- below I am defining a function used above on line 25
doubleMe' x = x + x


-- IF - THEN - ELSE
-- The main difference between imperative if/then/else and Haskell's version is that...
    -- in Haskell the ELSE IS REQUIRED
    -- the if/then/else is considered an expression as it will always output some value
doubleSmallNumbers x = if x > 100 then x else doubleMe x
-- if we want to do something after the if/then/else then we need to wrap the entire expression in parentheses
-- for example, adding one to the output of above function
-- without wrapping the if/then/else in () we will only (+1) during the else condition and not after any output
doubleSmallNumbers' x = if x > 100 then x else doubleMe x + 1
doubleSmallNumbers'' x = (if x > 100 then x else doubleMe x) + 1

-- Note the ' character at the end of functions being redefined.
-- This is valid function naming and is common for denoting a stricter version of a function (one that isn't lazy)
-- OR to denote a slightly modified version of a function like I am doing in this case
-- This would also be valid though
conanO'Brian = "It's me, Conan O'Brian" :: String
-- notice that conanO'Brian has no parameters and begins with a lower case letter
-- functions and definitions CANNOT start with upper case lettering
-- This is still a function but one that is called a Definition or Name

