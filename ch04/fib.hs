-- For practice: this function generates the first n fibonacci numbers
fib :: Int -> [Int]
fib 1 = [1]
fib 2 = [1, 1]
fib n = 
    1 : 1 : zipWith (+) prev (tail prev)
  where prev = fib (n - 1)

