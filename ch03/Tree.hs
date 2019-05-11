-- Recursive types can also be used to define trees

data Tree a = Node a (Tree a) (Tree a)
            | Empty
              deriving(Show)

-- Exercise solution: A tree with only one constructor, using the Maybe type

data Tree' a = Node' a (Maybe (Tree' a)) (Maybe (Tree' a))
               deriving(Show)

-- Exercise 8 from end of chapter 3
treeHeight :: Tree a -> Int
treeHeight Empty = 0
treeHeight (Node _ tree1 tree2)
    | height1 < height2 = 1 + height2
    | height1 > height2 = 1 + height1
    | otherwise = 1 + height1
  where height1 = treeHeight tree1
        height2 = treeHeight tree2
