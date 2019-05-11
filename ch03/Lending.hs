-- example of local variables

lend amount balance =
    let reserve = 100
        newBalance = balance - amount
    in if balance < reserve
       then Nothing
       else Just newBalance

-- The 'let' block is terminated by the 'in' keyword, and we can use the
-- declared variable both inslide the let block and in the expression following
-- the 'in' keyword.
