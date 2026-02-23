Unification is the algorithmic process of finding a substitution that makes two first-order logic expressions identical. It is the "lifting" mechanism that allows FOL inference to work with variables.

> [!abstract] **Definition**
> Given two sentences $p$ and $q$, **UNIFY($p, q$) = $\theta$** where $p\theta = q\theta$.
> * $\theta$ is a substitution (a set of variable bindings).

### Examples
1.  **UNIFY**($Knows(John, x)$, $Knows(John, Jane)$) 
    * $\theta = \{x / Jane\}$.
2.  **UNIFY**($Knows(John, x)$, $Knows(y, Bill)$) 
    * $\theta = \{y / John, x / Bill\}$.
3.  **UNIFY**($Knows(John, x)$, $Knows(y, Mother(y))$)
    * $\theta = \{y / John, x / Mother(John)\}$.

### Standardizing Variables
To avoid name clashes (e.g., using $x$ in two different rules), we "standardize apart" by renaming variables in one of the sentences before unifying (e.g., $Knows(John, x_1)$ and $Knows(John, x_2)$).

### Links
* **Used In**: [[Generalized Modus Ponens]], [[FOL Resolution]]
* **Implementation**: [[lab08.pdf]] (Prolog's `=` operator)
* **Tags**: #algorithm #logic #unification