-- its always good practice in any programming language to split your code up and to group tyour work by similar functionality. This way you can export and easily reuse those functions in other applicaitons by a simple import statement. 

-- Up until now I have been naming my files the title of each chapter and naming them with lower case. This is not great practice. 

-- In order for the script file to be a module and export its contents it needs to be a match to the module name inside. 

-- The Geometry.hs file will export a module titled Geometry and will hold funcitons common to geometry 

{-
 the syntax for exporting specific items is as follows
 module Geometry
 ( function1
 , function2
 , function3
 ) where
-}

-- to import our module in another module we use import Geometry

-- Geometry.hs has to be in the same folder that the program importing is is in though. 

-- Modules can also have heirarchy. 

-- modules can have sub-modules which can have sub-modules of their own.

-- to do so make a directory with the primary module name capitalized 

-- then the sub module files capitalized inside 
 -- Geometry/
  -- Sphere.hs
  -- Cuboid.hs
  -- Cube.hs

-- in the sub modules you state the module name with the parent module first 

-- module Geometry.Sphere
-- module Geometry.Cuboid
-- module Geometry.Cube