
The fundamental inference rule used in both propositional and first-order logic.

> [!abstract] **The Rule**
> $$\frac{\alpha \Rightarrow \beta, \quad \alpha}{\beta}$$
> * **Premise 1**: If $\alpha$ implies $\beta$ is true...
> * **Premise 2**: And $\alpha$ is true...
> * **Conclusion**: Then $\beta$ must be true.

### Properties
* **Soundness**: Yes. If the premises are true, the conclusion is guaranteed to be true.
* **Completeness**: No. Modus Ponens alone is not complete for general logic, but it is complete for **Horn Clauses** when combined with Forward/Backward chaining.

### Links
* **Used In**: [[Forward Chaining]], [[Backward Chaining]]
* **Generalization**: [[Resolution Rule]]