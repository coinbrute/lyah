import qualified Data.Map as Map

-- k/v pairs / dictionaries / association lists are used to store things where ordering doesn't matter. 

-- maybe a list of walletIDs and account values
yoroi = [
 ("x123",100),
 ("x234",150),
 ("x345",75),
 ("x456",10) ]

findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey key [] = Nothing
findKey key ((k,v):xs) = if key == k
                         then Just v
                         else findKey key xs

findKeyF :: (Eq k) => k -> [(k,v)] -> Maybe v
findKeyF key = foldr (\(k,v) acc -> if key == k then Just v else acc) Nothing

-- fromList takes a dictionary in form of list and returns a map with same associations duplicates excluded

-- empty represents an empty map takes no args and returns an empty map

-- insert takes a key value and map returning a new map with k/v inserted at end.

-- null checks for empty returning boolean

-- size returns size of map

--singleton takes k/v and creates a map of exactly one mapping

-- lookup looks up existence of k/v in map returning a Maybe

-- member is a preicate take a key and map and returns if key is in map 

-- map and filter work much like list variations

-- toList is inverse of fromList

-- keys and elems returns lists of k/v respectively 
 -- keys == map fst . Map.toList
 -- elems == map snd . Map.toList

-- fromListWith acts like fromList without discarding duplicate keys. Uses function suppied to decide what to do with them instead. 
phoneBook = [ 
    ("betty","555-2938"),
    ("betty","342-2492"),
    ("bonnie","452-2928"),  
    ("patsy","493-2928"),
    ("patsy","943-2929"), 
    ("patsy","827-9162"), 
    ("lucille","205-2928"),  
    ("wendy","939-8282"),
    ("penny","853-2492"), 
    ("penny","555-2111") ]

phoneBookToMap :: (Ord k) => [(k, String)] -> Map.Map k String
phoneBookToMap xs = Map.fromListWith (\number1 number2 -> number1 ++ ", " ++ number2) xs

-- insertWith is to insert what fromListWith is to fromList. it inserts a k/v pair into a map. HOWEVER... if it already contains the key it uses the function passed to determine what to do from there.

