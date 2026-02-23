Uniform Cost Search expands the node with the lowest path cost $g(n)$, ensuring an optimal path in environments with varying step costs.

> [!info] **Complexity & Properties**
> * **Frontier Logic**: Priority Queue ordered by $g(n)$.
> * **Time Complexity**: $O(b^{1 + \lfloor C^* / \epsilon \rfloor})$, where $C^*$ is the cost of the optimal solution and $\epsilon$ is the minimum step cost.
> * **Space Complexity**: $O(b^{1 + \lfloor C^* / \epsilon \rfloor})$, as it stores all nodes in the frontier.
> * **Completeness**: Yes, if step costs $\ge \epsilon > 0$.
> * **Optimality**: Yes, UCS expands nodes in order of increasing path cost.

### Pseudocode
```python
def UNIFORM_COST_SEARCH(problem):
    node = Node(problem.initial_state)
    frontier = PriorityQueue(node, f=lambda n: n.path_cost)
    reached = {problem.initial_state: node}
    
    while not frontier.is_empty():
        node = frontier.pop()
        if problem.is_goal(node.state): return node
        for child in expand(problem, node):
            s = child.state
            if s not in reached or child.path_cost < reached[s].path_cost:
                reached[s] = child
                frontier.push(child)
    return failure
````

### Links

- **Uninformed Variant**: [[BFS]] (UCS with unit costs).    
- **Informed Evolution**: [[A-Star]] (adds heuristic $h(n)$).    
- **Tags**: #algorithm #ucs #optimal