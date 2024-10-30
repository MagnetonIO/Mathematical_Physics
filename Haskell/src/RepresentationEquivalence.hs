-- src/RepresentationEquivalence.hs
module RepresentationEquivalence (representationExample) where

-- Group representation as a typeclass
class Group g where
  identity :: g
  operation :: g -> g -> g

-- Classical representation
data ClassicalRep = ClassicalRep String deriving (Show)

instance Group ClassicalRep where
  identity = ClassicalRep "e"
  operation (ClassicalRep a) (ClassicalRep b) = ClassicalRep (a ++ " ∘ " ++ b)

-- Quantum representation
data QuantumRep = QuantumRep String deriving (Show)

instance Group QuantumRep where
  identity = QuantumRep "I"
  operation (QuantumRep a) (QuantumRep b) = QuantumRep (a ++ " ∘ " ++ b)

-- Functor Q mapping ClassicalRep to QuantumRep
functorQ :: ClassicalRep -> QuantumRep
functorQ (ClassicalRep s) = QuantumRep ("U(" ++ s ++ ")")

-- Example usage
representationExample :: IO ()
representationExample = do
  let classicalElement = ClassicalRep "g"
      quantumElement = functorQ classicalElement
  print classicalElement  -- Output: ClassicalRep "g"
  print quantumElement    -- Output: QuantumRep "U(g)"
