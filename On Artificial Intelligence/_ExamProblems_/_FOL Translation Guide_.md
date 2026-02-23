

A step-by-step strategy for translating English sentences into First-Order Logic, a recurring task in **Lab 08** and **Exam SoSe 24**.

### 1. The Quantifier-Connective Pairings
* **Universal ($\forall$)** almost always pairs with **Implication ($\Rightarrow$)**.
    * *English*: "All students are smart."
    * *Logic*: $\forall x, Student(x) \Rightarrow Smart(x)$.
    * *Error*: Using $\wedge$ here means "Everything in the world is both a student and smart."
* **Existential ($\exists$)** almost always pairs with **Conjunction ($\wedge$)**.
    * *English*: "There is a smart student."
    * *Logic*: $\exists x, Student(x) \wedge Smart(x)$.
    * *Error*: Using $\Rightarrow$ here is "vacuously true" if there is anything in the world that isn't a student.

### 2. Identifying Relations vs. Objects
* **Common Nouns**: Usually Predicates (e.g., "Student" $\to Student(x)$).
* **Proper Nouns**: Usually Constants (e.g., "Berlin" $\to berlin$).
* **Verbs/Relations**: n-ary Predicates (e.g., "x borders y" $\to Border(x, y)$).

### 3. Transitivity Example (Lab 08)
* *English*: "Friendship is transitive."
* *Logic*: $\forall x, y, z, (Friend(x, y) \wedge Friend(y, z)) \Rightarrow Friend(x, z)$.

### Links
* **Context**: [[Quantifiers]]
* **Lab Reference**: [[lab08_solutions.pdf]]