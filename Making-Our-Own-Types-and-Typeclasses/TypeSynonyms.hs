module TypeSynonyms where 
import qualified Data.Map as Map

-- when we say that String is a [Char] that is becuase of Type Synonyms
-- type String = [Char]
-- that would be the definition of that synonym 

-- the type keyword can mislead some since there is nothing new being created. 
-- data creates type references a data type. confusing i know

-- lets take a look at wallets again this time with some synonyms
type AdaAmount = String 
type WalletKey = String 
type WalletBook = [(WalletKey,AdaAmount)]
walletBook :: [(WalletKey, AdaAmount)]
walletBook =
 [("x123","10")
 ,("x234","15")
 ,("x345","20")
 ,("x456","25")
 ,("x567","43")
 ,("x678","35")] 

inWalletBook :: WalletKey -> AdaAmount -> WalletBook -> Bool 
inWalletBook key amount wbook = (key, amount) `elem` wbook

-- without type synonyms the type signature would be basically all strings...not ideal

-- we can also partially apply type constructors just as we would any other function as calling these are just calling functions 
-- the following are equivilant 
{-
type IntMap v = Map Int v
type IntMap = Map Int
-}

-- Either is another type that takes type types as paramethers 
-- data Either a b = Left a | Right b deriving (Eq, Ord, Read, Show)

-- a more practical example of an Either state
-- we make a data type to say whether a locker is taken or free and a synonym for the code
-- then a type to map the lockers
data LockerState = Taken | Free deriving (Show, Eq)
type Code = String 
type LockerMap = Map.Map Int (LockerState, Code)

lockers :: LockerMap
lockers = Map.fromList 
 [(100,(Taken,"ZD39I"))  
 ,(101,(Free,"JAH3I"))  
 ,(103,(Free,"IQSA9"))  
 ,(105,(Free,"QOTSA"))  
 ,(109,(Taken,"893JJ"))  
 ,(110,(Taken,"99292"))
 ]

-- perform a lookup of a map
 -- if we get Nothing return a left Strign value to say ther is no locker there else return the right code.
lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber map = 
  case Map.lookup lockerNumber map of
   Nothing -> Left $ "Locker number " ++ show lockerNumber ++ " doesn't exist!"
   Just (state, code) -> if state /= Taken
                         then Right code
                         else Left $ "Locker " ++ show lockerNumber ++ " is already taken!"

-- now we can lookup the existence of lockers in the locker map
-- ghci> lockerLookup 101 lockers  
-- Right "JAH3I"  
-- ghci> lockerLookup 100 lockers  
-- Left "Locker 100 is already taken!"  
-- ghci> lockerLookup 102 lockers  
-- Left "Locker number 102 doesn't exist!"  
-- ghci> lockerLookup 110 lockers  
-- Left "Locker 110 is already taken!"  
-- ghci> lockerLookup 105 lockers  
-- Right "QOTSA"  