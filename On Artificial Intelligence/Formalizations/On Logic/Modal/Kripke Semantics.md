
Kripke semantics provides the formal framework for evaluating the truth of modal sentences using a "relational structure".

> [!info] **The Kripke Model $\mathcal{I} = \langle W, R, \pi \rangle$**
> 1. **$W$**: A set of **Possible Worlds**.
> 2. **$R$**: The **Accessibility Relation**. A binary relation $R \subseteq W \times W$. If $wRv$, world $v$ is accessible from $w$.
> 3. **$\pi$**: The **Interpretation Function**. Assigns truth values to propositional variables at each world ($\pi_w : \mathcal{V} \to \{T, F\}$).

### Truth Conditions
The truth of a formula $\phi$ is evaluated at a **specific world $w$**:
* $w \models P$ iff $\pi_w(P) = T$ (Standard propositional truth).
* **$w \models \Box \phi$** iff for **all** worlds $v$ such that $wRv$, $v \models \phi$.
* **$w \models \Diamond \phi$** iff there **exists** at least one world $v$ such that $wRv$ and $v \models \phi$.

### The "Empty Successor" Case (Exam Trap)
If a world $w$ has **no** outgoing relations (it is a "dead end"):
* $w \models \Box \phi$ is **Trivially True** (Vacuous truth).
* $w \models \Diamond \phi$ is **False** (There is no successor to satisfy it).

### Links
* **Components**: [[Relational Frames]]
* **Implementation**: [[Lab 09 Trace]]