
Generalized Modus Ponens is a "lifted" version of [[Modus Ponens]] that uses [[Unification]] to apply rules directly to sentences with variables.

> [!abstract] **The Rule**
> For atomic sentences $p_i, p_i', q$:
> $$\frac{p_1', p_2', \dots, p_n', \quad (p_1 \wedge p_2 \wedge \dots \wedge p_n \Rightarrow q)}{q\theta}$$
> **Where** UNIFY($p_i', p_i$) = $\theta$ for all $i$.

### Significance
* GMP allows inference without **Propositionalization** (converting everything to propositional logic), which avoids the combinatorial explosion of substituting every possible constant for every variable.
* It is the core engine for **Forward Chaining** and **Backward Chaining** in First-Order Logic.

### Example (Kinship)
* **Premise 1**: $Father(Philip, Charles)$
* **Premise 2**: $\forall x, y : Father(x, y) \Rightarrow Parent(x, y)$
* **Unification**: $\theta = \{x / Philip, y / Charles\}$
* **Conclusion**: $Parent(Philip, Charles)$

### Links
* **Prerequisite**: [[Unification]]
* **Logic Base**: [[Modus Ponens]]