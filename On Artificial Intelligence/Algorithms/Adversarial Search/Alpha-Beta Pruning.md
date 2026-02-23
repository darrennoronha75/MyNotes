
An optimization for [[Minimax]] that maintains two values, $\alpha$ and $\beta$, to prune branches of the game tree.

> [!abstract] **The Logic**
> * **$\alpha$**: The value of the best (highest-value) choice found so far along the path for **MAX**.
> * **$\beta$**: The value of the best (lowest-value) choice found so far along the path for **MIN**.

### Pseudocode
```python
def MAX_VALUE(state, alpha, beta):
    if terminal(state): return utility(state)
    v = -infinity
    for a in actions(state):
        v = max(v, MIN_VALUE(result(state, a), alpha, beta))
        if v >= beta: return v  # Beta-cut
        alpha = max(alpha, v)
    return v

def MIN_VALUE(state, alpha, beta):
    if terminal(state): return utility(state)
    v = +infinity
    for a in actions(state):
        v = min(v, MAX_VALUE(result(state, a), alpha, beta))
        if v <= alpha: return v  # Alpha-cut
        beta = min(beta, v)
    return v
````

### Links

- **Theorem**: [[Pruning Optimality Theorem]]    
- **Base Algorithm**: [[Minimax]]