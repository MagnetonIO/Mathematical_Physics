# representation_equivalence.py

class GroupElement:
    def __init__(self, name):
        self.name = name

    def operation(self, other):
        return GroupElement(f"{self.name} ∘ {other.name}")

    def __repr__(self):
        return f"{self.name}"

# Classical representation
class ClassicalRep(GroupElement):
    pass

# Quantum representation
class QuantumRep(GroupElement):
    pass

# Functor Q mapping ClassicalRep to QuantumRep
def functor_Q(classical_element):
    return QuantumRep(f"U({classical_element.name})")

def representation_example():
    classical_element = ClassicalRep("g")
    quantum_element = functor_Q(classical_element)
    print("Classical Representation:", classical_element)  # Output: g
    print("Quantum Representation:", quantum_element)      # Output: U(g)
