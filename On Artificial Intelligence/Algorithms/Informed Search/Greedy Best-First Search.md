Greedy Best-First Search expands the node that appears to be closest to the goal based solely on the heuristic value $h(n)$, ignoring the path cost $g(n)$.

> [!warning] **Complexity & Properties**
> * **Evaluation Function**: $f(n) = h(n)$.
> * **Frontier Logic**: Priority Queue ordered by $h(n)$.
> * **Time Complexity**: $O(b^m)$ in the worst case, where $m$ is the maximum depth. A poor heuristic can lead the search down an infinite or very long path.
> * **Space Complexity**: $O(b^m)$, as all generated nodes are kept in memory.
> * **Completeness**: No; it can get stuck in loops in graph search or infinite paths.
> * **Optimality**: No; it finds a solution quickly but rarely the shortest one.

### Pseudocode
```python
def GREEDY_BEST_FIRST_SEARCH(problem, h):
    node = Node(problem.initial_state)
    # Frontier is a priority queue ordered by h(n)
    frontier = PriorityQueue(node, f=lambda n: h(n))
    reached = {problem.initial_state: node}
    
    while not frontier.is_empty():
        node = frontier.pop()
        if problem.is_goal(node.state):
            return node
        for child in expand(problem, node):
            s = child.state
            if s not in reached:
                reached[s] = child
                frontier.push(child)
    return failure
````

### Comparison to A-Star

Unlike [[A-Star]], which balances actual cost and estimated cost ($g+h$), Greedy search is "short-sighted." While it often reaches a goal faster in terms of node expansions, the resulting path is often non-optimal because it ignores the accumulated travel cost.

### Links

- **Optimization**: [[A-Star]]    
- **Prerequisite**: [[Heuristic Properties]]    
- **Tags**: #algorithm #greedy #informed-search