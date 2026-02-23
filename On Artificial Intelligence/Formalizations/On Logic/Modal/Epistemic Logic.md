

Epistemic logic formalizes the knowledge of agents. $\Box \phi$ is read as **$K_a \phi$** ("Agent $a$ knows $\phi$").

### Semantic Interpretation of Axioms
1. **K Axiom**: $K_a(\phi \to \psi) \to (K_a \phi \to K_a \psi)$
   - *Meaning*: If the agent knows an implication and the premise, they know the conclusion.
2. **T Axiom**: $K_a \phi \to \phi$
   - *Meaning*: "Knowledge implies Truth." An agent can only know facts that are actually true.
3. **4 Axiom**: $K_a \phi \to K_a K_a \phi$
   - *Meaning*: **Positive Introspection**. If an agent knows something, they know that they know it.
4. **5 Axiom**: $\neg K_a \phi \to K_a \neg K_a \phi$ (equivalent to $\Diamond \phi \to \Box \Diamond \phi$)
   - *Meaning*: **Negative Introspection**. If an agent doesn't know something, they know they don't know it.
5. **B Axiom**: $\phi \to K_a \Diamond \phi$
   - *Meaning*: If $\phi$ is true, the agent knows that $\phi$ is possible.
6. **D Axiom**: $K_a \phi \to \Diamond \phi$
   - *Meaning*: If an agent knows $\phi$, they think $\phi$ is possible.



### Frame Requirements
Epistemic logic usually assumes an **S5 System**, meaning the accessibility relation $R$ is an **Equivalence Relation** (Reflexive, Symmetric, and Transitive).

### Links
* **Comparison**: [[Epistemic vs Doxastic]]
* **Properties**: [[Relational Frame Correspondence]]