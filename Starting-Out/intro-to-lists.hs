-- Lists are considered homogenous data structures
-- This means they can store many of ONE data type
-- lists of Integers are OKAY
-- lists of characters are OKAY
-- lists of lists are OKAY
-- lists of Integers and characters are NOT OKAY


-- in GHCI use the 'let' keyword to define a name/definition in the console
-- 'ghci> let a = 1' is the same as 'a = 1' in a script file

-- lists are denoted by square brackets [] with element values separated by commas ','
lostNumbers = [4,8,15,16,23,42]

-- Strings are just lists of characters so the following two are equal
strLst = "hello"
chrLst = ['h','e','l','l','o']
strEqChr = strLst == chrLst
-- ghci> strEqChr
-- True

-- appending lists is easy with (++)
newLst = strLst ++ chrLst
appendedLst = [1,2,3,4] ++ [5,6,7,8]
chrAppended = ['a','b','c'] ++ ['d','e','f']

-- careful using (++) on very long lists as Haskell goes from left first with the entire list
-- use the (:) to append anything to the front of the list very efficiently and fast
appendWCol = 'A': " SMALL CAT"
addMoreNums = 1:[2,3,4,5]
addIndivNums = 1:2:3:4:5:[]
-- the main difference is that (:) takes a single thing and a list of things 
-- while (++) takes two lists

-- [1,2,3] is just syntactic sugar for 1:2:3:[] 
-- where [] is an empty list being passed in as the right arg for the final call to (:)


-- Note: [], [[]] and[[],[],[]] are all different things. 
-- The first one is an empty list 
-- the seconds one is a list that contains one empty list
-- the third one is a list that contains three empty lists.

-- getting an element can be done with the (!!) operation
-- lists are 0 index based so pass in the index to grab 
eFromStrList = strLst !! 1
thirdIdxFromAppendedLst = appendedLst !! 2
-- this will output an error if index is too large

-- lists can also be nested
nestedLst = [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]
nestedLstAppended = nestedLst ++ [[1,1,1,1]]
nestedLstMore = [6,6,6]:nestedLst
thirdIdxNestedLst = nestedLst !! 2

-- nested lists follow the same type conventions as non-nested lists. 
-- you CANNOT have a list that has some lists of chars and some of integers

-- Lists can be compared if the values inside can be compared using (>) (<) (>=) (<=) (==)
-- these are compared lexicographically so head then index 1 then 2 so on and so forth
{-
    ghci> [3,2,1] > [2,1,0]  
    True  
    ghci> [3,2,1] > [2,10,100]  
    True  
    ghci> [3,4,2] > [3,4]  
    True  
    ghci> [3,4,2] > [2,4]  
    True  
    ghci> [3,4,2] == [3,4,2]  
    True  
-}

-- Some basic functions to grab portions of a lists body
testList = [1,2,3,4,5]
-- head returns the first thing in a list
getHead = head testList -- 1
-- tail returns the rest of the list after the head
getTail = tail testList -- [2,3,4,5]
-- last returns the last thing in a list
getLast = last testList -- 5
-- init returns everthing but the last thing
getInit = init testList -- [1,2,3,4]
-- These functions cannot handle empty lists and WILL throw an error for empty list

-- length returns the length of the list
getLength = length testList -- 5
-- null checks if a list is empty, outputs True otherwise it returns False
    -- best practice is to use this instead of xs == []
getNull = null testList -- False
-- reverse will reverse a list
getReverse = reverse testList -- [5,4,3,2,1]
-- take will take 2 parameters a number and list and output the number of values from the front of the list
takeFrom = take 3 testList -- [1,2,3]
    -- if you pass in a number larger than the length of the list it will output the entire list
    -- if you pass in 0 it will output an empty list
-- drop will take 2 parameters a number and a list and 
    -- drop that many values from the front of the list and output the remaining list
dropFrom = drop 3 testList -- [4,5]
    -- if you pass in a number larger than the length of the list an empty list is output as all values have been dropped
    -- if you pass in 0 it will return the entire list
-- maximum outputs the maximum value in a list
getMaximum = maximum testList -- 5
-- minimum outputs the minimum value in a list
getMinimum = minimum testList -- 1
-- sum takes a list of Numbers and sums it
getSum = sum testList -- 15
-- product takes a list of Numbers and gets the product
getProduct = product testList -- 120
    -- important to note if there is a 0 in your list the product will always be zero cuz duh
-- elem takes a 'thing' and a list of 'things' outputs True if its in the list, otherwise False
    -- elem is typically used as an infix function
checkElem3 = 3 `elem` testList -- True

