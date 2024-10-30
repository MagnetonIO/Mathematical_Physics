-- src/QuantumLogic.hs
module QuantumLogic (quantumLogicExample) where

data Proposition
  = Classical Bool
  | Quantum String  -- Representing quantum propositions
  deriving (Show)

-- Logical operations
andProp :: Proposition -> Proposition -> Proposition
andProp (Classical a) (Classical b) = Classical (a && b)
andProp _ _ = Quantum "Non-Boolean conjunction"

orProp :: Proposition -> Proposition -> Proposition
orProp (Classical a) (Classical b) = Classical (a || b)
orProp _ _ = Quantum "Non-Boolean disjunction"

-- Embedding classical propositions
embedClassical :: Bool -> Proposition
embedClassical = Classical

-- Example usage
quantumLogicExample :: IO ()
quantumLogicExample = do
  let classicalTruth = embedClassical True
      quantumProp = Quantum "Superposition State"
      result = andProp classicalTruth quantumProp
  print result  -- Output: Quantum "Non-Boolean conjunction"
