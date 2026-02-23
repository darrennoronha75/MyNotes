
Semantics in PL defines the truth of a sentence with respect to a **Model** (or Interpretation).

> [!abstract] **The Model**
> A model $m$ in PL is a mapping that assigns a truth value ($True$ or $False$) to every propositional symbol.
> * If there are $n$ symbols, there are $2^n$ possible models.

### Truth Tables
The truth of complex sentences is determined recursively:

| $P$ | $Q$ | $\neg P$ | $P \wedge Q$ | $P \vee Q$ | $P \Rightarrow Q$ | $P \Leftrightarrow Q$ |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| F | F | T | F | F | **T** | T |
| F | T | T | F | T | **T** | F |
| T | F | F | F | T | **F** | F |
| T | T | F | T | T | **T** | T |


* **Note on Implication**: $P \Rightarrow Q$ is true whenever $P$ is False (vacuously true). It is only False when $P$ is True and $Q$ is False.

### Links
* **Concept**: [[Logic Semantics]]
* **Properties**: [[Validity]], [[Satisfiability]]