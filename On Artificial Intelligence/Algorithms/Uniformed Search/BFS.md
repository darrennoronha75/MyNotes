
BFS explores the search tree level by level, ensuring that all nodes at depth $d$ are expanded before any nodes at depth $d+1$.

> [!info] **Complexity & Properties**
> * **Frontier Logic:** FIFO (Queue).
> * **Time Complexity:** $O(b^d)$, where $b$ is the branching factor and $d$ is the depth of the shallowest goal.
> * **Space Complexity:** $O(b^d)$, as every node generated must remain in memory.
> * **Completeness:** Yes.
> * **Optimality:** Yes, if all step costs are equal.

### Pseudocode
```python
def BREADTH_FIRST_SEARCH(problem):
    node = Node(problem.initial_state)
    if problem.is_goal(node.state): return node
    frontier = Queue([node])
    reached = {problem.initial_state}
    while not frontier.is_empty():
        node = frontier.pop()
        for child in expand(problem, node):
            s = child.state
            if problem.is_goal(s): return child
            if s not in reached:
                reached.add(s)
                frontier.push(child)
    return failure
````

### Lab Insight (Lab 1)

In Python, BFS is efficiently implemented using `collections.deque` for the frontier to ensure $O(1)$ pop operations from the left.
### Links

- **Contrast:** [[DFS]]    
- **Optimized By:** [[Iterative Deepening Search]]    
- **Tags:** #algorithm #bfs #optimal