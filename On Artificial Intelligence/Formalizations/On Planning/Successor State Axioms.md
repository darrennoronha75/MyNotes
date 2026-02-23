
A specific way of writing transition rules to solve the **Frame Problem** (the problem of specifying what *doesn't* change).

> [!warning] **The Problem**
> If we only write "Action $\to$ Effect" ($Grab \Rightarrow HaveBanana$), we fail to say that "If I *don't* drop it, I *still* have it." The logic solver might randomly make me lose the banana.

### The Solution Formula
"A fluent $F$ is true at time $t+1$ if and only if:
1.  **Action made it true** (Cause), OR
2.  **It was already true AND action didn't make it false** (Persistence)".

$$F^{t+1} \Leftrightarrow (ActionCausesF^t \vee (F^t \wedge \neg ActionDestroysF^t))$$

### Example (Monkey Banana)
$$HaveBanana^{t+1} \Leftrightarrow (Grab^t \vee (HaveBanana^t \wedge \neg Drop^t))$$.

### Links
* **Context**: [[SATPlan (Planning as Satisfiability)]]
* **Theoretical Basis**: [[Frame Problem]]