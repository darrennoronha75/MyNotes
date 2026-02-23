A strategy profile where no player has an incentive to deviate unilaterally.

> [!info] **Formal Definition**
> A strategy profile $s^* = (s_1^*, \dots, s_n^*)$ is a Nash Equilibrium if for every player $i$:
> $$u_i(s_i^*, s_{-i}^*) \ge u_i(s_i, s_{-i}^*) \quad \forall s_i \in S_i$$
> Where $s_{-i}^*$ represents the strategies of all players other than $i$.

### Best Response Logic
* In a Nash Equilibrium, every player's strategy is a **Best Response** to the strategies of the other players.
* Mathematically: $s_i^* \in BR_i(s_{-i}^*)$.

### Mixed Strategy Nash Equilibrium
* Players choose probabilities $p_i$ for each pure strategy $s_i$.
* An equilibrium exists when players are **indifferent** between the pure strategies they play with non-zero probability.

### Links
* **Theorem**: [[Nash's Theorem]]
* **Matrix View**: [[Normal Form Game]]