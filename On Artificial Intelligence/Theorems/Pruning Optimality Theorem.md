The pruning of a branch in Alpha-Beta search does not affect the final decision.

> [!abstract] **Theorem Statement**
> Alpha-beta pruning yields the exact same decision as a full Minimax search while exploring significantly fewer nodes.

### Proof Logic
* If a node is pruned, it is because we have already found a move at an upper level that is guaranteed to be better than anything this branch could provide.
* For a **MAX** node: If the value $v$ becomes $\ge \beta$, we stop because the **MIN** parent already has an option with value $\beta$ and will never choose this branch.
* For a **MIN** node: If the value $v$ becomes $\le \alpha$, we stop because the **MAX** parent already has an option with value $\alpha$ and will never choose this branch.

### Links
* **Algorithm**: [[Alpha-Beta Pruning]]
* **Foundation**: [[Minimax]]