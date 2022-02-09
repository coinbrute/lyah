-- a haskell module is a collection of related functions types and typeclasses. 

-- a program is a collection of modules where the main one loads up the others then uses their functiosn to do something

-- splitting them up makes the whole thing manageable and easier to work with since each has sume specific piece of functionality

-- importing modules is done similar to imperative programming via the import statement preceeding the rest of the code

-- this module houses useful list operations and functions types and typeclasses
-- importing allows all exported members to be available 
import Data.List

-- nub is a function that weeds out duplicates in a list
numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub -- == \xs -> length (nub xs)

-- you can also add modules globally to GHCi with :m + <module1> <module2>

-- to import specific functions from a module use () after the module name 
-- import Data.List (sort)
-- you can also do all except by
-- import Data.List hiding (sort)

-- the way of dealing with conflicting imports is by marking one qualified. 
-- this is the same way you handle beans in Spring
-- import qualified Data.Map
-- this means you need the full qualified name for the functions 
-- or give it a name 
-- import qualified Data.Map as M
-- now its just M like M.filter






