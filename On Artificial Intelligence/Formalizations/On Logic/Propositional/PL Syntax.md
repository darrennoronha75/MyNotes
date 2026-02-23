
Propositional Logic (PL) syntax defines the allowable construction of sentences using atomic propositions and logical connectives.

> [!info] **The Grammar (BNF)**
> * **Atomic Sentences**: Single propositional symbols (e.g., $P, Q, R, W_{1,3}$) or boolean constants ($True, False$).
> * **Complex Sentences**: Constructed recursively:
>   * $\neg S$ (Negation)
>   * $(S_1 \wedge S_2)$ (Conjunction)
>   * $(S_1 \vee S_2)$ (Disjunction)
>   * $(S_1 \Rightarrow S_2)$ (Implication)
>   * $(S_1 \Leftrightarrow S_2)$ (Biconditional).

### Operator Precedence
To reduce parentheses, operations are evaluated in this strict order:
1.  **$\neg$** (Highest)
2.  **$\wedge$**
3.  **$\vee$**
4.  **$\Rightarrow$**
5.  **$\Leftrightarrow$** (Lowest)

*Example*: $A \vee B \wedge C$ is interpreted as $A \vee (B \wedge C)$, not $(A \vee B) \wedge C$.

### Links
* **Semantics**: [[PL Semantics]]
* **Implementation**: [[PL.py]] (`sAnd`, `sOr`, `sNeg` classes)