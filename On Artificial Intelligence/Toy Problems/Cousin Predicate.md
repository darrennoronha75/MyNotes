
Refining the First-Order Logic definition for the `cousin(x, y)` relationship, as seen in **Exam SoSe 25 (Question 7)**.

### The Correct Formula
Two individuals are cousins if their parents are siblings, and they are not the same person.

> [!abstract] **FOL Definition**
> $$\forall x, y : Cousin(x, y) \iff \exists p_1, p_2 : \big( Parent(p_1, x) \wedge Parent(p_2, y) \wedge Sibling(p_1, p_2) \wedge (x \neq y) \big)$$

### Analysis of your Version
* **Predicate Direction**: You wrote `Parent(x, p1)`. In the `family.pl` and lecture convention, `parent(x, y)` means **x is the parent of y**. Your version says $x$ is the parent of $p1$, making $x$ the grandparent generation.
* **Logic of Siblinghood**: Usually, we add a constraint that $x$ and $y$ are not siblings ($\neg Sibling(x, y)$) to distinguish "First Cousins" from siblings, though "Parents are siblings" mathematically implies they aren't siblings in most standard trees.
* **Standardizing Apart**: Using $p_1$ and $p_2$ is excellent practice to ensure the two parents are identified as distinct entities in the search space.



### Prolog Implementation
```prolog
cousin(X, Y) :- 
    parent(P1, X), 
    parent(P2, Y), 
    sibling(P1, P2), 
    X \= Y.