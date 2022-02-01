-- pattern matching is just specifying patterns to which the input data needs to conform
-- you check in the pattern to see if the input data conforms
    -- if so then begin deconstruction according to the pattern
-- defining functions with pattern matching allows for defining separate fucntion bodies for different patterns

-- pattern matching can be done on any data type 
isLucky :: (Integral a) => a -> String
isLucky 7 = "LUCKY NUMBER SEVEN!"
isLucky x = "Sorry, you're out of luck, pal!"
    -- in this function the patterns are checked from top down
    -- once a pattern is matched the implementation is executed
    -- x is used as a catch-all

-- pattern matching is useful to avoid nested if/then/else
sayMeITE :: (Integral a) => a -> String
sayMeITE x = if x == 1 then "One!" else
             if x == 2 then "Two!" else
             if x == 3 then "Three!" else
             if x == 4 then "Four!" else
             if x == 5 then "Five!" else "Not between 1 and 5"
-- with pattern matching it becomes easier to read
sayMePM :: (Integral a) => a -> String
sayMePM 1 = "One!"
sayMePM 2 = "Two!"
sayMePM 3 = "Three!"
sayMePM 4 = "Four!"
sayMePM 5 = "Five!"
sayMePM x = "Not between 1 and 5"
-- moving the x case to the top would result in always outputting that string
-- since x will catch all inputs

-- factorial can also be defined recursively using pattern matching
-- before we defined as fac n = product [1..n]
-- where we create a list ranging up to n and get the product of the list
-- here is another way
factorial :: (Integral a) => a -> a 
factorial 0 = 1
factorial n = n * factorial (n - 1)
-- in this instance we first check for the input 0 and output 1 
    -- to account for the final recursive case
-- the remaining case will take any input and call the function with that input minus 1
-- so factorial 3
    -- 3 * factorial 2
    -- 3 * (2 * factorial 1)
    -- 3 * (2 * (1 * factorial 0))
    -- 3 * (2 * (1 * 1))
    -- 6

-- pattern matching can fail as well if not all patterns are exhausted when searching
-- this will compile but fail on certain inputs
    -- searching for 'h' will fail with the error
        -- Non-exhaustive patterns in function charName  
charName :: Char -> String  
charName 'a' = "Albert"  
charName 'b' = "Broseph"  
charName 'c' = "Cecil" 

-- pattern matching is useful for tuples 
-- think about adding vectors in 2D space
addVectorsPM :: (Num a) => (a,a) -> (a,a) -> (a,a)
addVectorsPM (x1,y1) (x2,y2) = (x1+x2, y1+y2)
-- this looks for the pattern x1,x2 and y1,y2 and extrudes and matches them on the right

-- how about with triples?
first :: (a,b,c) -> a 
first (x, _, _) = x

second :: (a,b,c) -> b
second (_,y,_) = y

third :: (a,b,c) -> c
third (_,_,z) = z

-- see the (_) symbol above?
    -- that is a wildcard to match for anything just like in list comprehension

-- you can also pattern match in list comprehension
testList = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]
addTuplesAndFlatten :: (Num a) => [(a,a)] -> [a]
addTuplesAndFlatten xs = [a+b | (a,b) <- xs] 

-- lists can be used in pattern matching
-- you can match with an empty list []
    -- or any pattern that involves (:) and the empty list
    -- since [1,2,3,4] is the same as 1:2:3:4:[] just use the former
    -- patterns list (x:xs) bind the head to the tail
        -- even if there is just one element
            -- xs will be []
-- so if you wanted to bind the first 3 elements to vars adn the rest of a list to another var
    -- x:y:z:zs
    -- this would only match on lists with 3 or more elements
-- patterns that have (:) in them will only match against lists longer than 1

-- let's remake the head function using pattern matching
myHeadPM :: [a] -> a 
myHeadPM [] = error "Can't call myheadPM on an empty list"
myHeadPM (x:_) = x
-- since we only care about the first value in the list we use the underscore to match the tail

-- any time we want to bind more than one var even if one is a wildcard (_) 
    -- we need to surround them in ()
-- notice the (error) function that takes a string and generates a runtime error
    -- we can use that string as info for what kind of error occurred
    -- it causes a program crash fyi
    -- use it wisely

-- here is an example of multiple pattern matching 
-- this will use the Show typeclass to take the (a) type input and show it as a String
tell :: (Show a) => [a] -> String
tell [] = "This list is empty" -- empty list
tell (x:[]) = "The list has one element: " ++ show x -- list of length 1
tell (x:y:[]) = "This list has two elements: " ++ show x ++ " and " ++ show y -- list of length 2
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y -- long list

-- this is a safe function since it accounts for all sizes of a list
    -- empty []
    -- length 1 (x:[])
    -- length 2 (x:y:[])
    -- anything longer (x:y:[])
        -- if we only needed the first value this would work (x:_)

-- here is length with pattern matching and recursion
length' :: (Num b) => [a] -> b 
length' [] = 0
length' (_:xs) = 1 + length' xs -- 1 is the first index then call function on the remainder

-- define the result of the known input 
    -- i.e. the empty list
    -- then take the list apart in the second pattern
        -- length is always 1 + the rest of the list
-- length' "ham"
    -- 1 + length' "am"
    -- 1 + (1 + length' "m")
    -- 1 + (1 + (length' ""))
    -- 1 + (1 + (0))
    -- 3

-- lets try summing
sum' :: (Num a) => [a] -> a 
sum' [] = 0
sum' (x:xs) = x + sum' xs
-- here we do the same thing as length' but we need to know the x value

-- in addition to pattern matching with (x:xs) syntax there is something called AS PATTERNS
    -- these are used to break something up in accordance to a pattern 
    -- then binding it to names while keeing a ref tothe whole thing
    -- this is done with (@) in front of a pattern
    -- For Example: xs@(x:y:ys) is the same as (x:y:ys) but you can get the whole list as xs
capital :: String -> String
capital "" = "Empty String"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]
-- ghci> capital "Dracula"
-- "The first letter of Dracula is D"


