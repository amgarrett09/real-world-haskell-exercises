-- Return the element before the last element in a list
lastButOne (x:xs)
    | length xs == 1 = x
    | otherwise = lastButOne xs
lastButOne _ = error "List must have at least two elements"

-- We can see the idea behind this by writing out some concrete cases:
--
-- lastButOne [1,2,3,4] = 3
-- lastButOne [2,3,4] = 3
-- lastButOne [3,4] = 3
--
-- The return value for lastButOne applied to a list should be the same as
-- the return value for the same function applied to the list's tail. So
-- that gives us a recurrence relation.
--
-- We need a base case though, and that's reached when there are only two
-- elements in the list. In this case, lastButOne is simply the head of the
-- list.
--
-- Right now, in the case where the list has less than two elements,
-- lastButOne will throw an exception.

