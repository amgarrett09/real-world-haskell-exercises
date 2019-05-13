import System.Environment (getArgs)

-- system agnostic line splitter
splitLines [] = []
splitLines cs =
  let (pre, suf) = break isLineTerminator cs
  in pre : case suf of
            ('\r':'\n':rest) -> splitLines rest
            ('\r':rest)      -> splitLines rest
            ('\n':rest)      -> splitLines rest
            _                -> []

isLineTerminator c = c == '\r' || c == '\n'

getFirstWord :: String -> String
getFirstWord "" = ""
getFirstWord line = 
  let (word, _) = break isSpace line
  in word
  where isSpace c = c == ' '

firstWordList :: String -> [String]
firstWorldList "" = []
firstWordList input = map getFirstWord (splitLines input)

printFirstWords input = unlines (firstWordList input)

interactWith function inputFile outputFile = do
  input <- readFile inputFile
  writeFile outputFile (function input)

main = do
    args <- getArgs
    case args of
      [input,output] -> interactWith myFunction input output
      _ -> putStrLn "error: expected two arguments"
  where myFunction = printFirstWords
