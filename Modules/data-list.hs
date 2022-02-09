import Data.List

-- intersperse takses a value of type a and a list of type a and puts the value between each pair of elements in the list 
intersperse' :: a -> [a] -> [a]
intersperse' v []     = [v]
intersperse' v (x:xs) = x : v : intersperse v xs 

-- intercalate takes a list of lists of type a and a list of type a. It then inserts that list between the other lists
intercalate' :: [a] -> [[a]] -> [[a]]
intercalate' x [] = [x]
intercalate' x (xs:xss) = xs : x : intercalate' x xss 

-- transpose transposes a lists of lists 
-- so if you look at a list of lists as a matrix the colums become rows and vice versa
 {-
  input          output
   [            [
    [123],       [147],
    [456],       [258],
    [789]        [369]
   ]            ]
 
 -}

-- foldl' and foldl1' are non lazy accumulator calculating versions of the other foldl functions 

-- concat flattens a list of lists into just a list of elements 
-- concat [[1,2,3],[1,2,3],[1,2,3]]
-- [1,2,3,1,2,3,1,2,3]

-- concat map is the same as mapping a function to a list then concating the list
-- concatMap (replicate 4) [1..3]
-- [1,1,1,1,2,2,2,2,3,3,3,3]

-- and takes a list of bools and returns True if all values are true
-- and $ map (>4) [5,6,7,8]

-- or like and but returns true if any values in a list are true

-- and and all take a predicate and check if any or all the elementisn in a list stisfy the preidcate

-- iterate takes a function and a starting value. then applies the function to the starting value and the function to the result and on and on. returning an infinite list

-- splitAt splits a list on the number index provided returns a tuple of the two halves

-- takeWhile takes elements from a list while the predicate is true. when an element is encountered that doesn't satisy the condition it is cut off.

-- dropWhile does the opposite. It removes from a list until the condition becomes false.

-- span is similar to takeWhile only it outputs a pair of lists. first list containing all from what takeWhile has and the other from dropWhile. span breaks when the predicate becomes false

-- break is similar to span but breaks when the predicate first becomes true
-- break p  ==   span (not . p) 
-- when using break the second list will start with the first element that met the predicate

-- sort just sorts a list. the elements must be part of the Ord typeclass because this function is a requirement for types that are instances of that typeclass

-- group takes a list and groups the adjacent elements into sublists if they are equal

-- inits and tails are like init and tail only they recursively apply that to the list untile there is nothing left. 

-- here we can fold the a list of list to find an element
-- we call tails with the list we are searching through then go over each tail and see if it starts with what we are looking for returning what we find

search :: (Eq a) => [a] -> [a] -> Bool
search needle haystack = 
 let nlen = length needle 
 in foldl (\acc x -> if take nlen x == needle then True else acc) False (tails haystack)

-- the funciton above acts like `isInfixOf`

-- isPrefixOf and isSuffixOf search of a sublist at the beginning or the end of a list

-- elem and notElem check for the existence of and element of a list

-- partition takes a list and a predicate and returns a pair of lists
-- the first list matches the second doesn't
-- this differs from span/break in that those split once they reach a match
 -- this splits into two lists going through the entire list

-- find takes a list and a predicate and returns the first element that satisfies the predicate. it retursn a Maybe value

-- elemIndex returns a Maybe of the index for the element being searched for

-- elemIndices returns a list of indices that meet the element being searched for

-- findIndex returns a Maybe for the first element to meet the predecate function passed in

-- zip/zipWith variations extend up to 8

-- lines breaks a string into lists on \n 

-- unlines does the opposite and joins list of strings with \n

-- words and unwords are for splitting lines of text into words or joining a list of words into text string

-- nub removes any duplicates and only returns the unique items 

-- delete takes and element and list and deletes first occurence 

-- (\\) is the list diff func. For every element in the right hand list remove a matching one in the left. Used as an infix 

-- union acts like a function on sets. returns the union of two lists. duplicates are removed from the second list. used as infix

-- intersect returns only the lements found in both lists. used as infix 

-- insert takes an element and list that can be sorted and inserts the element into the last position where its still less or equal to the next element in the list. it will do so at the first encountered spot. 

-- genericTake/Drop/SplitAt/Index/Length/Replicate are generic Integral/Num returning versions of their stricter cousins

-- nubBy/deleteBy/unionBy/intersectBy/groupBy are generic counterparts. Diff being the nongeneric use == to test Equality why By also take an equality function then compary them by that equality
-- basically groupBy would allow you to pass in a grouping function as opposed to just group which just groups similar adjascent 

-- sortBy/insertBy/maximumBy/minimumBy take a function that determine if one element is GT LT EQ the other




