
A systematic way to determine if $w \models \phi$ in a Kripke model, as required in **Lab 09 (Question 1)** and **Exam SoSe 24**.

### Step-by-Step Procedure
1. **Decompose the Formula**: Break $\phi$ into its sub-formulas (e.g., $\Diamond \Box \neg a \to$ check $\neg a$, then $\Box \neg a$, then $\Diamond$).
2. **Identify Successors**: For the current world $w$, list all worlds $v$ such that $wRv$ exists.
3. **Check Inner Modal**:
   * For **$\Box \psi$**: Visit *every* successor. If $\psi$ is false in even one, the whole $\Box \psi$ is false.
   * For **$\Diamond \psi$**: Visit successors until you find *one* where $\psi$ is true. If found, $\Diamond \psi$ is true.
4. **Evaluate Boolean Logic**: Apply standard truth tables for $\wedge, \vee, \neg$ within the world.

### Example Trace (from Lab 09)
**Query**: $u \models \Diamond(a \wedge \Diamond \neg a)$
1. Look at $u$'s successors: $W = \{v, w\}$.
2. Check if $v$ or $w$ satisfies $(a \wedge \Diamond \neg a)$.
3. World $w$ satisfies $a$ and has no successors ($\Diamond \neg a$ is false there).
4. World $v$ satisfies... [logic continues].

### Links
* **Reference**: [[Kripke Semantics]]
* **Lab Context**: [[Lab 09 Trace]]