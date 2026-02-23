
Negamax is a simplified implementation of Minimax based on the zero-sum property where $max(a, b) = -min(-a, -b)$.
### Core Logic
In a zero-sum game, the utility for Player 1 is the negative utility for Player 2. This allows us to use a single `MAX` function for both players by negating the values returned from the recursive calls.

### Pseudocode
```python
def NEGAMAX(state):
    if TERMINAL_TEST(state):
        return UTILITY(state)
    
    value = -infinity
    for action in state.actions:
        value = max(value, -NEGAMAX(result(state, action)))
    return value
````

### Links

- **Base Algorithm**: [[Minimax]]    
- **Optimized**: [[Alpha-Beta Pruning]]