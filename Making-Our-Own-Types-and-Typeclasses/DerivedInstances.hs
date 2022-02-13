module DerivedInstances where

-- all that deriving we have been doing on the data types in other script files. thats been deriving functionality from those typeclasses

-- example the Int type is an instance of the Eq type class because the Eq typeclass defines behavior for stuff that can be equated. 
 -- since integers can be equated Int is part of the Eq typeclass
 -- if a type derives functions from the Eq typeclass namely == and /= then we can use those functions with values of that type. hence why 4 == 4 or "foor" /= "bar" compile

-- typeclasses are more like interfaces outlining a set of functinos and behaviors other types and typeclasses can use 

-- example time with a person
data Person = Person { 
 firstName :: String 
 , lastName :: String
 , age :: Int 
} deriving (Eq, Show, Read) 

-- since we derived Eq for the Person type we can compare them with == of /=
-- Haskell looks at the value constructors for a match and then checks if all data contained matches by testing each pair of fields with ==. 
-- only catch is containing fields need to be of Eq as well 
mikeD :: Person
mikeD = Person {firstName = "Michael", lastName = "Diamond", age = 43}  
adRock :: Person
adRock = Person {firstName = "Adam", lastName = "Horovitz", age = 41}  
mca :: Person
mca = Person {firstName = "Adam", lastName = "Yauch", age = 44}  
-- ghci> mca == adRock  
-- False  
-- ghci> mikeD == adRock  
-- False  
-- ghci> mikeD == mikeD  
-- True  
-- ghci> mikeD == Person {firstName = "Michael", lastName = "Diamond", age = 43}  
-- True 
beastieBoys :: [Person]
beastieBoys = [mca, adRock, mikeD]

-- show and read are type classes for things that can be converted to or from string. 
-- they are useful for print to or reading into strings from number formats so quite useful for formatting 

-- show is for converting from a type to a string 
-- read is for converting from a string to a type

-- the Ord type class is for things that can be ordered. i.e. comparisons. True false booleans fall into this category. 
-- data Bool = False | True deriving (Ord)

-- Enum and bounded become useful for making enumeration type classes.
 -- things with predecessors and successors is used in the Enum
-- think days of the week
data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday deriving (Eq, Ord, Show, Read, Bounded, Enum)
-- we can use Eq to compare equality of versions 
-- we can use Ord to order the different instances 
-- we use Show and Read to convert to and from Strings 
-- we use Bounded and Enum to define predecessor Successors and min and max values
-- ghci> Wednesday  
-- Wednesday  
-- ghci> show Wednesday  
-- "Wednesday"  
-- ghci> read "Saturday" :: Day  
-- Saturday 
-- ghci> Saturday == Sunday  
-- False  
-- ghci> Saturday == Saturday  
-- True  
-- ghci> Saturday > Friday  
-- True  
-- ghci> Monday `compare` Wednesday  
-- LT
-- ghci> minBound :: Day  
-- Monday  
-- ghci> maxBound :: Day  
-- Sunday 
-- ghci> succ Monday  
-- Tuesday  
-- ghci> pred Saturday  
-- Friday  
-- ghci> [Thursday .. Sunday]  
-- [Thursday,Friday,Saturday,Sunday]  
-- ghci> [minBound .. maxBound] :: [Day]  
-- [Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday] 