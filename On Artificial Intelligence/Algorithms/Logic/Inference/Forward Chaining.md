
A data-driven inference algorithm for **Horn Clauses**. It determines if a query $q$ is entailed by the KB.

### Algorithm Logic
1.  **Count**: For every clause, count how many premises are not yet satisfied.
2.  **Agenda**: Initialize a queue with all **Facts** (clauses with 0 premises).
3.  **Loop**:
    * Pop symbol $p$ from the agenda.
    * If $p == q$, return **True**.
    * For every clause where $p$ is a premise:
        * Decrement its count.
        * If count becomes 0, push the clause's conclusion to the agenda.

### Properties
* **Complexity**: $O(N)$, where $N$ is the size of the KB (Linear Time).
* **Sound & Complete**: Yes, but *only* for Horn Clauses.



### Links
* **Requires**: [[Horn Clauses]]
* **Contrast**: [[Backward Chaining]]