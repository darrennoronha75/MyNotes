
A preprocessing step in FOL inference to ensure that variable names do not collide between different sentences or rules.

### The Problem
If we have:
1. $\forall x : Knows(John, x)$
2. $\forall x : Likes(x, Pizza)$
An inference engine might incorrectly assume the $x$ in sentence 1 is the same as the $x$ in sentence 2.

### The Solution
Rename variables so that no two sentences share a variable name.
1. $\forall x_1 : Knows(John, x_1)$
2. $\forall x_2 : Likes(x_2, Pizza)$

### Application
This is a mandatory step before performing [[Unification]] or [[FOL Resolution]].

### Links
* **Context**: [[Unification]]
* **Context**: [[FOL Resolution]]