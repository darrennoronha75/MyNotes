
A sentence is **Valid** (or a **Tautology**) if it is True in **all** possible models.

> [!info] **Definition**
> $$M(\alpha) = \mathcal{M}_{all}$$
> (The set of models where $\alpha$ is true is the set of all possible models).

### Examples
* $P \vee \neg P$ (Law of Excluded Middle).
* $(P \wedge (P \Rightarrow Q)) \Rightarrow Q$ (Deduction Theorem basis).

### Deduction Theorem
This theorem connects entailment to validity:
$$KB \models \alpha \iff (KB \Rightarrow \alpha) \text{ is Valid}$$
* This means we can check entailment by checking if the implication is a tautology.

### Links
* **Contrast**: [[Satisfiability]]
* **Test**: [[Model Checking]]