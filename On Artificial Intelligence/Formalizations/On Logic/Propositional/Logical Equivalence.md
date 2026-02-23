
Two sentences $\alpha$ and $\beta$ are logically equivalent if they are true in exactly the same set of models.

> [!abstract] **Definition**
> $\alpha \equiv \beta \iff M(\alpha) = M(\beta)$
> (or iff $\alpha \Leftrightarrow \beta$ is Valid).

### Key Laws for Exam (Rewriting Rules)
These are essential for [[CNF Conversion Algorithm]].

1.  **De Morgan's Laws**:
    * $\neg(A \wedge B) \equiv (\neg A \vee \neg B)$
    * $\neg(A \vee B) \equiv (\neg A \wedge \neg B)$
2.  **Implication Elimination**:
    * $(A \Rightarrow B) \equiv (\neg A \vee B)$
3.  **Biconditional Elimination**:
    * $(A \Leftrightarrow B) \equiv ((A \Rightarrow B) \wedge (B \Rightarrow A))$
4.  **Distributivity**:
    * $A \vee (B \wedge C) \equiv (A \vee B) \wedge (A \vee C)$
5.  **Double Negation**:
    * $\neg \neg A \equiv A$

### Links
* **Used In**: [[CNF (Conjunctive Normal Form)]]
* **Tags**: #formalization #logic #exam-tools