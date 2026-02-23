
Detailed analysis of Question 1 from **Lab 09**, which is the primary template for Modal Logic exam questions.

### Given Model
* **Worlds**: $u, v, w$.
* **Relations**: $u \to v, u \to w, v \to w$.
* **Interpretations**: $\pi_u=\{a, b\}$, $\pi_v=\{a, \neg b\}$, $\pi_w=\{\neg a, \neg b\}$.

### Statement Validations
1. **$u \models \Diamond(a \wedge \Diamond \neg a)$**: **True**.
   * $u$ sees $v$. In $v$, $a$ is true.
   * $v$ sees $w$. In $w$, $\neg a$ is true $\implies \Diamond \neg a$ is true at $v$.
   * Thus, $v$ satisfies $(a \wedge \Diamond \neg a)$, making it true for $u$.
2. **$v \models \Box \neg a$**: **True**.
   * $v$ only sees $w$.
   * In $w$, $\neg a$ is true. Therefore, in all successors of $v$, $\neg a$ holds.
3. **$w \models \Diamond a \vee b$**: **False**.
   * $w$ has no successors $\implies \Diamond a$ is False.
   * $b$ is False at $w$. $F \vee F = F$.

### Links
* **Theory**: [[Kripke Semantics]]
* **Algorithm**: [[Modal Trace Algorithm]]