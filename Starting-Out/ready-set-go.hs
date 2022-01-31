{-
    You can perform simple arithmetic via the ghci console by inputting expressions and pressing `Enter` to evaluate in console

    ghci> 2 + 15  
    17  
    ghci> 49 * 100  
    4900  
    ghci> 1892 - 1472  
    420  
    ghci> 5 / 2  
    2.5  
    ghci>  

-}

{-
    You can chain expressions in the console and normal precedence rules are followed. 
    You can override precedence by putting expressions and function calls within parenthesis

    ghci> (50 * 100) - 4999  
    1  
    ghci> 50 * 100 - 4999  
    1  
    ghci> 50 * (100 - 4999)  
    -244950 

-}

-- NOTE: for negative numbers ensure that when evaluating an expression with a negative number to wrap the negative number in parenthesis
-- Doing 5 * -3 will make GHCI yell at you but doing 5 * (-3) will work just fine. 

{-
    Boolean logic and evaluation is the same as in imperative programming 
    && is boolean AND
    || is boolean OR
    not negates boolean True or False

    ghci> True && False  
    False  
    ghci> True && True  
    True  
    ghci> False || True  
    True   
    ghci> not False  
    True  
    ghci> not (True && True)  
    False  
-}

{-
    Use the (==) operator to test for equality 
    NOTE: in a function definition when using (==) Ensure to use a constraint on the args for 'Eq a'

    ghci> 5 == 5  
    True  
    ghci> 1 == 0  
    False  
    ghci> 5 /= 5  
    False  
    ghci> 5 /= 4  
    True  
    ghci> "hello" == "hello"  
    True  
-}

{-
    When doing algebra or equality evaluation both arguments passed into the function MUST be of the same type
    Otherwise an error will be thrown

    ghci> 5 + "llama"
    No instance for (Num [Char])  
    arising from a use of `+' at <interactive>:1:0-9  
    Possible fix: add an instance declaration for (Num [Char])  
    In the expression: 5 + "llama"  
    In the definition of `it': it = 5 + "llama"   

    SO WHAT HAPPENED???
    What GHCI is telling us here is that "llama" is not a number and so it doesn't know how to add it to 5. 
    Even if it wasn't "llama" but "four" or "4", Haskell still wouldn't consider it to be a number. 
    (+) expects its left and right side to be numbers. 
    If we tried to do True == 5, GHCI would tell us that the types don't match. 
    Whereas (+) works only on things that are considered numbers, 
    (==) works on any two things that can be compared. 
-}

{-
    Spoiler... All these expressions are actually function calls. 

    (*) is a function that takes two parameters and outputs the product of whatever arguments are passed in
    Because the (*) functions is passed between its two parameters it is called an `infix` function 
    `infix` means the function goes IN between the parameters it takes.
    When calling infix functions they need to either be in `` or in () depending on the function
    Most functions are `prefix` functions in that they are PRE parameter calls
    
        PREFIX 
    ghci> (*) 5 2
    10

        INFIX
    ghci> 5 * 2
    10
-}

{-
    Function application via writing the name and putting a space then parameters has the highest precedence
    The following two will have the same output
    ghci> succ 9 + max 5 4 + 1
    10 + 5 + 1
    16
    ghci> (succ 9) + (max 5 4) + 1
    10 + 5 + 1 
    16

    However the following two give two different 
    ghci> succ 9 * 10
    10 * 10
    100
    ghci> succ (9 * 10)
    succ (90)
    91
-}

{-
    Some arithmetic functions are easier to read as infix instead of prefix 
    div 90 10
    this can be hard to decipher which is doing the division and which is being divided
    90 `div` 10 makes it much more clear
-}

{-
    Imperative vs. Functional func calling
    Imperative
    foo() 
    bar(1) 
    baz(1, "haha")
    bar(bar(3))

    Functional
    foo 
    bar 1 
    baz 1 "haha"
    bar (bar 3)
-}