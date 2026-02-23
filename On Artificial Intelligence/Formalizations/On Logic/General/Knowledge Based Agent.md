
A Knowledge-Based (KB) Agent is an intelligent agent that maintains an internal state of knowledge and acts by reasoning over this knowledge to achieve its goals.

> [!abstract] **Core Architecture**
> The agent is composed of two distinct components:
> 1.  **Knowledge Base (KB)**: A set of sentences expressed in a formal representation language that represents facts about the world.
> 2.  **Inference Engine**: A domain-independent mechanism for deriving new sentences from the KB.

### The Interface (TELL/ASK)
The agent interacts with its KB through a standard functional interface:
* **TELL(KB, Sentence)**: Adds a new sentence to the Knowledge Base (Knowledge acquisition).
* **ASK(KB, Query)**: Retrieves a sentence or determines the truth of a query based on what is currently known (Reasoning).

### The Loop
1.  **TELL**: The agent perceives the environment and tells the KB the new percept.
2.  **ASK**: The agent asks the KB what action it should perform.
3.  **TELL**: The agent records the action it took.

### Links
* **Uses**: [[Logic Syntax]], [[Logic Semantics]]
* **Implementation**: [[Inference]]
* **Tags**: #formalization #agents #logic