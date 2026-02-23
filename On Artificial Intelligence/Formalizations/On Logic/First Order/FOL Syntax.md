
The syntax of First-Order Logic (FOL) extends propositional logic to describe objects, relations, and functions.

> [!info] **The Alphabet**
> * **Constants**: Specific objects in the world (e.g., `philip`, `charles`, `banana`).
> * **Predicates**: Relations between objects that evaluate to True/False (e.g., `Father(x, y)`, `IsSquare(x)`).
> * **Functions**: mappings from objects to objects (e.g., `LeftLegOf(x)`).
> * **Variables**: Placeholders for objects (e.g., $x, y, z$).
> * **Connectives**: $\neg, \wedge, \vee, \Rightarrow, \Leftrightarrow$.
> * **Quantifiers**: $\forall, \exists$.

### Terms vs. Sentences
It is critical to distinguish between referring to an *object* and stating a *fact*.
1.  **Term**: A logical expression that refers to an **object**.
    * *Examples*: `charles`, $x$, `LeftLegOf(philip)`.
2.  **Atomic Sentence**: A predicate applied to terms. It has a **Truth Value**.
    * *Examples*: `Father(philip, charles)` is True. `Brother(charles, philip)` is False.
3.  **Complex Sentence**: Built using connectives and quantifiers.
    * *Example*: $\forall x, \exists y : Father(y, x)$.

### Links
* **Basis**: [[Logic Syntax]] (General definition)
* **Implementation**: [[family.pl]] (Prolog atoms)