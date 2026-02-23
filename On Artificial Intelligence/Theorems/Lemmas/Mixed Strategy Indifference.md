This lemma provides the primary algorithmic method for calculating a Mixed Strategy Nash Equilibrium (MSNE).

> [!abstract] **Lemma Statement**
> If a player's mixed strategy $\sigma_i$ is a best response to the opponents' strategies $\sigma_{-i}$, then every pure strategy $s_i$ that is played with non-zero probability ($P(s_i) > 0$) must yield the same expected utility.

### Mathematical Logic
For a 2-player game where Player 1 plays Hawk with probability $p$ and Dove with $1-p$:
* If Player 2 is to play a mixed strategy, they must be **indifferent** between their own pure strategies.
* $E_2(\text{Hawk}) = E_2(\text{Dove})$.
* This allows us to solve for the opponent's mixing probability $p$.

### Links
* **Applied In**: [[Nash Equilibrium]]
* **Calculation**: [[Mixed Strategy]]