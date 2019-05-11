type ItemID = Int
type Title = String
type Authors = [String]

data Book = Book ItemID Title Authors
            deriving (Show)

data Magazine = Magazine ItemID Title Authors
                deriving (Show)

type CustomerID = Int
type ReviewBody = String

data BookReview = BookReview Book CustomerID ReviewBody
                  deriving (Show)

type CardNumber = String
type CardHolder = String
type Address = [String]

data BillingInfo = CreditCard CardNumber CardHolder Address
                 | CashOnDelivery
                 | Invoice CustomerID
                   deriving(Show)

-- We can also use record syntax to get a more C-like feel and reduce
-- boilerplate. This syntax also automatically generates accessor funcitons
-- for each "field."

data Customer = Customer {
    customerID :: Int,
    customerName :: String,
    customerAddress :: [String]
} deriving(Show)

myInfo =
    Book 123456789 "Algebra of Programming" ["Richard Bird", "Oege de Moor"]

myCustomer = Customer {
    customerID = 1234,
    customerName = "Alex Garrett",
    customerAddress = ["None of your business"]
}
