Formal metrics used to assess the performance of search algorithms.
### 1. Completeness

An algorithm is **Complete** if it is guaranteed to find a solution whenever at least one solution exists.
* **Complete:** BFS, Iterative Deepening Search, Uniform Cost Search (UCS).
* **Incomplete:** DFS (on infinite trees).
### 2. Optimality

An algorithm is **Optimal** if it is guaranteed to find the path with the lowest cumulative cost $g(n)$.
* **Optimal:** UCS, BFS (if costs are equal), Iterative Deepening Search (if costs are equal).

### 3. Complexity

* **Time Complexity:** Measured by the number of nodes generated.
* **Space Complexity:** Measured by the maximum number of nodes stored in the frontier at any time.

### Links
* **Connected To:** [[Search Problem Tuple]]
* **Tags:** #theory #metrics #evaluation
