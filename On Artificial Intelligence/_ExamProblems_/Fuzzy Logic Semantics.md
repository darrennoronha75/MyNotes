A formalization required for Exam SoSe 25 (Problem 2.5), where truth is a continuous degree $\mu(\phi) \in [0,1]$ rather than a binary $\{0, 1\}$.

> [!info] **The Connectives**
> We replace boolean operators with mathematical functions on the unit interval:
> * **Negation ($\neg \alpha$)**: $c(\mu(\alpha))$ where $c: [0,1] \to [0,1]$.
> * **Conjunction ($\alpha \wedge \beta$)**: $t(\mu(\alpha), \mu(\beta))$ where $t: [0,1]^2 \to [0,1]$ (called a **T-norm**).
> * **Disjunction ($\alpha \vee \beta$)**: $s(\mu(\alpha), \mu(\beta))$ where $s: [0,1]^2 \to [0,1]$ (called an **S-norm** or T-conorm).

### Required Properties (Exam Solution)
To behave like logic, these functions must satisfy:
1.  **Boundary Conditions**:
    * $c(0)=1, c(1)=0$.
    * $t(1, x) = x$ (Identity for AND).
    * $s(0, x) = x$ (Identity for OR).
2.  **Monotonicity**: If inputs increase, truth shouldn't decrease.
    * $x \le y \implies f(x) \le f(y)$.
3.  **Commutativity & Associativity**: Order shouldn't matter.

### Standard Choices (Gödel / Zadeh Logic)
* **Negation**: $c(x) = 1 - x$
* **Conjunction (Min)**: $t(x, y) = \min(x, y)$
* **Disjunction (Max)**: $s(x, y) = \max(x, y)$

*Alternative (Product Logic)*: $t(x, y) = x \cdot y$.

**Question 21 (SoSe 25):** _Using the functions c, s and t, express how you would define $\mu(a \rightarrow b)$ and $\mu(a \leftrightarrow b)$._

To solve this, we map the classical propositional definitions to our new "fuzzy" functions.

#### **Step 1: Implication ($a \rightarrow b$)**

In classical logic, $a \rightarrow b$ is logically equivalent to $\neg a \vee b$ (Implication Elimination).

We simply substitute our fuzzy functions:

- $\neg a$ becomes $c(\mu(a))$
    
- $\vee$ becomes $s(\cdot, \cdot)$
    

**Result:**

$$\mu(a \rightarrow b) = s(c(\mu(a)), \mu(b))$$

_Example (using Standard Zadeh Logic)_:

If we use $c(x) = 1-x$ and $s(x,y) = \max(x,y)$, then:

$$\mu(a \rightarrow b) = \max(1 - \mu(a), \mu(b))$$

_(This is known as the Kleene-Dienes implication)._

#### **Step 2: Equivalence ($a \leftrightarrow b$)**

In classical logic, $a \leftrightarrow b$ is equivalent to $(a \rightarrow b) \wedge (b \rightarrow a)$.

We substitute using our definition from Step 1 and the $t$-norm for AND.

**Result:**

$$\mu(a \leftrightarrow b) = t(\mu(a \rightarrow b), \mu(b \rightarrow a))$$

$$= t(s(c(\mu(a)), \mu(b)), s(c(\mu(b)), \mu(a)))$$

### Links
* **Context**: [[Logic Semantics]]
* **Exam**: [[exam-SoSe25.pdf]]