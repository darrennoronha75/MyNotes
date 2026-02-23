
FOL Resolution is a complete inference procedure that combines [[Unification]], [[Resolution Rule]], and a conversion to First-Order CNF.

### 1. Conversion to CNF (The "Lifting" Steps)
In addition to the propositional steps (eliminating implications, etc.), FOL requires:
1.  **Standardize Variables**: Ensure each quantifier uses a unique variable name.
2.  **Skolemization**: Remove existential quantifiers ($\exists$) by replacing variables with **Skolem Constants** or **Skolem Functions**.
    * *Example*: $\exists x : Heart(x, John) \to Heart(H_1, John)$ (where $H_1$ is a new constant).
3.  **Drop Universal Quantifiers**: All remaining variables are implicitly $\forall$.

### 2. The Resolution Step
Take two clauses and find a substitution $\theta$ that makes two literals complementary.
$$\frac{\{l_1, \dots, l_k\}, \quad \{m_1, \dots, m_n\}}{\text{SUBST}(\theta, \{l_1, \dots, l_{i-1}, l_{i+1}, \dots, l_k, m_1, \dots, m_{j-1}, m_{j+1}, \dots, m_n\})}$$
**Where** UNIFY($l_i, \neg m_j$) = $\theta$.



### Properties
* **Completeness**: Resolution is refutation-complete (it will always find a contradiction if the KB is unsatisfiable).

### Links
* **Base Algorithm**: [[Resolution Algorithm]]
* **Mechanism**: [[Unification]]