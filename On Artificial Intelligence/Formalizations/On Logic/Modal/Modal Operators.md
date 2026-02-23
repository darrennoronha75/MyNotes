# Modal Operators

Modal logic extends standard logic by adding operators that qualify the "mode" of truth (how a statement is true).

> [!abstract] **The Dual Operators**
> 1. **Necessity ($\Box \phi$)**: 
>    * English: "It is necessarily true that $\phi$."
>    * Temporal Interpretation: "$\phi$ is true **Always** (in all future worlds)."
> 2. **Possibility ($\Diamond \phi$)**: 
>    * English: "It is possibly true that $\phi$."
>    * Temporal Interpretation: "$\phi$ is true **Sometimes** (in at least one future world)."

### Logical Duality
Just like $\forall$ and $\exists$, modal operators are duals of each other:
* $\Box \phi \equiv \neg \Diamond \neg \phi$ (Necessity is the absence of the possibility of the opposite).
* $\Diamond \phi \equiv \neg \Box \neg \phi$ (Possibility is the negation of "always false").

### Links
* **Semantics**: [[Kripke Semantics]]
* **Analogy**: [[Quantifiers]] ($\forall \approx \Box$, $\exists \approx \Diamond$)