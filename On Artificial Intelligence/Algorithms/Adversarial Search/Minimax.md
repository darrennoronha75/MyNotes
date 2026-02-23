
Minimax is a recursive depth-first search used in zero-sum games to determine the optimal move for a player by assuming the opponent also plays optimally.

> [!info] **Complexity & Properties**
> * **Nature**: A Depth-First Search (DFS) traversal of the game tree.
> * **Time Complexity**: $O(b^m)$, where $b$ is the branching factor and $m$ is the maximum depth of the tree.
> * **Space Complexity**: $O(b \cdot m)$, as it only needs to store one path at a time.
> * **Optimality**: Yes, against an optimal opponent.

### Pseudocode
```python
def MINIMAX_DECISION(state):
    return argmax(state.actions, key=lambda a: MIN_VALUE(result(state, a)))

def MAX_VALUE(state):
    if TERMINAL_TEST(state): return UTILITY(state)
    v = -infinity
    for a in state.actions:
        v = max(v, MIN_VALUE(result(state, a)))
    return v

def MIN_VALUE(state):
    if TERMINAL_TEST(state): return UTILITY(state)
    v = +infinity
    for a in state.actions:
        v = min(v, MAX_VALUE(result(state, a)))
    return v
````

### Links

- **Optimization**: [[Alpha-Beta Pruning]].    
- **Variant**: [[Negamax]]    
- **Tags**: #adversarial-search #minimax #dfs