-- src/ClassicalLimit.hs
module ClassicalLimit (classicalLimitExample) where

import Numeric.AD

type Observable = Double -> Double -> Double

-- Quantum commutator
commutator :: Observable -> Observable -> Double -> Double -> Double -> Double
commutator a b hbar q p = (aOp * bOp - bOp * aOp)
  where
    aOp = a q p
    bOp = b q p

-- Classical Poisson bracket
poissonBracket :: Observable -> Observable -> Double -> Double -> Double
poissonBracket a b q p = (da_dq * db_dp - da_dp * db_dq)
  where
    da_dq = diff (\q' -> a q' p) q
    da_dp = diff (\p' -> a q p') p
    db_dq = diff (\q' -> b q' p) q
    db_dp = diff (\p' -> b q p') p

-- Compare commutator and Poisson bracket
classicalLimit :: Observable -> Observable -> Double -> Double -> Double -> (Double, Double)
classicalLimit a b hbar q p =
  let comm = commutator a b hbar q p
      poisson = poissonBracket a b q p
      lhs = comm / (hbar * 0)  -- Division by hbar, approximation
  in (lhs, poisson)

-- Example usage
classicalLimitExample :: IO ()
classicalLimitExample = do
  let observableA q p = p
      observableB q p = q
      hbar = 1e-5
      q = 1.0
      p = 1.0
      (lhs, rhs) = classicalLimit observableA observableB hbar q p
  putStrLn $ "Commutator / (hbar): " ++ show lhs
  putStrLn $ "Poisson Bracket: " ++ show rhs
