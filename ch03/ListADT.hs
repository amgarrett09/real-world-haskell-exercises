-- We can define recursive types, like with a list
data List a = Cons a (List a)
            | Nil
              deriving(Show)

-- Exercise solution: Convert our defined list into a Haskell list
toList (Cons a tail) = a : (toList tail)
toList Nil = []
