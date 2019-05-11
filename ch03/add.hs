-- With Haskell's pattern matching features, we can define a function as a
-- series of equations:

myNot True = False
myNot False = True

sumList (x:xs) = x + sumList xs
sumList [] = 0

-- The order of the equations also matters. Haskell will check each pattern
-- until it finds a successful match. Equations below the successful match
-- won't do anything.
