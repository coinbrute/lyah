-- on the other side of the function binding syntax we have the LET binding
-- while the where binding goes at the end of a function
    -- and allows for the entire function to get scope of the binding
    -- the LET <bindings> IN <expr> syntax narrows the scope of the bindings 
        -- the scope is only within the (in) portion of the declaration

    -- as with all constructs that bind values pattern matching is allowed

    -- take a function that calculates the area of a cylinder 
        -- we can use let bindings to make this readable 
        -- as there are three functions used internally
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let side = 2 * pi * r * h
        top  = pi * r ^ 2
    in  side + 2 * top
    
    -- see here how we are binding (side) and (top) for later use within the (IN) 
        -- we take the (r) and (h) inputs and use them for calculations 
        -- then take the outputs of those calculations and use those bindings for the expression 

-- there are more difference between WHERE and LET than placement though
    -- LET bindings are expressions 
    -- WHERE bindings are just constructs

-- remember how if/then/else can be put basically anywhere since it is an expression
wooBooFooBar :: [String]
wooBooFooBar = [if 5 > 3 then "Woo" else "Boo", if 'a' > 'b' then "Foo" else "Bar"]

evaluation :: Int 
evaluation = 4 * (if 10 > 5 then 10 else 0) + 2

-- this is also available using let-in bindings
evalWithLet :: Int
evalWithLet = 4 * (let a = 9 in a + 1) + 2
-- you can also introduce functions in a local scope with let-in
callFuncWithLet :: [(Int, Int, Int)]
callFuncWithLet = [let square x = x * x * x in (square 5, square 3, square 2)]

-- several bindings can be made inline by separation with (;)
heyThere :: (Int,String)
heyThere = (let a = 100; b = 200; c = 300; in a * b * c, let foo="Hey "; bar = "there!" in foo ++ bar)
-- here we have two let-in bindings
-- the first creates the first component in the tuple pair
-- the second creates the second component in the tuple pair
-- I put a (;) after the last binding in the first let-in to demonstrate it is syntactically valid

-- since you can pattern match let-in bindings they are helpful with tuple component dismantling
dismantled :: Int
dismantled = (let (a,b,c) = (1,2,3) in a+b+c) * 100

-- you also have the ability to use let-in bindings during list comprehension
-- this is seen in the predicate portion most often
    -- instead of defining auxillary functions with a where clause
-- in this bmi function we can take a list of heights and weights in tuple pair format 
-- and output a list of bmis 
calcBmis :: (RealFloat a) => [(a,a)] -> [a] 
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0]
-- so above we take in xs as the general set
-- from there we extract the tuple pair element since we know the list contains those
    -- we know that from the type signature [(a,a)] 
-- with that we construct a specific set by grabbing the output of bmi
    -- bmi function is declared in the predicate of our list comprehension
    -- our predicate uses a let-in binding to declare a function to calc the bmi
        -- it uses the (w,h) values from the element extracted from the general set
    -- we also have an additional predicate to check that bmi is (>=) 25.0

-- NOTE: we can't use bmi in the portion (w,h) <- xs 
    -- this is because it's defined prior to the let binding

-- NOTE: the (in) part of the let-in binding is not mandatory
    -- it was not used in the list comprehension example above because visibility is already defined
    
-- NOTE: when using let-in in ghci you only need (let) 
    -- the scope will be throughout the entire interactive session
    -- this will not work though 
        -- ghci> let boot x y z = x * y + z in boot 3 4 2  
        -- 14  
        -- ghci> boot  
        -- <interactive>:1:0: Not in scope: `boot' 
        -- this is because boot is being used before definition

-- let bindings cannot be used across guards

