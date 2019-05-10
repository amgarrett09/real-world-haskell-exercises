-- In Haskell, the following will short-circuit if a is true, and it can do so
-- without this function needing to be treated differently than any other
-- function. Because of lazy evaluation, if a is true, the value of b never
-- needs to be computed, and so it isn't.
newOr a b = if a then a else b
