
The systematic algorithm to transform *any* propositional sentence into **Conjunctive Normal Form (CNF)** (a conjunction of clauses). This is a prerequisite for the [[Resolution Algorithm]].

> [!info] **The 6-Step Recipe**
> 1.  **Eliminate Biconditionals ($\Leftrightarrow$)**:
>     * Replace $\alpha \Leftrightarrow \beta$ with $(\alpha \Rightarrow \beta) \wedge (\beta \Rightarrow \alpha)$.
> 2.  **Eliminate Implications ($\Rightarrow$)**:
>     * Replace $\alpha \Rightarrow \beta$ with $\neg \alpha \vee \beta$.
> 3.  **Move Negation Inwards (De Morgan's Laws)**:
>     * $\neg (\alpha \wedge \beta) \to (\neg \alpha \vee \neg \beta)$
>     * $\neg (\alpha \vee \beta) \to (\neg \alpha \wedge \neg \beta)$
>     * $\neg \neg \alpha \to \alpha$.
> 4.  **Distribute $\vee$ over $\wedge$**:
>     * Apply rule: $\alpha \vee (\beta \wedge \gamma) \equiv (\alpha \vee \beta) \wedge (\alpha \vee \gamma)$.
> 5.  **Flatten**:
>     * Turn $(A \vee B) \vee C$ into $A \vee B \vee C$.
> 6.  **Factorization**:
>     * Remove duplicate literals ($A \vee A \to A$) and definitions like $A \vee \neg A$ (True).

### Example
Converting $A \Leftrightarrow (B \vee C)$:
1. $(A \Rightarrow (B \vee C)) \wedge ((B \vee C) \Rightarrow A)$
2. $(\neg A \vee B \vee C) \wedge (\neg (B \vee C) \vee A)$
3. $(\neg A \vee B \vee C) \wedge ((\neg B \wedge \neg C) \vee A)$
4. $(\neg A \vee B \vee C) \wedge (\neg B \vee A) \wedge (\neg C \vee A)$ **(CNF)**.

### Links
* **Target Format**: [[CNF (Conjunctive Normal Form)]]
* **Next Step**: [[Resolution Algorithm]]
* **Tags**: #algorithm #exam-technique