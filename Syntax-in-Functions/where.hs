-- the WHERE keyword is used very similar to SQL
-- it is a conditional used at the end of a function to apply some kind of predicate logic to conditionals 
-- it is common to use in guards 
-- also used commonly to extract out repetitive code

-- take the BMI function from the guard-guard.hs file 
bmiTell :: (RealFloat a) => a -> a -> String  
bmiTell weight height  
    | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"  
    | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise                   = "You're a whale, congratulations!"  

-- there is replication 3 times for the calculation of the BMI
-- this means Haskell is doing three calculations 
-- we can use WHERE to bind it to a name and use that in the conditional
bmiTell' :: (RealFloat a) => a -> a -> String  
bmiTell' weight height  
    | bmi <= 18.5 = "You're underweight, you emo, you!"  
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"  
    | otherwise   = "You're a whale, congratulations!"  
    where bmi = weight / height ^ 2

-- now it takes the weight and height and calculates bmi once and uses that bmi value to check each conditional
-- we can apply multiple names in the where statement as seen below
bmiTell'' :: (RealFloat a) => a -> a -> String  
bmiTell'' weight height  
    | bmi <= skinny = "You're underweight, you emo, you!"  
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"  
    | otherwise     = "You're a whale, congratulations!"  
    where bmi    = weight / height ^ 2
-- you can also use pattern matching to define where bindings
          (skinny, normal, fat) = (18.5, 25.0, 30.0)
-- if you want the values in the where binding to be shared across function bodies of different patterns
    -- then you need to define it globally

-- here we use both where binding and pattern matching to get the initials for someone 
initials :: String -> String -> String
initials firstName lastName = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstName
          (l:_) = lastName
-- tbh a better way to write this would be like so but above demonstrates some principles being learned
initials' :: String -> String -> String
initials' firstName lastName = (head firstName):[] ++ ". " ++ (head lastName):[] ++ "."
-- im sure there are other ways but this worked for me.

-- you can also define entire functions in where bindings
-- create a function that takes a list of weight height pairs 
    -- and outputs a list of BMIs
calcBmis :: (RealFloat a) => [(a,a)] -> [a] -- so this takes a list of tuple pairs that are of typeclass RealFloat and outputs a list of type 'a'
calcBmis ts = [bmi w h | (w,h) <- ts]
    where bmi weight height = weight / height ^ 2 
-- see here how we use list comprehension to extract the tuple pairs in the list supplied
-- we take that pair from the general set and apply the values in the pair to the bmi function defined in the where binding
-- the output of that function is used to create the new specific set 
    -- this is used to output the final result from calcBmis

-- Note it is also possible to nest where bindings. 
    -- this would work in the sense that FUNC1 defines some helper function in its where binding
        -- and then that where binding function call it WHERE_FUNC1 
            -- will have helper functions within there own where clauses 




