
A single inference rule that yields a complete inference algorithm when coupled with any search algorithm.

> [!abstract] **The Rule**
> $$\frac{l_1 \vee \dots \vee l_k, \quad m_1 \vee \dots \vee m_n}{l_1 \vee \dots \vee l_{i-1} \vee l_{i+1} \vee \dots \vee l_k \vee m_1 \vee \dots \vee m_{j-1} \vee m_{j+1} \vee \dots \vee m_n}$$
> **Where** $l_i$ and $m_j$ are **complementary literals** (e.g., $P$ and $\neg P$).

### Simplified Form
$$\frac{P \vee A, \quad \neg P \vee B}{A \vee B}$$
* "If $P$ is true, $B$ must be true. If $P$ is false, $A$ must be true. Therefore, either $A$ or $B$ is true.".

### The Empty Clause ($\square$)
If we resolve $P$ and $\neg P$, we get an empty clause (False).
* Deriving the empty clause signifies a **Contradiction**.

### Links
* **Used In**: [[Resolution Algorithm]]
* **Format**: [[CNF (Conjunctive Normal Form)]]