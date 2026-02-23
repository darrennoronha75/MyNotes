Soundness (or "Truth-Preserving") is a property of an inference algorithm $i$.

> [!abstract] **Formal Definition**
> An inference algorithm $i$ is **Sound** if:
> $$\text{Whenever } KB \vdash_i \alpha, \text{ it is also true that } KB \models \alpha.$$

### Implication
* A sound algorithm **never lies**.
* It does not generate false conclusions from true premises.
* If a sound algorithm claims "Yes," the answer is definitely "Yes."
* **Model Checking** is a trivial example of a sound algorithm.

### Links
* **Contrast**: [[Completeness]]
* **Context**: [[Inference]]