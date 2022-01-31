-- ranging allows for quick and easy creation of a list between two values
-- ranges are a way of making lists that can be enumerated
    -- numbers and chars can be enumerated through
-- the (..) is used between the two values to create the list

-- to make 1-20
oneTo20 = [1..20]
-- to make A-Z
aToZ = ['A'..'Z']

-- ranging also allows to create stepped lists
-- this is done by separating the first 2 values by a comma to denote the step
-- you can only specify one step
-- so [1,2,4,8,16..100] is not valid
oddsUpTo10 = [1,3..10]
-- this works for characters as well
everyOtherChar = ['A','C'..'Z']
-- to make a desc list using ranging specify the step first
descLst = [20,19..1]
-- floating point numbers behave strangly because they are not precise
-- they can produce some strange results
pt1To1 = [0.1,0.3..1] 
-- [0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]  
-- just don't use them in ranged lists

-- infinite lists are useful with ranges since you can make them by not specifying an end range
fst24MultOf13 = take 24 [13,26..] 
-- take the first 24 of the infinite list of multiples of 13 created by [13,26..]
-- infinite lists are useful in Haskell because it is a lazy language
-- it won't attempt evaluation on the list until it needs a value from it
-- at that point it will get only what it needs.

-- some infinite list functions

-- cycle takes a list and cycles it into an infinite list
-- just calling 'cycle xs' will attempt to display the list forever 
-- typical usage is to do something with the cycled list
take10FromCycledLst = take 10 (cycle [1,2,3])
-- [1,2,3,1,2,3,1,2,3,1]

-- repeat will take a value and repeat indefinitely.
-- works the same as cycle but with a value instead of a list
take10FromRepeatedVal = take 10 (repeat 5)
-- [5,5,5,5,5,5,5,5,5,5]
-- NOTE: it is simpler syntactically to use replicate when you just want to repeat a value
replicate10From5 = replicate 10 5
-- [5,5,5,5,5,5,5,5,5,5]



