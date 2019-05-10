-- For practice, I implemented my own version of take, which returns the first
-- n elements of a list
myTake n (x:xs)
    | n <= 0 = []
    | n == 1 || null xs = x : []
    | otherwise = x : myTake (n - 1) xs
