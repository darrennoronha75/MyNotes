Formalizing complex relationships in the Movie Database (`movies.pl`).

### 1. "Directors who also acted"
**Query**: `director(M, P), (actor(M, P, _) ; actress(M, P, _)).`
* *Logic*: Find a person `P` who is a director of movie `M` AND an actor/actress in that same movie.

### 2. "Actors in more than one movie"
**Query**: `actor(M1, A, _), actor(M2, A, _), M1 \= M2.`
* *Logic*: Find an actor `A` who appears in movie `M1` and movie `M2` where the movies are not identical.

### 3. Rule: "Actor knows Director"
**Rule**: `knows(A, D) :- (actor(M, A, _) ; actress(M, A, _)), director(M, D).`
* *Logic*: An actor knows a director if they both worked on the same movie `M`.

### Links
* **Reference**: [[movies.pl]]
* **Technique**: [[Prolog Execution Logic]]
````