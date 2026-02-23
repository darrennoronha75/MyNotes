
Formal representation of Mixed Strategies using linear algebra and summation notation, essential for computing Expected Utility efficiently.

> [!abstract] **Vector Definitions**
> For a game with two players:
> * **Player 1 ($P1$):** Has $m$ pure strategies. Their mixed strategy is a column vector $p \in \mathbb{R}^m$:
>   $$p = [p_1, p_2, \dots, p_m]^T, \quad \text{where } \sum_{i=1}^m p_i = 1, \quad p_i \ge 0$$
> * **Player 2 ($P2$):** Has $n$ pure strategies. Their mixed strategy is a column vector $q \in \mathbb{R}^n$:
>   $$q = [q_1, q_2, \dots, q_n]^T, \quad \text{where } \sum_{j=1}^n q_j = 1, \quad q_j \ge 0$$

### Payoff Matrices ($A$ and $B$)
The game is defined by two payoff matrices of size $m \times n$:
* **$A$ (or $G_1$):** The payoff matrix for Player 1. Entry $A_{ij}$ is the utility for P1 when P1 plays row $i$ and P2 plays column $j$.
* **$B$ (or $G_2$):** The payoff matrix for Player 2. Entry $B_{ij}$ is the utility for P2 under the same conditions.

### Expected Utility ($U$)
The expected utility is the weighted sum of payoffs for all possible outcome pairs, weighted by their joint probability ($p_i \cdot q_j$).

#### 1. Summation Formulation
$$U_1(p, q) = \sum_{i=1}^m \sum_{j=1}^n p_i \cdot q_j \cdot A_{ij}$$
$$U_2(p, q) = \sum_{i=1}^m \sum_{j=1}^n p_i \cdot q_j \cdot B_{ij}$$

#### 2. Matrix Formulation ($p^T A q$)
This is the compact form used in algorithms.
* **For Player 1:**
  $$U_1(p, q) = p^T A q$$
  *(Dimension check: $(1 \times m) \cdot (m \times n) \cdot (n \times 1) = (1 \times 1)$ scalar)*

* **For Player 2:**
  $$U_2(p, q) = p^T B q$$

### Zero-Sum Case
In a Zero-Sum game, $A = -B$ (or $A+B=0$).
* We typically define a single matrix $G = A$.
* **P1 Utility:** $p^T G q$.
* **P2 Utility:** $-p^T G q$ (since P2 wants to minimize P1's gain).

### Computing Nash Equilibrium
A strategy profile $(p^*, q^*)$ is a Nash Equilibrium if:
1.  **P1 Optimality:** $p^{*T} A q^* \ge p^T A q^*$ for all valid $p$.
2.  **P2 Optimality:** $p^{*T} B q^* \ge p^{*T} B q$ for all valid $q$.

### Links
* **Implementation**: [[Mixed Strategy]]
* **Context**: [[Normal Form Game]]
* **Tags**: #formalization #linear-algebra #matrix-notation