
A standard First-Order Logic domain used to demonstrate predicates, rules, and recursion.

### Predicates (Facts)
The database typically stores basic relations:
* `Male(x)`, `Female(x)`
* `Father(x, y)`, `Mother(x, y)`
### Derived Relations (Rules)
Complex family ties are defined via logical implications:
1.  **Parent**:
    * $\forall x, y : \text{Mother}(x, y) \Rightarrow \text{Parent}(x, y)$.
    * $\forall x, y : \text{Father}(x, y) \Rightarrow \text{Parent}(x, y)$.
2.  **Sibling**:
    * $\forall x, y : (\exists p : \text{Parent}(p, x) \wedge \text{Parent}(p, y)) \wedge (x \neq y) \Rightarrow \text{Sibling}(x, y)$.
    * *Note*: The $x \neq y$ check is crucial to prevent being your own sibling.
3.  **Grandparent**:
    * $\forall g, c : (\exists p : \text{Parent}(g, p) \wedge \text{Parent}(p, c)) \Rightarrow \text{Grandparent}(g, c)$.
4.  **Ancestor (Recursive)**:
    * Base Case: $\forall x, y : \text{Parent}(x, y) \Rightarrow \text{Ancestor}(x, y)$.
    * Recursive Step: $\forall x, y, z : \text{Parent}(x, z) \wedge \text{Ancestor}(z, y) \Rightarrow \text{Ancestor}(x, y)$.


# Kinship Query Trace (Lab 8)

Analysis of common Prolog pitfalls identified in **Lab 08** using the `family.pl` database.

### 1. The Self-Sibling Problem
**Faulty Rule**: `sibling(X, Y) :- parent(P, X), parent(P, Y).`
* **Result**: Harry is his own sibling because the same parent (Charles) satisfies both `parent(P, X)` and `parent(P, Y)` when $X=Y$.
**Corrected Rule**: `sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.`

### 2. Duplicate Results
When querying `sibling(harry, Sib)`, results like `william` appear twice.
* **Reason**: Prolog finds a path through the `father` fact AND a path through the `mother` fact. Each independent proof branch yields a result.

### 3. Recursive Ancestors
**Correct Implementation**:
```prolog
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

### Links
* **Source**: [[family.pl]]
* **Language**: [[Logic Programming]]