-- We can use the Maybe type to indicate that a function may fail
safeSecond :: [a] -> Maybe a

safeSecond [] = Nothing
safeSecond (_:xs)
    | null xs = Nothing
    | otherwise = Just (head xs)

-- Improved readability version
tidySecond :: [a] -> Maybe a

tidySecond (_:x:_) = Just x
tidySecond _ = Nothing
