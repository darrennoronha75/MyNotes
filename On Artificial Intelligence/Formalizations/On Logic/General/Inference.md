
Inference is the mechanical process of deriving logical conclusions from a Knowledge Base.

> [!info] **Definition ($KB \vdash_i \alpha$)**
> We say "$\alpha$ is derived from $KB$ by procedure $i$" (written $KB \vdash_i \alpha$) if the algorithm $i$ can produce sentence $\alpha$ starting from $KB$.

### Distinction from Entailment
* **Entailment ($\models$)**: A semantic relationship. "Is it *actually* true?".
* **Inference ($\vdash$)**: A syntactic derivation. "Can my *algorithm* calculate it?".

### Desirable Properties
We judge inference algorithms by two key metrics relative to entailment:
1.  **[[Soundness]]**: Does it derive *only* entailed sentences?
2.  **[[Completeness]]**: Does it derive *all* entailed sentences?

### Links
* **Algorithms**: [[Resolution Algorithm]], [[DPLL Algorithm]]
* **Properties**: [[Soundness]], [[Completeness]]