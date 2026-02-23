
While modal operators ($\Box, \Diamond$) look at accessible worlds, standard boolean connectives are evaluated locally within a single world $w$.

### Semantic Clauses
For a model $I = \langle W, R, \pi \rangle$ and a world $w \in W$:

1.  **Atomic Proposition**: $I, w \models a \iff \pi_w(a) = True$.
2.  **Negation**: $I, w \models \neg \phi \iff I, w \not\models \phi$.
3.  **Conjunction**: $I, w \models \phi \wedge \psi \iff (I, w \models \phi \text{ and } I, w \models \psi)$.
4.  **Disjunction**: $I, w \models \phi \vee \psi \iff (I, w \models \phi \text{ or } I, w \models \psi)$.
5.  **Implication**: $I, w \models \phi \rightarrow \psi \iff (I, w \models \phi \implies I, w \models \psi)$.

> [!important] **Exam Note (Question 14, SoSe 25)**
> A formula without modal operators is true in $(I, w)$ if and only if it is true as a standard propositional formula using the local interpretation $\pi_w$. The "mode" of the world does not change the basic rules of logic; it only adds layers on top of them.



### Links
* **Foundations**: [[Kripke Semantics]]
* **Contrast**: [[Modal Operators]] (Global evaluation)