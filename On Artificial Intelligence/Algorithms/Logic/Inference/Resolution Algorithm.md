
A **Proof by Contradiction** (Reductio ad Absurdum) algorithm used to determine if $KB \models \alpha$.

### The Process
To show that $KB \models \alpha$, we show that $(KB \wedge \neg \alpha)$ is **Unsatisfiable**.

1.  **Negate the Goal**: Add $\neg \alpha$ to the KB.
2.  **Convert to CNF**: Turn $(KB \wedge \neg \alpha)$ into a set of clauses.
3.  **Loop**:
    * Select two clauses that contain complementary literals.
    * Apply the [[Resolution Rule]] to generate a new clause (Resolvent).
    * If the Resolvent is the **Empty Clause**, return **True** (Contradiction found $\to$ Entailment holds).
    * If the Resolvent is already in the set, discard it.
    * If no new clauses can be generated, return **False** (Entailment fails).

### Properties
* **Sound**: Yes.
* **Complete**: Yes (for PL and FOL).

### Links
* **Prerequisite**: [[CNF Conversion]]
* **Kernel**: [[Resolution Rule]]
* **Tags**: #algorithm #inference #proof