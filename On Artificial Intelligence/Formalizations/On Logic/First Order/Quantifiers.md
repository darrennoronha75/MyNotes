Operators that allow sentences to declare properties about *sets* of objects rather than specific individuals.

### 1. Universal Quantifier ($\forall$)
* **Syntax**: $\forall x, P(x)$.
* **Semantics**: "For all $x$ in the domain, $P(x)$ is true."
* **Conjunction Analogy**: Equivalent to $P(obj_1) \wedge P(obj_2) \wedge \dots$ for every object in the domain.
* **Common Pattern**: Used with **Implication**.
    * $\forall x, \text{King}(x) \Rightarrow \text{Person}(x)$ ("All kings are persons").
    * *Warning*: Do not use $\wedge$ with $\forall$. $\forall x, \text{King}(x) \wedge \text{Person}(x)$ means "Everything in the universe is both a King and a Person".

### 2. Existential Quantifier ($\exists$)
* **Syntax**: $\exists x, P(x)$.
* **Semantics**: "There exists at least one $x$ in the domain such that $P(x)$ is true."
* **Disjunction Analogy**: Equivalent to $P(obj_1) \vee P(obj_2) \vee \dots$.
* **Common Pattern**: Used with **Conjunction**.
    * $\exists x, \text{King}(x) \wedge \text{Evil}(x)$ ("There is an evil king").

### Duality Rules (De Morgan for Quantifiers)
* $\forall x \neg P(x) \equiv \neg \exists x P(x)$ ("For all x P is false" = "There is no x where P is true").
* $\neg \forall x P(x) \equiv \exists x \neg P(x)$ ("Not all x are P" = "There exists an x that is not P").

### Links
* **Context**: [[FOL Syntax]]
* **Example**: [[Kinship Domain]]