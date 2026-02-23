A* is an informed search algorithm that uses an evaluation function to guide the search toward the goal, aiming to minimize the total estimated path cost.

> [!info] **Complexity & Properties**
> * **Evaluation Function**: $f(n) = g(n) + h(n)$.
>   * $g(n)$: The actual path cost from the start node to node $n$.
>   * $h(n)$: The estimated cost from node $n$ to the goal (Heuristic).
> * **Frontier Logic**: Priority Queue ordered by $f(n)$ (lowest first).
> * **Time Complexity**: $O(b^d)$ in the worst case, but efficiency depends heavily on the heuristic $h$.
> * **Space Complexity**: $O(b^d)$, as it maintains all generated nodes in memory to handle graph search.
> * **Completeness**: Yes.
> * **Optimality**: Yes, if $h(n)$ is **Admissible** (for Tree Search) or **Consistent** (for Graph Search).

### Pseudocode
```python
def A_STAR_SEARCH(problem, h):
    node = Node(problem.initial_state)
    # Frontier is a priority queue ordered by f(n) = g(n) + h(n)
    frontier = PriorityQueue(node, f=lambda n: n.path_cost + h(n))
    reached = {problem.initial_state: node}
    
    while not frontier.is_empty():
        node = frontier.pop()
        if problem.is_goal(node.state):
            return node
        for child in expand(problem, node):
            s = child.state
            if s not in reached or child.path_cost < reached[s].path_cost:
                reached[s] = child
                frontier.push(child)
    return failure
````

### Lab Insight (Lab 2)

During implementation, A* proved significantly more efficient than Uniform Cost Search (UCS) because it avoids expanding nodes in directions that move away from the goal. Common heuristics used include **Manhattan Distance** (for 4-way movement) and **Euclidean Distance** (for straight-line movement).

### Links

- **Prerequisite**: [[Heuristic Properties]]    
- **Foundation**: [[Search Problem Tuple]]    
- **Tags**: #algorithm #informed-search #astar