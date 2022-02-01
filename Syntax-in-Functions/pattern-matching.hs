-- pattern matching is just specifying patterns to which the input data needs to conform
-- you check in the pattern to see if the input data conforms
    -- if so then begin deconstruction according to the pattern
-- defining functions with pattern matching allows for defining separate fucntion bodies for different patterns

-- pattern matching can be done on any data type 
isLucky = (Integral a) => a -> String
isLucky 7 = "LUCKY NUMBER SEVEN!"
isLucky x = "Sorry, you're out of luck, pal!"
