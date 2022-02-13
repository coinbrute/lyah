module YesNoTypeclass where

import RecursiveDataStructures ( Tree(EmptyTree) ) -- we only need the Empty Tree definition from the Tree data type constructor
import Typeclasses102 (TrafficLight (Red)) -- similarly we only use the Red Type constructor from the TrafficLight data type constructor

-- In this we will attempt to work a typeclass out to implement a Javascript-ish yes-no type boolean behavior that is seen in the if/then/else JS behavior of evaluating boolean expressions.

-- we start with defining our typeclass
 -- one function will be declared taking the type being created as an instance and returning a Bool
class YesNo a where
 yesno :: a -> Bool

-- now lets define some instances that JS would be able to evaluate in if/then/else scenarios
instance YesNo Int where
 yesno 0 = False 
 yesno _ = True 

instance YesNo [a] where
 yesno [] = False 
 yesno _  = True 

-- for this one we use a standard library functions (id) which just returns the parameter given to the function
instance YesNo Bool where
 yesno = id

-- here is one for Maybe values
 -- we don't need a class constraint since we make no assumptions about the value of the Maybe within. 
 -- we just say if its Just then its true else False
instance YesNo (Maybe a) where
 yesno (Just _) = True
 yesno Nothing  = False

-- we can say similar things about Trees if we don't make any assumptions about what they contain
 -- I am using the Tree data type imported from RecursiveDataStructures
instance YesNo (Tree a) where
 yesno EmptyTree = False
 yesno _         = True 

-- we can also define a TrafficLight in this way from Typeclasses102
instance YesNo TrafficLight where
 yesno Red = False 
 yesno _   = True

-- some examples of usage now
{-
*YesNoTypeclass> yesno $ length []
False
*YesNoTypeclass> yesno "haha"
True
*YesNoTypeclass> yesno ""
False
*YesNoTypeclass> yesno $ Just 0
True
*YesNoTypeclass> yesno True
True
*YesNoTypeclass> yesno EmptyTree
False
*YesNoTypeclass> yesno []
False
*YesNoTypeclass> yesno [0,0,0]
True
*YesNoTypeclass> :t yesno
yesno :: YesNo a => a -> Bool
-}

-- now lets make a checker function that takes an instance value then two options for return statements a yes and no
 -- if the value is trueish it returns the first thing else it returns the second 
yesnoIf :: (YesNo yn) => yn -> a -> a -> a 
yesnoIf val y n = if yesno val 
                  then y
                  else n 

{-
ghci> yesnoIf [] "YEAH!" "NO!"  
"NO!"  
ghci> yesnoIf [2,3,4] "YEAH!" "NO!"  
"YEAH!"  
ghci> yesnoIf True "YEAH!" "NO!"  
"YEAH!"  
ghci> yesnoIf (Just 500) "YEAH!" "NO!"  
"YEAH!"  
ghci> yesnoIf Nothing "YEAH!" "NO!"  
"NO!"
-}