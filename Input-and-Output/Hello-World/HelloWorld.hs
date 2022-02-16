-- in haskell since its a purely functional meaning we define stuff in terms of functions and what things do as opposed to imperative languages where we defina functions that tie together and then define how they all work. 

-- in haskell a function is unable to change state like the contents of a variable

-- this means haskell always outputs new data from every function but that data will be constistent with the same inputs every time

-- we can still deal with functions that have side effects for dealing with the outside world
main :: IO ()
main = putStrLn "Hello, World!"

-- above is the most baic output program in any programming language. 

-- go compile and run use 
 -- ghc --make helloworld
 -- ./helloworld

-- The IO () type is called IO Action and it is a result type that means that the resulting type will have some kind of side effect either reading from input or printing to screen. there will also be some kind of value inside it. the () is an empty tuple called a unit. 

-- IO () happen during the main function of a program

-- using the do syntax allwos you to chain several IO actions together into one
 -- see Hello-Input/HelloInput for example code. 
 -- uses getLine to receive input from terminal from user and stores to local variable for use in do statement
 -- getLine returns a IO String 
  -- so it is an IO action which has a type of String

-- a good way to think of IO action is as a box with feet that goes out into the world to do stuff there and bring back some stuff for your function. Once its got that stuff the only way to open the box is to use the (<-) operator 
 -- if you are taking stuff out of an IO action you can only do it while already inside another IO action
-- that is why the following would make no sense
-- nameTage = "Hello, my name is " ++ getLine

-- couple notes on (do)
 -- the last item in a do bloc kcannot be bound to a name 
  -- think about it in the way that the do block extracts the value from the last action and binds it to its own result
 -- every other line can be bound or written with a bind
 -- you can use let bindings in do blocks in the following format
  -- let <bindings> in <expressions> where bindings are names given to expressions and expressions is the expression to be evaluated.
  -- an example of this is seen in Hello-Let-In/HelloLetIn.hs 

-- remember (<-) is for binding results of IO actions 
-- let/in is for binding pure expressions

-- first exercise will be in Input-Reverser/InputReverser.hs 
-- it reverses the inputs and outputs them again until a blank line is input

-- the return statement is what boxes up a value and outputs it into something. it can be used to bind an IO action out or to return out a value
 -- mostly use return to create an iO action that doesn't do anything i.e. IO ()

 -- see the following files for function tests on IO actions 
 -- Function-Tests/PutStr
 --               /PutChar
 --               /print
 --               /GetCharWhen
 --               /Sequence
 --               /Forever
 --               /ForM