An extension of Minimax for **Stochastic Games** (games with chance, like dice or card draws).

### Logic
In addition to **MAX** (us) and **MIN** (opponent) nodes, the tree includes **CHANCE** nodes.
* **MAX Node**: $v = \max(v, \text{child})$
* **MIN Node**: $v = \min(v, \text{child})$
* **CHANCE Node**: Calculates the **Expected Value** (weighted average).
  $$v = \sum_{s'} P(s' | s, a) \cdot \text{Value}(s')$$

### Complexity
* The inclusion of chance nodes increases the branching factor, making deep search significantly more expensive than standard Minimax.
* **Pruning**: Standard Alpha-Beta pruning is much less effective because exact bounds are harder to establish on averages.

### Links
* **Parent**: [[Minimax]]
* **Context**: [[Environment Types]] (Stochastic)