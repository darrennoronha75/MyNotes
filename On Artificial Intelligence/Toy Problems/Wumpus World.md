
A classic logical environment used to demonstrate knowledge-based agents, reasoning under partial observability, and logical inference.

> [!info] **PEAS Description**
> * **Performance**: +1000 for gold, -1000 for death, -1 per step, -10 for using arrow.
> * **Environment**: 4x4 Grid of rooms.
>   * **Pits**: Infinite depth (Deadly).
>   * **Wumpus**: Beast (Deadly).
>   * **Gold**: Shiny object (Goal).
> * **Actuators**: Move, Turn, Grab, Shoot.
> * **Sensors**:
>   * **Stench**: In squares adjacent to Wumpus.
>   * **Breeze**: In squares adjacent to a Pit.
>   * **Glitter**: In the square with Gold.

### Formal Logic Rules (Knowledge Base)
To solve this, the agent needs rules like:
* **Breeze Rule**: $B_{x,y} \Leftrightarrow (P_{x+1,y} \vee P_{x-1,y} \vee P_{x,y+1} \vee P_{x,y-1})$.
* "A square is breezy if and only if there is a pit in a neighboring square."

### Links
* **Used In**: [[Hybrid Wumpus Agent]]
* **Algorithm**: [[DPLL Algorithm]]