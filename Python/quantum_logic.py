# quantum_logic.py

class Proposition:
    def __init__(self, value):
        self.value = value

    def __and__(self, other):
        if isinstance(self.value, bool) and isinstance(other.value, bool):
            return Proposition(self.value and other.value)
        else:
            return QuantumProposition("Non-Boolean conjunction")

    def __or__(self, other):
        if isinstance(self.value, bool) and isinstance(other.value, bool):
            return Proposition(self.value or other.value)
        else:
            return QuantumProposition("Non-Boolean disjunction")

    def __repr__(self):
        return f"Proposition({self.value})"

class QuantumProposition(Proposition):
    pass

# Embedding classical proposition
def embed_classical(value):
    return Proposition(value)

def quantum_logic_example():
    classical_truth = embed_classical(True)
    quantum_prop = QuantumProposition("Superposition State")
    result = classical_truth & quantum_prop
    print(result)  # Output: QuantumProposition(Non-Boolean conjunction)
