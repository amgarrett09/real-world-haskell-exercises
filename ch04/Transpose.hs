-- Lists Exercise 4
-- Takes an input file and zips together the lines,
-- so "hello\nworld" becomes "hw\neo\nlr\nll\nod".
-- Right now, if there's an empty line, it'll produce no output because
-- an empty string will get zipped with the previously zipped elements.
-- Could fix this by filtering out empty lines, but it's good enough for now.

import System.Environment (getArgs)

-- System agnostic line splitter
splitLines [] = []
splitLines cs =
  let (pre, suf) = break isLineTerminator cs
  in pre : case suf of
            ('\r':'\n':rest) -> splitLines rest
            ('\r':rest)      -> splitLines rest
            ('\n':rest)      -> splitLines rest
            _                -> []

isLineTerminator c = c == '\r' || c == '\n'

-- We're zipping two words together and then "flattening" the tuples into
-- strings. We need two versions of "flatten" here because zipping the first
-- two words produces a tuple of one type, and then zipping the flattened
-- result with a new word produces a different type.
flatten :: (Char, Char) -> String
flatten (a,b) = [a,b]

flatten' :: (String, Char) -> String
flatten' (a,b) = a ++ [b]

transpose :: [String] -> [String]
transpose [] = []
transpose [a] = [a]
transpose (x:y:ys) =
  let transTwo = map flatten (zip x y)
  in if null ys
     then transTwo
     -- If there are 3+ words in the list, transpose the first
     -- two and use that as a starting point for a fold on the rest of the words
     else foldl (\acc st -> map flatten' (zip acc st)) transTwo ys

transposeLines :: String -> [String]
transposeLines input = transpose (splitLines input)

printTransposed :: String -> String
printTransposed input = unlines (transposeLines input)

-- File IO
interactWith function inputFile outputFile = do
  input <- readFile inputFile
  writeFile outputFile (function input)

main = do
    args <- getArgs
    case args of
      [input,output] -> interactWith myFunction input output
      _ -> putStrLn "error: expected two arguments"
  where myFunction = printTransposed
