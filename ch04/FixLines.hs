import System.Environment (getArgs)

-- Splits a string in a way that accounts for both Windows- and Unix-style
-- line terminators.
splitLines [] = []
splitLines cs =
  let (pre, suf) = break isLineTerminator cs
  in pre : case suf of
            ('\r':'\n':rest) -> splitLines rest
            ('\r':rest)      -> splitLines rest
            ('\n':rest)      -> splitLines rest
            _                -> []

isLineTerminator c = c == '\r' || c == '\n'

-- Splits a string using function above and puts stitches it back together
-- using the native style.
fixLines :: String -> String
fixLines input = unlines (splitLines input)


interactWith function inputFile outputFile = do
  input <- readFile inputFile
  writeFile outputFile (function input)

main = do
    args <- getArgs
    case args of
      [input,output] -> interactWith myFunction input output
      _ -> putStrLn "error: expected two arguments"
  -- Replace the assigned function with any function:
  where myFunction = fixLines
