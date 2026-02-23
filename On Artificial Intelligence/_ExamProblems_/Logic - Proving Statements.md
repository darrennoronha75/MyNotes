### Logic Solutions (SoSe 25)

Solutions for Questions 7 and 8 from the SoSe 25 Exam.

### Question 7 (2 points)
**Problem**: Is $(a \wedge (c \rightarrow b)) \rightarrow (\neg c \leftrightarrow (a \rightarrow b))$ a tautology, unsatisfiable, or neither?

**Strategy**: [[Model Checking]] (Search for counter-examples).

1.  **Test for Tautology**: Can we make the sentence **False**?
    * Implication $X \rightarrow Y$ is False only if $X=True$ and $Y=False$.
    * **Make LHS True ($a \wedge (c \rightarrow b)$)**:
        * Let $a=True$.
        * Let $c \rightarrow b = True$. (e.g., $c=True, b=True$).
    * **Check RHS ($\neg c \leftrightarrow (a \rightarrow b)$)** with $a=T, b=T, c=T$:
        * $\neg c \Rightarrow False$.
        * $(a \rightarrow b) \Rightarrow (T \rightarrow T) \Rightarrow True$.
        * $F \leftrightarrow T$ is **False**.
    * **Result**: Since we found a case ($T,T,T$) where LHS=True and RHS=False, the whole sentence is False.
    * $\implies$ **NOT a Tautology**.

2.  **Test for Satisfiability**: Can we make the sentence **True**?
    * Let's try a different model, e.g., $a=False$.
    * LHS: $F \wedge (\dots) = False$.
    * Implication $F \rightarrow \dots$ is always **True**.
    * $\implies$ **Satisfiable**.

**Final Answer**: The sentence is **Satisfiable (but not a Tautology)** (sometimes called Contingent).

---

### Question 8 (4 points)
**Problem**: Prove that $\phi \wedge \psi \equiv \psi \wedge \phi$.

**Strategy**: [[PL Semantics]] (Truth Table Definition).
We show that $Truth(\phi \wedge \psi) = Truth(\psi \wedge \phi)$ for all interpretations.

| $\phi$ | $\psi$ | $\phi \wedge \psi$ | $\psi \wedge \phi$ | Match? |
| :---: | :---: | :---: | :---: | :---: |
| F | F | F | F | ✅ |
| F | T | F | F | ✅ |
| T | F | F | F | ✅ |
| T | T | T | T | ✅ |

**Justification**:
By the definition of the conjunction operator (defined in [[PL Semantics]]), the operation is commutative. The truth value depends only on the set of inputs being both True, regardless of order.

# Logic Solutions (SoSe 24)

Solutions for Questions 5 and 6 from the SoSe 24 Exam.

### Question 5 (2 points)
**Problem**: Is $((a \rightarrow b) \wedge c) \leftrightarrow ((\neg c \rightarrow b) \wedge \neg a)$ a tautology, unsatisfiable, or neither?

**Strategy**: [[Model Checking]] (Breaking the equivalence).
An equivalence $X \leftrightarrow Y$ is False if $X \neq Y$. Let's try to make one side True and the other False.

1.  **Try to make LHS True**:
    * Needs $c=True$ and $(a \rightarrow b)=True$.
    * Let $a=True, b=True, c=True$.
    * **LHS**: $(T \rightarrow T) \wedge T \Rightarrow T$.
    * **Check RHS**:
        * $\neg a = False$.
        * $(\dots) \wedge F$ is **False**.
    * **Result**: LHS=True, RHS=False. The sentence is **False** in this model.
    * $\implies$ **NOT a Tautology**.

2.  **Try to make the whole sentence True (Satisfiability)**:
    * Let's try to make both sides False.
    * Let $c=False$.
    * **LHS**: $(\dots) \wedge F \Rightarrow False$.
    * **RHS**:
        * $\neg c = True$.
        * Need $(\neg c \rightarrow b) \wedge \neg a$ to be False.
        * Let $b=True$. Then $(\neg c \rightarrow b)$ is True.
        * Let $a=True$. Then $\neg a$ is False.
        * RHS is **False**.
    * **Result**: LHS=False, RHS=False. $F \leftrightarrow F$ is **True**.
    * $\implies$ **Satisfiable**.

**Final Answer**: The sentence is **Satisfiable (but not a Tautology)**.

---

### Question 6 (4 points)
**Problem**: Prove that $\phi \rightarrow \psi \equiv \neg \phi \vee \psi$.

**Strategy**: [[Logical Equivalence]] (Truth Table Proof).


| $\phi$ | $\psi$ | $\phi \rightarrow \psi$ | $\neg \phi$ | $\neg \phi \vee \psi$ | Match? |
| :---: | :---: | :---: | :---: | :---: | :---: |
| F | F | **T** | T | **T** | ✅ |
| F | T | **T** | T | **T** | ✅ |
| T | F | **F** | F | **F** | ✅ |
| T | T | **T** | F | **T** | ✅ |

**Justification**:
As shown in the truth table, the column for $\phi \rightarrow \psi$ is identical to the column for $\neg \phi \vee \psi$ in all possible worlds. Therefore, by definition of [[Logical Equivalence]], they are equivalent.