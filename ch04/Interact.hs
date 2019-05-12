-- A command line framework which reads an input file, applies a funciton to its
-- contents, and writes the result to an output file

import System.Environment (getArgs)

interactWith function inputFile outputFile = do
  input <- readFile inputFile
  writeFile outputFile (function input)

main = do
    args <- getArgs
    case args of
      [input,output] -> interactWith myFunction input output
      _ -> putStrLn "error: expected two arguments"
  -- Replace the assigned function with any function:
  where myFunction = id
