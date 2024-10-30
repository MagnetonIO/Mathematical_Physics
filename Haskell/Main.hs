-- Main.hs
module Main where

import ClassicalLimit (classicalLimitExample)
import QuantumLogic (quantumLogicExample)
import RepresentationEquivalence (representationExample)

main :: IO ()
main = do
  putStrLn "Classical Limit Example:"
  classicalLimitExample
  putStrLn "\nQuantum Logic Example:"
  quantumLogicExample
  putStrLn "\nRepresentation Equivalence Example:"
  representationExample
