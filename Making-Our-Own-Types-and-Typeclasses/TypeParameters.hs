module TypeParameters where

-- all a type parameter is is an argument a type takes within its constructor to produce its types 
-- Take maybe as an example 
-- data Maybe a = Nothing | Just a
-- in order to produce a Maybe value you need to supply a value of (a)
-- (a) is the type parameter. 
-- because there is a type parameter this is a type constructor

-- another example of parameterized types is with Maps and key/values
-- the k is the type of the keys and the v is the types of the values
 -- just make sure the key is part of Ord
-- add constraints to data type same way you define functions with (=>)
-- this is bad practice and not good or commonplace at all. 
 -- it puts extra constraints on functions downstream that dont need it. 

-- practice time using an example with a 3d vector 
data Vector a = Vector a a a deriving (Show) 

-- add two vectors together 
-- add their corresponding components 
vPlus :: (Num v) => Vector v -> Vector v -> Vector v 
(Vector x1 y1 z1) `vPlus` (Vector x2 y2 z2) = Vector (x1 + x2) (y1 + y2) (z1 + z2)

-- multiply each component by a value
vectMult :: (Num t) => Vector t -> t -> Vector t
(Vector x y z) `vectMult` m = Vector (x*m) (y*m) (z*m)

-- multiply two vectors together by multiplying corrosponding components
scalarMult :: (Num t) => Vector t -> Vector t -> t
(Vector x1 y1 z1) `scalarMult` (Vector x2 y2 z2) = x1*x2 + y1*y2 + z1*z2  

