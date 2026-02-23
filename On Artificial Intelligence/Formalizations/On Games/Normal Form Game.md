
A formal representation of a simultaneous game where players choose strategies and receive payoffs based on the resulting strategy profile.

> [!abstract] **The Matrix Definition**
> A game in normal form is defined by:
> 1. **Players**: A finite set $P = \{1, 2, \dots, n\}$.
> 2. **Strategies**: A set of pure strategies $S_i$ for each player $i$.
> 3. **Payoffs**: A utility function $u_i: S_1 \times \dots \times S_n \rightarrow \mathbb{R}$ for each player $i$.

### Matrix Notation (2-Player)
For two players, this is visualized as a matrix where:
* **Rows** represent Player 1's strategies ($s_{1,j}$).
* **Columns** represent Player 2's strategies ($s_{2,k}$).
* **Entries** are tuples $(u_1, u_2)$ representing the payoff for (Player 1, Player 2).

| | $s_{2,1}$ | $s_{2,2}$ |
| :--- | :---: | :---: |
| **$s_{1,1}$** | $(u_1, u_2)_{1,1}$ | $(u_1, u_2)_{1,2}$ |
| **$s_{1,2}$** | $(u_1, u_2)_{2,1}$ | $(u_1, u_2)_{2,2}$ |

### Links
* **Solution Concept**: [[Nash Equilibrium]]
* **Examples**: [[Prisoner's Dilemma]], [[Hawk-Dove Game]]