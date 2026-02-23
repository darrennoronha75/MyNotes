
A **Relational Frame** $\mathcal{F} = \langle W, R \rangle$ is the structure of the model without the interpretation. The properties of $R$ determine which "Axioms" of modal logic hold.

### Common Relational Properties
1. **Reflexivity**: $\forall w, wRw$. (Every world sees itself).
   * **Resulting Axiom**: $\Box \phi \rightarrow \phi$ (If it's necessary, it is true).
2. **Transitivity**: $\forall u,v,w, (uRv \wedge vRw) \rightarrow uRw$.
   * **Resulting Axiom**: $\Box \phi \rightarrow \Box \Box \phi$ (If it's necessary, it's necessarily necessary).
3. **Symmetry**: $\forall w, v, wRv \rightarrow vRw$.
   * **Resulting Axiom**: $\phi \rightarrow \Box \Diamond \phi$.

### Validity in a Frame
We say $\mathcal{F} \models \phi$ if for **any** interpretation $\pi$, the sentence $\phi$ is true in every world of the frame.

# Relational Frame Correspondence

The technical mapping between the shape of the accessibility relation $R$ and the validity of Modal Axioms.

| Axiom | Condition on Frame | Formal Definition |
| :--- | :--- | :--- |
| **T** | Reflexive | $\forall w, wRw$ |
| **4** | Transitive | $\forall w, v, u: (wRv \wedge vRu) \to wRu$ |
| **5** | Euclidean | $\forall w, u, v: (wRu \wedge wRv) \to uRv$ |
| **B** | Symmetric | $\forall w, v: wRv \to vRw$ |
| **D** | Serial | $\forall w, \exists v: wRv$ |


### Links
* **Models**: [[Kripke Semantics]]
* **Logic Types**: [[Modal Logic Typology]]
### Links
* **Core Concept**: [[Kripke Semantics]]
* **Property**: [[Temporal Logic]] (usually uses Transitive/Anti-symmetric frames).