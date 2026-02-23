
Completeness is a property of an inference algorithm $i$ indicating its ability to find all truths.

> [!abstract] **Formal Definition**
> An inference algorithm $i$ is **Complete** if:
> $$\text{Whenever } KB \models \alpha, \text{ the algorithm guarantees } KB \vdash_i \alpha.$$

### Implication
* A complete algorithm **never misses a truth**.
* If something is true, the algorithm will eventually find it/derive it.
* For Propositional Logic, purely semantic approaches (like truth tables) are complete because the space of models is finite.

### Links
* **Contrast**: [[Soundness]]
* **Context**: [[Inference]]