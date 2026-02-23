
Semantics defines the "meaning" of sentences by assigning truth values to them with respect to a "possible world" (or **Model**).

> [!info] **Definition**
> Semantics answers the question: *"Is this sentence true in this specific world?"*
> * It formally defines the truth of each sentence with respect to each possible model.
> * Example: The sentence "x + y = 4" is true in a world where $x=2, y=2$, but false in a world where $x=1, y=1$.

### Truth Function
Semantics is often defined as a function $T$ taking a sentence $\alpha$ and a model $m$:
$$Truth(\alpha, m) \in \{True, False\}$$

### Links
* **Requires**: [[Models]]
* **Complement**: [[Logic Syntax]]
* **Specifics**: [[PL Semantics]]