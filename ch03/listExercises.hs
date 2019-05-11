import Data.List

-- Exercises 1 and 2
myLength :: [a] -> Int
myLength [] = 0
myLength (_:xs) = 1 + myLength xs

-- Exercise 3
sumList [] = 0
sumList (x:xs) = x + sumList xs

meanList [] = 0
meanList xs = (sumList xs) / (fromIntegral (myLength xs))

-- Exercise 4
makePalindrome xs = xs ++ reverse xs

-- Exercise 5
checkPalindrome xs
  | xs == reverse xs = True
  | otherwise = False

-- Exercise 6
sortLength xs ys
  | length xs > length ys = GT
  | length xs < length ys = LT
  | otherwise = EQ

sortByLength xs = sortBy sortLength xs

-- Exercise 7
join' :: a -> [[a]] -> [a]
join' _ [] = []
join' sep (x:xs)
    | null xs = x
    | otherwise = x ++ sep:(join' sep xs)
