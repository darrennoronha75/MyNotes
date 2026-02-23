
While all agents map percepts to actions ($f: P^* \rightarrow A$), their internal architecture differs in complexity.

### 1. Simple Reflex Agents
* **Logic**: Acts only on the *current* percept. Condition-Action rules (e.g., "If car in front is braking, then brake").
* **Limitation**: Only works if the environment is **Fully Observable**.

### 2. Model-Based Reflex Agents
* **Logic**: Maintains an **Internal State** to track aspects of the world that are not currently visible (handling partial observability).
* **Component**: Needs a "Model" of how the world evolves ($T$) and how sensors work.

### 3. Goal-Based Agents
* **Logic**: Acts to achieve a specific destination or state ($G$). It uses **Search** and **Planning**.
* **Flexibility**: Can adapt to new goals, unlike reflex agents.

### 4. Utility-Based Agents
* **Logic**: Maximizes a utility function ($U$) that measures "happiness" or performance quality, allowing trade-offs between conflicting goals (e.g., speed vs. safety).

### 4. Knowledge-Based Agents
* **Logic**: Maximizes a utility function ($U$) that measures "happiness" or performance quality, allowing trade-offs between conflicting goals (e.g., speed vs. safety).
### Links
* **Parent**: [[Agent]]
* **Properties**: [[Environment Types]]