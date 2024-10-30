# classical_limit.py
from sympy import symbols, diff, I

# Define symbols
q, p, hbar = symbols('q p hbar')

# Define observables as symbolic expressions
def observable_a(q, p):
    return p  # Example: momentum

def observable_b(q, p):
    return q  # Example: position

# Quantum commutator
def commutator(a, b, q, p):
    return a(q, p) * b(q, p) - b(q, p) * a(q, p)

# Classical Poisson bracket
def poisson_bracket(a, b, q, p):
    da_dq = diff(a(q, p), q)
    da_dp = diff(a(q, p), p)
    db_dq = diff(b(q, p), q)
    db_dp = diff(b(q, p), p)
    return da_dq * db_dp - da_dp * db_dq

# Compare commutator and Poisson bracket
def classical_limit(a, b, hbar, q, p):
    comm = commutator(a, b, q, p)
    poisson = poisson_bracket(a, b, q, p)
    lhs = comm / (I * hbar)
    return lhs, poisson

def classical_limit_example():
    lhs, rhs = classical_limit(observable_a, observable_b, hbar, q, p)
    print("Commutator / (i * hbar):", lhs)
    print("Poisson Bracket:", rhs)
