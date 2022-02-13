-- we have played with a lot of different things now. We have played with more concrete and easy to grasp typeclasses like
 -- Ord for things that need ordering
 -- Eq for things that need to be compared
 -- Num for things that relate to Numbers 
 -- Read to convert a string to a value of some type
 -- Show for converting from some type to a string 
 -- Maybe for dealing with values that may or may not exist 
 
-- Now lets talk about something a bit more abstract. 
-- The Functor typeclass is for things that can be mapped over
 -- this means that anything that can have a function applied to elements or values then a Functor type instance may work. 
  -- The List type is a good example 
  -- You can map over elements in a list and apply a function to each element. 
  -- The list type is part of the Functor typeclass

-- here is how haskell defines Functor
 -- class Functor f where
 -- fmap :: (a -> b) -> f a -> f b

-- so fmap essentially takes a functions and some thing and then applies that function to that thing and returns a new thing 

-- here are some examples 
-- instance Functor [] where 
--  fmap = map
-- map :: (a -> b) -> [a] -> [b]  
-- ghci> fmap (*2) [1..3]  
-- [2,4,6]  
-- ghci> map (*2) [1..3]  
-- [2,4,6]  

-- Functors don't just need to be used with lists though
 -- they can be used with individual values like a Maybe as well 

{-
instance Functor Maybe where
 fmap f (Just x) = Just (f x)
 fmap f Nothing = Nothing

ghci> fmap (++ " HEY GUYS IM INSIDE THE JUST") (Just "Something serious.")  
Just "Something serious. HEY GUYS IM INSIDE THE JUST"  
ghci> fmap (++ " HEY GUYS IM INSIDE THE JUST") Nothing  
Nothing  
ghci> fmap (*2) (Just 200)  
Just 400  
ghci> fmap (*2) Nothing  
Nothing 
-}

-- we think of them like a box that can hold values either all empty all full or some empty some full 
-- coincidentally this is what a tree is 
{-

instance Fucntor Tree where 
 fmap f EmtpyTree = EmptyTree
 fmap f (Node x leftsub rightsub) = Node (f x) (fmap f leftsub) (fmap f rightsub)

ghci> fmap (*2) EmptyTree  
EmptyTree  
ghci> fmap (*4) (foldr treeInsert EmptyTree [5,7,3,2,1,7])  
Node 28 (Node 4 EmptyTree (Node 8 EmptyTree (Node 12 EmptyTree (Node 20 EmptyTree EmptyTree)))) EmptyTree  

-}

-- Either can be thought of similarly as well. 
{-
instance Functor (Either a) where
 fmap f (Right x) = Right (f x)
 fmap f (Left x) = Left x

wait a minute why are we only applying f in one of the cases above? 

because if you look at the definition of either you see that we need to define these distinctly othewise they would end up being the same 
data Either a b = Left a | Right b

we can also think of the box analogy with left being the empty box and not applying anything 



-}


