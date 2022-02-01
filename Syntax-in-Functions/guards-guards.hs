-- patterns may test values to see if they conform by deconstruction
-- GUARDS are a way of testing properties of values to see if they are true or false
    -- very similar in function to if-then-else

-- BMI example using guards
bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | weight / height <= 18.5 = "You're underweight."
    | weight / height <= 25.0 = "You're somewhat normal."
    | weight / height <= 30.0 = "You're a fatty."
    | otherwise               = "You're a whale, congratulations."

-- guards are denoted by the (|) followed by some conditional and an output
-- if the condition is met the output is used 
    -- else the next gaurd is checked
    -- OTHERWISE is a keyword that always evaluates to True

-- using guards write a max function that takes two things to be compared (Ord)
max' :: (Ord a) => a -> a -> a 
max' a b
    | a > b     = a
    | otherwise = b
-- syntactically guards can also be written in one line although as seen below it is not readable
max'' :: (Ord a) => a -> a -> a 
max'' a b | a > b = a | otherwise = b

-- write a compare using guards (LT, GT, EQ) should be the outputs since its type Ordering
compare' :: (Ord a) => a -> a -> Ordering 
compare' a b 
    | a > b     = GT 
    | a == b    = EQ 
    | otherwise = LT 