-- tuples can be thought of similarly to lists
-- the can hold several values and store them in a single structure

-- there are some key differences
-- with a list a list of numbers is just that
-- Tuples give you more information along with the type signature
-- you know the amount of values in a tuple and their kind
-- Tuples are denoted by parentheses and values are comma separated

-- Tuples are non-homogenous as well 
-- (1,"one") is a valid tuple

-- think about vectors and Haskell.
-- you could use a list
twoDVectorLst = [[1,2],[8,11],[4,5]]
-- problem here is we could end up adding a value to the middle of one of these nested lists
-- end up with something like [[1,2],[8,11,5],[4,5]]
-- that would be totally valide syntactically

-- with tuples they are size defined 
-- so a vector list of tuples would give an error if a 3rd value was attempted
twoDVectorTuples = [(1,2),(8,11),(4,5)]
-- if something like this was tried [(1,2),(8,11,5),(4,5)]
    -- this error would show: 
    -- Couldn't match expected type `(t, t1)'  
    -- against inferred type `(t2, t3, t4)'  
    -- In the expression: (8, 11, 5)  
    -- In the expression: [(1, 2), (8, 11, 5), (4, 5)]  
    -- In the definition of `it': it = [(1, 2), (8, 11, 5), (4, 5)]  
-- this says basically that the tuples in the list are expected to be a "Pair" type
-- and it found a "triple"
-- it expects "pairs" of type t and t1 as it saw that in the first element
-- it also wouldn't work to input a list of tuples with one tuple containing (1,1) and the next containing ('a',1)
    -- this is because even though these are both pairs
    -- they are not of the same type internally

-- with tuples you get to know what is in them and how big they will be 
    -- they are a very rigid data structure
-- because of this you cant have a function just appending to a tuple
    -- you need one for each kind of tuple you plan to interact with

-- you can compare tuples to each other like you can with lists 
    -- the caveat here is that like lists the components within a tuple must be able to be compared
    -- you cannot compare tuples of:
        -- different sizes

-- Tuple Pair functions

testTuple1 = (1,"one")
testTuple2 = (2,"two")
-- fst takes a tuple pair and returns the first component
getFst = fst testTuple1
-- 1

-- snd takes a tuple pair and returns the second component
getSnd = snd testTuple1
-- "one"

-- The above two functions will only work with tuple pairs 

-- zip takes two lists and produces a list of tuple pairs from them
zipLists = zip [1,2,3] ['a','b','c']
-- [(1,'a'),(2,'b'),(3,'c')]
-- as seen it traverses the lists pairing each element up as it goes along
-- if one list is longer it will cut the rest of that list off and only pair the shorter list


-- Example with both list comprehension and tuples 
-- Get the right triangle that has integers for all sides
-- AND all sides equal to or small than ten
-- AND has a perimeter of 24
-- First generate all triangles with sides <=10 into a list of tuple triples
triangles = [(a,b,c) | a <- [1..10], b <- [1..10], c <- [1..10]]
-- (a,b,c) represents the sides of the triangle
-- the specific list generated will contain all tuples of generated triangles
rightTriangles = [(a,b,c) | a <- [1..10], b <- [1..10], c <- [1..10], a^2 + b^2 == c^2]
-- to get right triangles we add a predicate to check for pythagoreans theorum 
specialRTriangles = [(a,b,c) | a <- [1..10], b <- [1..10], c <- [1..10], a^2 + b^2 == c^2, a+b+c == 24]
-- now to get the final solution we add a second predicate to look for perimeters == 24
-- [(6,8,10)]

