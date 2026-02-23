DFS prioritizes exploring the deepest nodes in the current branch of the search tree before backtracking to explore alternative branches.

> [!info] **Complexity & Properties**
> * **Frontier Logic:** LIFO (Stack).
> * **Time Complexity:** $O(b^m)$, where $b$ is the branching factor and $m$ is the maximum depth. In the worst case, every node is visited.
> * **Space Complexity:** $O(b \cdot m)$. Linear space is the primary advantage, as only the current path and siblings of nodes on that path are stored.
> * **Completeness:** No; it can get trapped in infinite loops in infinite state spaces or graphs with cycles.
> * **Optimality:** No; it returns the "leftmost" path found, not necessarily the shortest.

### Implementation Insights (Lab 1)

In the lab, we noted that for **Graph Search**, a `reached` or `explored` set must be maintained to avoid infinite loops and redundant expansions. DFS serves as the skeletal framework for [[Minimax]].


### Pseudocode (Tree Search)
```python
def DEPTH_FIRST_SEARCH(problem):
    node = Node(problem.initial_state)
    if problem.is_goal(node.state): return node
    frontier = Stack([node])
    while not frontier.is_empty():
        node = frontier.pop()
        for child in expand(problem, node):
            if problem.is_goal(child.state): return child
            frontier.push(child)
    return failure
    
    

```
### Links

- **Evolves Into:** [[Iterative Deepening Search]]    
- **Foundation:** [[Search Problem Tuple]]
