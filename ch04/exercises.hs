-- Lists Exercise 1
safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:_) = Just x

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (_:xs)
  | null xs = Nothing
  | otherwise = Just xs

safeLast :: [a] -> Maybe a
safeLast [] = Nothing
safeLast (x:xs)
  | null xs = Just x
  | otherwise = safeLast xs

safeInit :: [a] -> Maybe [a]
safeInit [] = Nothing
safeInit list = Just (init' list)
  where init' xs = case xs of
                     [a]    -> [a]
                     [a,b]  -> [a]
                     (x:xs) -> x : init' xs
