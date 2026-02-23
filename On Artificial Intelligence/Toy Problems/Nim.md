A specific variant of Nim played in the labs where the goal is to **avoid** taking the last object (Misere play) or **take** the last object (Normal play), often used to demonstrate Backward Induction.

### The Setup
* **Heap Size**: $N$ objects (e.g., 21).
* **Moves**: Players can remove $1, 2, \dots, k$ objects (e.g., $k=3$).
* **Condition**: In the lab variant, the player who takes the last object **loses** (Misere).

### The "4k" Derivation (Modulo Arithmetic)
To derive the winning strategy, we use **Backward Induction** starting from the losing state.

1.  **Target State (Lose)**: $n = 0$ (The previous player took the last object).
2.  **Winning States**: Any state from which you can force the opponent into a Losing State.
    * If $n=1$, take 1 $\rightarrow$ Opponent gets 0 (Lose). **Win**.
    * If $n=2$, take 2 $\rightarrow$ Opponent gets 0 (Lose). **Win**.
    * If $n=3$, take 3 $\rightarrow$ Opponent gets 0 (Lose). **Win**.
3.  **Losing States (Recursive)**: A state from which *all* moves lead to a Winning State for the opponent.
    * If $n=4$: You remove 1 ($\rightarrow 3$), 2 ($\rightarrow 2$), or 3 ($\rightarrow 1$). All leave the opponent in a winning spot. **Lose**.

### The General Pattern ($k=3$)
* **Losing Positions ($L$)**: $n \equiv 1 \pmod 4$ (e.g., 1, 5, 9, 13, 17, 21).
    * *Note: In the lab's "21" game, usually the one who takes the last one loses. If starting with 21, the first player is in a Losing Position if the other plays optimally.*
* **Strategy**: Always finish your turn leaving the opponent with a number of items $n'$ such that $n' \equiv 1 \pmod 4$.
* **Formula**: If current items $n$, remove $x$ such that:
    $$(n - x) \equiv 1 \pmod 4$$


### Links
* **Concept**: [[Backward Induction]]
* **Algorithm**: [[Minimax]]
* **Tags**: #game-theory #modulo-arithmetic #misere