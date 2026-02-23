
Semantics in FOL assigns meaning to sentences by mapping symbols to elements in a **Model**.

> [!abstract] **The Model Structure $M = (D, I)$**
> A model consists of two parts:
> 1.  **Domain ($D$)**: A non-empty set of objects (or "individuals") in the world.
>     * *Example*: $D = \{Philip, Charles, Elizabeth, \dots\}$.
> 2.  **Interpretation ($I$)**: A mapping function.
>     * **Constants**: Maps symbol $c$ to an object in $D$. ($I(\text{charles}) = Charles$).
>     * **Predicates**: Maps symbol $P$ to a set of tuples (relations) in $D$. ($I(\text{Father}) = \{ (Philip, Charles), (Charles, William) \dots \}$).
>     * **Functions**: Maps symbol $f$ to a function $D \to D$.

### Truth in FOL
A sentence is true in model $M$ if the relationship described by the interpretation holds in the domain.
* `Father(philip, charles)` is true iff the pair $(I(\text{philip}), I(\text{charles})) \in I(\text{Father})$.

### Links
* **Concept**: [[Logic Semantics]]
* **Components**: [[Models]]