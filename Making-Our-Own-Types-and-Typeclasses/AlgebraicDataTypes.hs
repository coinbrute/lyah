module AlgebraicDataTypes 
 ( Point(..)
 , Shape(..)
 , surface
 , nudge
 , baseCircle
 , baseRect
 ) where
-- things are heating up in the world of haskell programming for us. 

-- its time to start creating our own data types and type classes. 
-- we use the data keyword to define a type. 
 -- look at Bool as an example
data Bool' = False | True
-- data means new data type 
-- the part before (=) means what the type will be
-- then after are the value constructors
-- this says that the Bool' data type can either be False OR True since it uses the (|) operator 

-- lets make a shape data type with options for a Circle and a rectangle 
-- remember thinking as abstract as possible for construction of each 
-- data Shape = Circle    Float Float Float -- the x and y coordinates for center and the radius will create the circle 
--            | Rectangle Float Float Float Float -- the x and y coordinates for upper left as well as x and y for lower right will build any four sided shape
--            deriving (Show)
data Shape = Circle    Point Float -- the x and y coordinates for center and the radius will create the circle 
           | Rectangle Point Point -- the x and y coordinates for upper left as well as x and y for lower right will build any four sided shape
           deriving (Show)


-- now we can can make functions that work with Shape's as types 
surface :: Shape -> Float 
surface (Circle    _             r            ) = pi * r ^2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = abs (x2 - x1) * abs (y2 - y1)

-- we can also do cool stuff with partial application and data construction on lists 
-- say you want to construct a a rippling effect 
-- ghci> map (Circle 10 20) [4,5,6,6.5]
-- [Circle 10.0 20.0 4.0,Circle 10.0 20.0 5.0,Circle 10.0 20.0 6.0,Circle 10.0 20.0 6.5]

-- Its important to define your types clearly to not introduce confusion into code. For that lets improve the Shape data type by creating a point data type for the coordinates used for construction
data Point = Point Float Float deriving (Show)
-- I am using a Point to Construct a Point only because there is not multiple options to choose from like with shape. Dont let this trip you up. 

-- now above I am updating the Shaped data type to reflect the usage of this new point type.
-- I also am updating the surface function in order to make use of the new Shape data type usage.

-- what about a function to move the given shape a certain amount on given axis. 
-- so take a Shape, amount to move on axis x and amount for axis y. then output a new Shap same dimensions but located in the new coordinates
nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) a b = Circle (Point (x + a) (y + b)) r 
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1 + a) (y1 + b)) (Point (x2 + a) (y2 + b))

-- if you want a baseline shape initialized on center
baseCircle :: Float -> Shape
baseCircle r = Circle (Point 0 0) r

baseRect :: Float -> Float -> Shape
baseRect width height = Rectangle (Point 0 0) (Point width height)