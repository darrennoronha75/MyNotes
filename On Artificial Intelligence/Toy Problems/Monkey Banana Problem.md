
A classic AI problem used to demonstrate **State Space Search** and **Planning**. The agent (monkey) must manipulate the environment to reach a goal state that is not immediately accessible.

> [!abstract] **Formal Problem Definition**
> We define the problem using the standard Search Tuple $(S, A, T, G, COST)$:
> 
> 1.  **State Space ($S$)**: Represented as a vector `[MonkeyPos, BoxPos, MonkeyHeight, HasBanana]`
>     * `MonkeyPos`: Location of the monkey ($A, B, C$).
>     * `BoxPos`: Location of the box ($A, B, C$).
>     * `MonkeyHeight`: $Low$ (floor) or $High$ (on box).
>     * `HasBanana`: $True$ or $False$.
> 
> 2.  **Initial State**: `[A, C, Low, False]` (Monkey at A, Box at C).
> 
> 3.  **Goal Test ($G$)**: `State == [_, _, _, True]` (Any state where monkey has banana).
> 
> 4.  **Actions ($A$)**:
>     * `Grasp`: If (MonkeyPos == BananaPos) and (Height == High).
>     * `Climb`: If (MonkeyPos == BoxPos) and (Height == Low).
>     * `Push(Direction)`: If (MonkeyPos == BoxPos) and (Height == Low).
>     * `Walk(Location)`: If (Height == Low).

### Implementation Logic
* **Preconditions**: Actions have strict logical prerequisites (e.g., cannot `Push` if on top of the box).
* **Effects**: Actions modify specific variables in the state tuple (e.g., `Climb` changes `MonkeyHeight` from $Low \to High$).
* **Search**: Solving this requires a sequence of actions (Plan):
    $$Walk(C) \rightarrow Push(B) \rightarrow Climb \rightarrow Grasp$$

### Links
* **Algorithm**: [[BFS]] (often used to find the shortest plan)
* **Concept**: [[Search Problem Tuple]]
* **Tags**: #search #planning #state-space