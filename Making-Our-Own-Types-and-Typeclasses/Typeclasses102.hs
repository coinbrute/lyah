module Typeclasses102 where

-- we have looked at standard type classes and what is in them.
-- learned how to make our own type instances of the standard type classes by deriving those instances for us
-- created new data types and created instancs of type classes to inherit functionality of specific type classes 
-- now we will make our own type classes and make instances of them manually. basically all the above but with our own custom type classes

-- For example there is the Eq type class for things that need to be equated. like Person == Person. 
 -- In that case Person needs to be an instance of Eq

-- here is how Eq is defined in Prelude
{-
class Eq a where
 (==) :: a -> a -> Bool
 (/=) :: a -> a -> Bool
 x == y = not (x /= y)
 x /= y = not (x == y)
-}

-- new syntax here to go through
 -- class Eq a where 
  -- says "this is a new typeclass called Eq where a plays the role of the type that will be created as the instance of Eq to inherit and use all of its functionality."
  -- (a) can be whatever you like it to be named its just a placeholder
 -- then we define several functions to outline the functionality of the typeclass 
  -- it is not required to implement the bodies just the type declarations as polymorphism allows each instance to define their own variation
-- on its own a typeclass can't do much but once its been derived as an instance of a type then you have the ability to use the functions within the typeclass

-- so here is a data type that we will create and then make an instance for Eq with defining some baseline functionality with Eq's (==) function
data TrafficLight = Red | Yellow | Green'

instance Eq TrafficLight where 
 Red == Red = True 
 Green' == Green' = True 
 Yellow == Yellow = True 
 _ == _ = False

-- above we made a new data type TrafficLight that has three options Red/Yellow/Green'
-- then made an instance of Eq using the TrafficLight data type as the (a) value for the Eq typeclass 
-- now we can call functions from Eq with the definitions given in our instance 
-- *Main> Red == Red
-- True
-- *Main> Green' == Red
-- False
-- *Main> Yellow /= Red
-- True
-- ghci> Red `elem` [Red, Yellow, Green]  
-- True  

-- We can implement instances for all kinds of typeclasses 
instance Show TrafficLight where 
 show Red    = "Red light"
 show Yellow = "Yellow light"
 show Green' = "Green light"

-- again this opens up more functions for our TrafficLight
-- ghci> [Red, Yellow, Green]  
-- [Red light,Yellow light,Green light]

-- you can also make typeclasses that are subclasses of others. Think class constraints in a function
-- the syntax is as follows 
-- class (TypeA a) => TypeB a where
 -- ...
-- this is like saying that before we can make (a) and instance of TypeB it has to be an instance of TypeA. 
-- so
 -- class (Eq a) => Num a where   
  -- this means that before we can make (a) an instance of Num our (a) needs to be an instance of Eq

-- using this would be something like comparing a Maybe value
-- the main issue with getting here is you need a concrete type and Maybe by definition is not a concrete type. 
{-
instance (Eq m) => Eq (Maybe m) where
 Just x == Just y = x == y
 Nothing == Nothing = True
 _ == _ = False
-}
-- also just like :t gives the definition for a functions 
-- :info does this for a typeclass
