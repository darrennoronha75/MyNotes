

The specific application of SATPlan to the Monkey-Banana problem.

### Variables
* **Fluents**: $P_x^t$ (Monkey at $x$), $B_x^t$ (Box at $x$), $OnBox^t$, $HasBanana^t$.
* **Actions**: $Left^t, Right^t, Climb^t, Push^t, Grab^t$.

### Key Constraints
1.  **Preconditions**: You can only $Grab$ if $OnBox$ is true.
    $$Grab^t \Rightarrow OnBox^t$$
2.  **Effect Axioms**: If you $Push$, the box moves with you.
    $$(P_A^t \wedge B_A^t \wedge Push^t) \Rightarrow B_B^{t+1}$$
3.  **Frame Axioms**: If you simply $Walk$, the box stays where it is.

### Links
* **Implementation**: [[lab07_solutions.pdf]]
* **Technique**: [[SATPlan]]