
Entailment is the core logical relation between a Knowledge Base ($KB$) and a sentence ($\alpha$), signifying that truth is preserved.

> [!abstract] **Formal Definition ($KB \models \alpha$)**
> We say "$KB$ entails $\alpha$" (written $KB \models \alpha$) if and only if:
> $$\alpha \text{ is true in all models where } KB \text{ is true.}$$

### Set-Theoretic Definition
Using the notation of [[Models]], entailment is defined as subset inclusion:
$$KB \models \alpha \iff M(KB) \subseteq M(\alpha)$$


### Intuition
* If I know $KB$ is true, then $\alpha$ *must* also be true.
* There is no possible world where the $KB$ holds but $\alpha$ fails.

### Links
* **Contrast**: [[Inference]] (Derivation vs. Truth)
* **Implementation**: [[Model Checking]]
* **Tags**: #formalization #logic #core-concept