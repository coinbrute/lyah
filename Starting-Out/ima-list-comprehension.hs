-- list comprehension in haskell is very similar to set comprehension in mathematics
-- this concept is used to build specific sets from general sets
-- Mathematics example:
    -- basic comprehension to build set of first ten natural numbers
    -- S = {2 * x | x ∈ N, x <= 10}
    -- left of the pipe within the brackets is called the output function
    -- x is the variable
    -- N is the input set
    -- x <= 10 is the predicate/conditional
    -- This set would contain doubles of all natural numbers 1-10
-- Haskell example: take 10 [2,4..]
    -- but in list comprehension syntax it would look like this
    -- [x * 2 | x <- [1..10]]
    -- x is pulled out from [1..10]
    -- for every element in [1..10] which we bind to x
        -- get that element and pass to the left of the pipe
        -- double it
        -- put it in the new list
    -- output of this would be [2,4,6,8,10,12,14,16,18,20]
doubleOneToTen = [x * 2 | x <- [1..10]]
-- conditionals can be added to list comprehension
-- conditionals/predicates go to the right of the general list passed in after a comma
doubleOneToTenIncludeGreaterThan11 = [x * 2 | x <- [1..10], x*2 >= 12]
-- the conditional will be checked against with each x value before being added to the specific set
fiftyTo100WithRemainder3Div7 = [x | x <- [50..100], x `mod` 7 == 3]
-- using predicates/conditionals with list comprehension is called FILTERING
-- taking a list of things and FILTERING them on a predicate to get a desired output

-- can also be used to convert list types and values
-- this takes a list instead of generating one in the general set portion
boomBangs xs = [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]
    -- so here 'odd x' is the predicate checking x for oddness and returning True if odd
    -- if its odd then it continues into the if/then/else
    -- in there it checks x against being (<10) and outputs the corrosponding value to the specific set

-- more than one predicate is allowed in list comprehension
-- separate them by commas
tenTo20Not13Not15Not19 = [x | x <- [10..20], x /= 13, x /= 15, x /= 19]
-- in this case in order to be included in the specific set x must pass all predicates

-- list comprehension allows for multiple general sets to be drawed from
-- it will produce all combinations of the given lists and 
-- then join them through the output function supplied on the left of the pipe
-- two general lists of lenth 4 given to list comprehension with no predicates
-- will produce a specific list of length 16
productXY = [x*y | x <- [2,5,10], y <- [8,10,11]]
-- this will output [16,20,22,40,50,55,80,100,110] 
-- think about it like this [x0*y0, x0*y1, x0*y2, x1*y0, x1*y1, x1*y2, x2*y0, x2*y1, x2*y2]

-- this can be used to combine lists not just of numbers
-- remember the associated operators to use
nouns = ["hobo", "frog", "pope"]
adjectives = ["lazy", "grouchy", "scheming"]
combineStrLst xs ys = [x ++ " " ++ y | x <- xs, y <- ys]
-- when called as comineStrLst adjectives nouns it ouputs
-- ["lazy hobo","lazy frog","lazy pope","grouchy hobo","grouchy frog", "grouchy pope","scheming hobo","scheming frog","scheming pope"]

-- here is a length function using list comprehension
getLen xs = sum [1 | _ <- xs]
-- (_) is a wildcard meaning it doesn't matter what value that is
-- this comprehension replaces every thing from the general list with a 1 in the specific list
-- after going through the whole general list and creating a new specific list with all 1's
-- it sums the new list

-- Strings are lists so they can be processed using list comprehension
removeLowerCase str = [c | c <- str, c `elem` ['A'..'Z']]
    -- taking in str as the general list extrude value c
    -- in predicate construct list ['A'..'Z'] and check if c is an `elem` of that list
    -- if it is then pass c back to the specific list and add it in
        -- ignore it otherwise

-- list comprehension of nested lists is also possible provided the general list is a nested list
testNested = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]] 
removeOddsNoFlat = [ [x | x <- xs, even x] | xs <- testNested ]
-- here we are first extracting the list xs out of testNested which contains lists
-- so here xs is a list instead of an element
-- then with xs we go into another list comprehension
-- on xs we extract out x
-- from x we hop into the predicate and call 'even x'
-- if its true we add it to the final specific list for what xs will be 

