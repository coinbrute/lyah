import qualified Data.Set as Set

-- Data.Set offers set functions similar to mathematical operations on sets. 

-- as in most languages sets contain all unique elements

-- they are orders and are internally implemented with trees. 

-- typically faster to work with than lists

text1 = "I just had an anime dream. Anime... Reality... Are they so different?"
text2 = "The old man left his garbage can out and now his trash is all over my lawn!"

-- fromList takes a list converting to a set. 
set1 = Set.fromList text1
set2 = Set.fromList text2

-- intersection see what two sets share in common
sharedSet = Set.intersection set1 set2

-- difference shows which are in first but not in second 
notInSnd = Set.difference set1 set2

-- union joins two leaving out all duplicates 
unionized = Set.union set1 set2

-- null/size/member/empty/singleton/insert/delete are pretty straightforward
{-
    ghci> Set.null Set.empty  
    True  
    ghci> Set.null $ Set.fromList [3,4,5,5,4,3]  
    False  
    ghci> Set.size $ Set.fromList [3,4,5,3,4,5]  
    3  
    ghci> Set.singleton 9  
    fromList [9]  
    ghci> Set.insert 4 $ Set.fromList [9,3,8,1]  
    fromList [1,3,4,8,9]  
    ghci> Set.insert 8 $ Set.fromList [5..10]  
    fromList [5,6,7,8,9,10]  
    ghci> Set.delete 4 $ Set.fromList [3,4,5,4,3,4,5]  
    fromList [3,5]
-}

-- map and filtering on sets is same as lists

-- toList converts set to list

