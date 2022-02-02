-- lambdas are anonymous functions intended for one time use
-- normally it is made with intention to be passed to a higher order function
-- to make a lambda the (\) backslash is used
    -- then the parameters separated by spaces
    -- then (->) and the lambda function body
-- surround the lambda in () so they don't extend all the way to the right

-- in the previous section for numOfLongChains we used a where clause 
    -- that could be replaced with a lambda
chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
    | even n = n:chain (n `div` 2)
    | odd n  = n:chain (n*3 + 1)

numOfLongChains :: Int 
numOfLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))
-- lambdas are just expressions and can be passed in like any other expression
    -- (\xs -> length xs > 15) is the lambda 
    -- it will return if the length of the list is greater than 15
-- like normal functions lambdas can take any number of parameters
weirdMath :: [Float]
weirdMath = zipWith (\a b -> (a * 30 + 3) / b) [5,4,3,2,1] [1,2,3,4,5]

lambdaPM :: [Int]
lambdaPM = map (\(a,b) -> a + b) [(1,2),(3,5),(6,3),(2,6),(2,5)] 

-- unless you want the lambda curried all the way to the right put them in parentheses
-- these two are identical due to currying
addThree :: (Num a) => a -> a -> a -> a 
addThree x y z = x + y + z

addThreeL :: (Num a) => a -> a -> a -> a
addThreeL = \x -> \y -> \z -> x + y + z 
-- looking at this function we can tell pretty straightforward what the type definition is
    -- this implementation is not good to look at though
flipL :: (a -> b -> c) -> b -> a -> c
flipL f = \x y -> f y x 
-- again personally not a huge fan of this syntax as I find this more readable
flip' :: (a -> b -> c) -> b -> a -> c
flip' f x y = f y x 
