
An agent is anything that can be viewed as perceiving its environment through sensors and acting upon that environment through actuators.

> [!abstract] **Formal Definition**
> An agent is a function that maps percept sequences to actions:
> $$f: P^* \rightarrow A$$
> * **$P^*$**: The history of all percepts received to date.
> * **$A$**: The action selected.

### Rational Agent
A rational agent is one that acts so as to maximize the expected value of its performance measure, given its percept sequence and built-in knowledge.
* **Rationality $\neq$ Omniscience**: Rationality maximizes *expected* performance, while omniscience maximizes *actual* outcome (which is impossible without knowing the future).

### Links
* **Components**: [[PEAS]], [[Environment Types]]
* **Tags**: #formalization #agents #foundations