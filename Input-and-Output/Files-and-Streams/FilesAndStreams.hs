-- getContents is the function that will be our friend here
-- is an IO action that reads everything fro the standard inut until it gets to EOF character. 
-- type os IO String

-- its lazy too so it will only read things as its needed from terminal or wherever

-- see below and in /forever-eg for example of piping output of file to terminal

{-
$ ghc --make capslocker   
[1 of 1] Compiling Main             ( capslocker.hs, capslocker.o )  
Linking capslocker ...  
$ cat sample-text.txt  
I'm a lil' teapot  
What's with that airplane food, huh?  
It's so small, tasteless  
$ cat sample-text.txt | ./capslocker  
I'M A LIL' TEAPOT  
WHAT'S WITH THAT AIRPLANE FOOD, HUH?  
IT'S SO SMALL, TASTELESS  
capslocker <stdin>: hGetLine: end of file 
-}

