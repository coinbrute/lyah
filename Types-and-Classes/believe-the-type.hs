-- as mentioned Haskell is statically typed 
-- this means that every expression is known by the compiler at compile time
-- '5 / True' Will not compile for this reason 

-- Different from Java, Haskell also has type inference 
-- This means you DO NOT have to explicitely write the type of a function or expression

-- in GHCI ':t <expr>' will output the corrosponding type
{-
    ghci> :t 'a'  
    'a' :: Char  
    ghci> :t True  
    True :: Bool  
    ghci> :t "HELLO!"  
    "HELLO!" :: [Char]  
    ghci> :t (True, 'a')  
    (True, 'a') :: (Bool, Char)  
    ghci> :t 4 == 5  
    4 == 5 :: Bool  
-}
-- (::) is read as "Has type of"
-- so 'a' :: Char is read as 
    -- "a has type of Char"

-- explicit types are always denoted with the first letter in Capital
    -- Char
    -- Bool
    -- Number
    -- Integer
    -- Float

-- Functions also have types and it is best practice to define them on the line before implementation
-- syntax is 
    -- funcName :: Type1 -> Type2
removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]
-- seen above removeNonUppercase has type of "[Char] -> [Char]"
    -- this means it takes an input value of type [Char]
    -- and outputs [Char]

-- how about multiple parameters?
-- Same concept just continue listing them in a row
    -- this is because Haskell does not distinguish between input types and return types
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z 

-- Some Common Types

-- Int short for integer is used for whole numbers.
    -- bounded to 32-bit values
seven = 7 :: Int 
-- Integer also integer but not bounded so can be stupid big
    -- Int is more effecient
factorial :: Integer -> Integer
factorial n = product [1..n]

hugeInteger = factorial 50 :: Integer 
-- Float is floating point with single precision
floatPi = pi :: Float
-- Double is a floating point with double the precision
doublePi = pi :: Double
-- pi here is a math function to return the value of PI
-- Bool is boolean. Can be True or False
isTrue = True :: Bool
-- Char represents characters and is denoted by ''
aChar = 'a' :: Char
-- Strings are lists of Chars
aString = "Hello" :: String 

-- Tuples are types but they are dependent upon length and the inner types of their components
-- and empty tuple is a type though denoted by () and can only have a single value ()
emptyTuple = () :: ()


