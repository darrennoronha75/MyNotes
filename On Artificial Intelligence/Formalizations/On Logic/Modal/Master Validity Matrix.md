

This table defines which axioms are valid across the various flavors of Modal Logic. Use this as the primary reference for frame verification.

| Logic Type | $\Box \phi$ Meaning | K | T | 4 | 5 | B | D |
| :--- | :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Epistemic** | Agent knows $\phi$ | Y | Y | Y | Y | Y | Y |
| **Alethic** | Necessarily $\phi$ | Y | Y | Y | Y | Y | Y |
| **Doxastic** | Agent believes $\phi$ | Y | N | Y | Y | N | Y |
| **Deontic** | $\phi$ is obligatory | Y | N | Y? | Y? | N | Y |
| **Temporal** | Always in future $\phi$ | Y | Y/N | Y | N | N | N/Y |

### Axiom Summary
* **K (Distribution)**: $\Box(\phi \to \psi) \to (\Box \phi \to \Box \psi)$. Valid in ALL normal modal logics.
* **T (Truth)**: $\Box \phi \to \phi$. Requires **Reflexive** frames.
* **4 (Pos. Introspection)**: $\Box \phi \to \Box \Box \phi$. Requires **Transitive** frames.
* **5 (Neg. Introspection)**: $\Diamond \phi \to \Box \Diamond \phi$. Requires **Euclidean** frames.
* **B (Brouwer)**: $\phi \to \Box \Diamond \phi$. Requires **Symmetric** frames.
* **D (Consistency)**: $\Box \phi \to \Diamond \phi$. Requires **Serial** frames.

### Links
* **Axiom Deep Dives**: [[Axiom K (Distribution)]], [[Axiom T (Truth)]], [[Axiom 4 (Positive Introspection)]], [[Axiom 5 (Negative Introspection)]], [[Axiom B (Brouwer)]], [[Axiom D (Consistency)]]