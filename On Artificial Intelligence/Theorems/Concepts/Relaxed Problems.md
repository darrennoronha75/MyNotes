A standard theoretical method for deriving admissible heuristics.

> [!abstract] **Definition**
> A problem $P'$ is a **Relaxed Problem** of $P$ if it has fewer restrictions on the actions.
> * The cost of an optimal solution to a relaxed problem $h_{relaxed}(n)$ is an **admissible heuristic** for the original problem.

### Example: 8-Puzzle
* **Original**: A tile can move from A to B if A is adjacent to B **and** B is empty.
* **Relaxation 1**: A tile can move from A to B if A is adjacent to B (ignoring empty space constraint).
    * **Result**: **Manhattan Distance** heuristic.
* **Relaxation 2**: A tile can move from A to B (ignoring adjacency and empty space).
    * **Result**: **Misplaced Tiles** heuristic.

### Links
* **Generates**: [[Heuristic Properties]] (Admissible Heuristics)
* **Used In**: [[A-Star]]