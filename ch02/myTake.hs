-- For practice, I implemented my own version of take, which returns the first
-- n elements of a list
myTake n xs
    | n <= 0 || null xs = []
    | n == 1 = (head xs) : []
    | otherwise = (head xs) : myTake (n - 1) (tail xs)


