The fundamental distinction in search algorithms lies in how they handle redundant paths (repeated states).

### Tree Search
* **Logic**: Does **not** track visited states. If a loop exists in the graph, Tree Search will explore it infinitely.
* **Memory**: Lower memory overhead (no `explored` set).
* **Completeness**: **Incomplete** if the state space contains loops.

### Graph Search
* **Logic**: Maintains an **Explored Set** (or `closed` list) of visited states. If the frontier generates a state already in the explored set, it is discarded.
* **Memory**: Higher memory overhead (stores every visited state).
* **Completeness**: **Complete** even in finite spaces with loops.
* **Optimality Caution**: For [[A-Star]] in Graph Search, the heuristic must be **Consistent**, not just Admissible.

### Links
* **Applied In**: [[BFS]], [[DFS]], [[A-Star]]