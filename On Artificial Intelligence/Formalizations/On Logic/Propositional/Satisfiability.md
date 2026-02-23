
A sentence is **Satisfiable** if it is True in **at least one** model.

> [!info] **Definition**
> $$M(\alpha) \neq \emptyset$$
> (There exists some $m$ such that $\alpha$ is true in $m$).

### Relationships
* **Unsatisfiable**: True in *no* models (e.g., $P \wedge \neg P$).
* **Validity Connection**: $\alpha$ is Valid iff $\neg \alpha$ is Unsatisfiable.
* **Proof by Refutation**:
  $$KB \models \alpha \iff (KB \wedge \neg \alpha) \text{ is Unsatisfiable}$$
  * This is the foundation of the [[Resolution Algorithm]].

### Links
* **Algorithm**: [[DPLL Algorithm]], [[WalkSAT]]
* **Contrast**: [[Validity]]