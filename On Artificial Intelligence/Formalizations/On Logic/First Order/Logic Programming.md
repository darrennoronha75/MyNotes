
A restricted form of First-Order Logic designed for efficient inference, as seen in Lab 8.
### 1. Horn Clauses
Prolog programs are built exclusively from **Horn Clauses**:
* **Rules**: $H \leftarrow B_1 \wedge B_2 \wedge \dots \wedge B_n$.
    * Read as: "Head ($H$) is true if Body ($B_1 \dots B_n$) are all true."
    * *Example*: `grandparent(X, Y) :- parent(X, Z), parent(Z, Y).`
* **Facts**: Clauses with no body (always true).
    * *Example*: `father(philip, charles).`

### 2. Closed World Assumption (CWA)
Standard logic assumes unknown facts could be True or False. Logic programming assumes **anything not known to be True is False**.
* **Negation as Failure**: If the system cannot derive $P$, it concludes $\neg P$.
* *Example*: If `mother(meghan, archie)` is not in the database, Prolog says `false`.

### 3. Standardization of Variables
In rules, variables are implicitly universally quantified.
* `parent(X, Y) :- father(X, Y)` implies $\forall x, y : \text{Father}(x, y) \Rightarrow \text{Parent}(x, y)$.

### Links
* **Implementation**: [[family.pl]], [[movies.pl]]
* **Algorithm**: [[Backward Chaining]]
* **Base Logic**: [[Horn Clauses]] (Propositional version)