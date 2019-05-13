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

-- Lists Exercise 2
-- I interpreted the exercises to mean that the boolean function given as input
-- should return *True* when it tests for a specific character, instead of
-- False like the exercise says. The former would make more sense.
splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith func [] = []
splitWith func list =
  let (pre, suf) = break func list
  in if null pre
     then splitWith func (tail suf)
     else pre : splitWith func suf

-- Lists Exercise 3 is in FirstWords.hs
