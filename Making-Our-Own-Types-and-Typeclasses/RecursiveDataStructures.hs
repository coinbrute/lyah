module RecursiveDataStructures where

import Data.List
-- Recursive data structures are types whose constructors have fields that are of the same type. 

-- take a list
 -- 5:[] is saying a List of type int and List
-- data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)

-- the Cons is another word for (:)

-- to auto define functions as infix they need to be special characters only and adhere ot special sytax for the type declarations see below 

infixr 5 :-:  
data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)
{-
ghci> 3 :-: 4 :-: 5 :-: Empty  
(:-:) 3 ((:-:) 4 ((:-:) 5 Empty))  
ghci> let a = 3 :-: 4 :-: 5 :-: Empty  
ghci> 100 :-: a  
(:-:) 100 ((:-:) 3 ((:-:) 4 ((:-:) 5 Empty)))  
-}

infixr 5  .++  
(.++) :: List a -> List a -> List a   
Empty .++ ys = ys  
(x :-: xs) .++ ys = x :-: (xs .++ ys)  

-- another important feature to grasp in algorithmic programming and functional programming is the binary search tree. 

-- an element points to two elements,
 -- one on its left and one on its right.
  -- the lement on the left is small the lement on the right is bigger
  -- those elements can each point to two elements or one or none

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
 | x == a    = Node x left right
 | x < a     = Node a (treeInsert x left) right
 | x > a     = Node a left (treeInsert x right)
 | otherwise = error "Incorrect expression."

treeElem :: (Ord a) => a -> Tree a -> Bool 
treeElem x EmptyTree = False 
treeElem x (Node a left right)
 | x == a    = True 
 | x < a     = treeElem x left
 | x > a     = treeElem x right
 | otherwise = error "Incorrect expression." 

-- ghci> let nums = [8,6,4,1,7,3,5]  
-- ghci> let numsTree = foldr treeInsert EmptyTree nums  
-- ghci> numsTree  
-- Node 5 (Node 3 (Node 1 EmptyTree EmptyTree) (Node 4 EmptyTree EmptyTree)) (Node 7 (Node 6 EmptyTree EmptyTree) (Node 8 EmptyTree EmptyTree))  
-- ghci> 8 `treeElem` numsTree  
-- True  
-- ghci> 100 `treeElem` numsTree  
-- False  
-- ghci> 1 `treeElem` numsTree  
-- True  
-- ghci> 10 `treeElem` numsTree  
-- False  

