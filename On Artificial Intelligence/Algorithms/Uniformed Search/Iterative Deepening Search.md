IDS is a strategy that combines the completeness/optimality of BFS with the linear space efficiency of DFS.

> [!info] **Logic & Properties**
> * **Mechanism:** Repeatedly applies Depth-Limited DFS, increasing the depth limit $L$ by 1 in each iteration ($L = 0, 1, 2, \dots$).
> * **Time Complexity:** $O(b^d)$, where $d$ is the goal depth. Although it repeats work, the bottom level dominates the sum.
> * **Space Complexity:** $O(b \cdot d)$. It only stores a single path at a time.
> * **Completeness:** Yes.
> * **Optimality:** Yes, if step costs are identical.

### Pseudocode
```python
def ITERATIVE_DEEPENING_SEARCH(problem):
    for depth in range(infinity):
        result = DEPTH_LIMITED_SEARCH(problem, depth)
        if result != cutoff: return result

def DEPTH_LIMITED_SEARCH(problem, limit):
    # Standard DFS logic but stops expansion if current depth == limit
    ...
````

### Mathematical Justification

In a tree with branching factor $b=10$ and depth $d=5$:

- **BFS Nodes:** $1 + 10 + 100 + 1,000 + 10,000 + 100,000 = 111,111$.    
- **IDS Nodes:** $6(1) + 5(10) + 4(100) + 3(1,000) + 2(10,000) + 1(100,000) = 123,456$.    
- **Overhead:** Only approximately $11\%$ more nodes expanded for a massive saving in memory.    

### Links

- **Foundation:** [[DFS]], [[BFS]]    
- **Tags:** #algorithm #ids #hybrid