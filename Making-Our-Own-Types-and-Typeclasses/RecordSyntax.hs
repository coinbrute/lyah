module RecordSyntax 
 ( 
  Person
 ) where

-- now we are looking at record syntax which is a way of looking up "object" data in a haskell way
-- this chapter builds a data type describing a person with information describing a person
-- traditional way
data Person' = Person' 
              String -- fn
              String -- ln
              Int -- age
              Float -- height
              String -- phone
              String -- ice cream
              deriving (Show)
-- getters 
firstName' :: Person' -> String  
firstName' (Person' firstname' _ _ _ _ _) = firstname'  
  
lastName' :: Person' -> String  
lastName' (Person' _ lastname' _ _ _ _) = lastname'  
  
age' :: Person' -> Int  
age' (Person' _ _ age' _ _ _) = age'  
  
height' :: Person' -> Float  
height' (Person' _ _ _ height' _ _) = height'  
  
phoneNumber' :: Person' -> String  
phoneNumber' (Person' _ _ _ _ number' _) = number'  
  
flavor' :: Person' -> String  
flavor' (Person' _ _ _ _ _ flavor') = flavor'  

-- record syntax 
-- this syntax allows for quick lookup by defining a field and data type for it. It mimics a suod json syntax and uses the :: to give the field a type encompasing all of it in {}
data Person = Person {
 firstName     :: String 
 , lastName    :: String
 , age         :: Int 
 , height      :: Float 
 , phoneNumber :: String 
 , flavor      :: String 
} deriving (Show)
-- Haskell automatically gives functions to get each of these fields 
-- another benefit to record syntax is deriving show will display different when using it. 
-- *RecordSyntax> let p = Person {firstName="Drew", lastName = "Duf", age = 31, height = 74.5, phoneNumber = "XXXXXXXXXX", flavor="Mint"}
-- *RecordSyntax> firstName p
-- "Drew"

