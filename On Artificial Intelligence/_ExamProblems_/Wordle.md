
![[Pasted image 20260218182239.png]]

Formalizing the game Wordle for Exam SoSe 24 (Problem 2.5). While often a Constraint Satisfaction Problem, it can be rigorously defined as a **Search Problem**.

> [!abstract] **The Search Tuple**
> * **State Space ($S$)**: A tuple $(G, K, C)$
>   * $G$: Sequence of guesses made so far ($[w_1, w_2 \dots]$).
>   * $K$: Knowledge/Constraints derived (e.g., $Green=\{ (A, 1) \}, Gray=\{Z, X, Q\}$).
>   * $C$: The set of "Candidate Words" remaining in the dictionary consistent with $K$.
> * **Initial State**: $([], \emptyset, Dictionary)$.
> * **Actions ($A$)**: Choose a word $w \in Dictionary$ (or typically $w \in C$ for hard mode).
> * **Transition Model ($T$)**:
>   * Update $G \leftarrow G + [w]$.
>   * Receive Feedback (Green/Yellow/Gray) from environment.
>   * Update $K$ based on feedback.
>   * Filter $C$ to remove words violating new $K$.
> * **Goal Test**: Feedback is all Green (or $|C|=1$ and we guess it).

### Solving Method
* **Uninformed Search (DFS/BFS)**:
    * *Problem*: Branching factor is ~2,500 (size of solution list). Tree depth is 6. $2500^6$ is impossible.
* **Informed Search (Greedy)**:
    * **Heuristic**: Maximize **Information Gain** (or minimize expected size of $|C|$).
    * Choose guess $w$ that minimizes $\sum_{feedback} P(feedback|w) \cdot |C_{new}|$.
    * This effectively splits the search space in half (or better) at every step.

# Wordle as a Constraint Satisfaction Problem (CSP)

Formalizing Wordle for Exam SoSe 24 (Problem 2.5) as a CSP. Unlike the Search approach (which focuses on the sequence of guesses), the CSP approach focuses on **reducing the domain** of possible hidden words consistent with the feedback.

> [!abstract] **The CSP Tuple $(X, D, C)$**
> * **Variables ($X$)**: The five positions of the hidden word: $\{L_1, L_2, L_3, L_4, L_5\}$.
> * **Domains ($D$)**: Initially, $D_i = \{A, B, \dots, Z\}$ for all $i$.
> * **Constraints ($C$)**:
>   1.  **Unary Constraints (Green/Gray)**: 
>       * If feedback at $i$ is Green 'A': $L_i = A$.
>       * If feedback at $i$ is Gray 'B': $L_i \neq B$ (for all $i$, unless 'B' is duplicated elsewhere).
>   2.  **Binary/N-ary Constraints (Yellow)**:
>       * If feedback at $i$ is Yellow 'C': $L_i \neq C$ AND $\exists j \neq i$ such that $L_j = C$.
>   3.  **Global Constraint (Vocabulary)**:
>       * The tuple $(L_1, L_2, L_3, L_4, L_5) \in Dictionary$.

### Solving Algorithms
1.  **Constraint Propagation (Node Consistency)**:
    * Apply unary constraints immediately. If $L_1$ is Green 'S', the domain $D_1$ reduces to $\{S\}$.
    * **Pruning**: Remove any word from the *Vocabulary* that violates these node consistencies.

2.  **Forward Checking**:
    * When a guess is made, update the domains of all unassigned variables. If any domain becomes empty ($D_i = \emptyset$), the potential word path is invalid.

3.  **Generate and Test (with Heuristics)**:
    * Since the Global Constraint (Dictionary) is restrictive, we usually iterate through the **Vocabulary** (the domain of the word itself) rather than instantiating letters individually.
    * **MRV (Minimum Remaining Values)**: If solving letter-by-letter, focus on the position with the fewest legal letter options first (e.g., $L_1$ is known, $L_5$ has only 2 options $\to$ solve $L_5$ next).

Find a simpler explanantion of the solution below - 

# Wordle CSP Solver Algorithm

Once Wordle is modeled as a CSP, the solver follows a specific sequence of "Pruning" and "Selection" to find the hidden word.

### 1. Constraint Propagation (Filtering)
The most important step is reducing the domain of the **Global Constraint** (the dictionary $W$). After each guess $G_t$ and its feedback, we perform **Node Consistency** checks:
* **Green Filter**: $W_{new} = \{w \in W \mid w[i] == L_i\}$
* **Gray Filter**: $W_{new} = \{w \in W \mid L_{gray} \notin w\}$
* **Yellow Filter**: $W_{new} = \{w \in W \mid w[i] \neq L_{yellow} \wedge L_{yellow} \in w\}$



### 2. Backtracking Search (The Guess Loop)
Since we have a finite list of words, we don't need to build words letter-by-letter. Instead, we treat the remaining dictionary as our search space.
1.  **Variable Selection**: The variables are the 5 letter slots. 
2.  **Value Selection (Heuristics)**: Which word should we guess next?
    * **Minimum Remaining Values (MRV)**: Pick a guess that is expected to reduce the size of the remaining dictionary $W$ the most.
    * **Least Constraining Value**: Pick a word that leaves the most options open if you are playing "Hard Mode," or pick a word that eliminates the most common letters (like E, S, A, R, T) if playing "Normal Mode."

### 3. Forward Checking
Before making a guess, the algorithm "looks ahead." It simulates a guess and checks if that guess would result in an empty domain ($|W| = 0$). If a guess would leave no possible words left in the dictionary, that branch of the search is pruned immediately.

### Summary of the Step-by-Step Execution
1.  **Initialize**: Set $W$ = all 5-letter words.
2.  **Guess**: Pick a word $w$ (initially a high-entropy word like "ARISE").
3.  **Observe**: Receive Green/Yellow/Gray constraints.
4.  **Propagate**: Delete all words from $W$ that violate any constraint.
5.  **Repeat**: If $|W| > 1$, go back to step 2 with the smaller list.


### Links
* **Type**: [[Search Problem Tuple]]
* **Exam**: [[exam-sose2024.pdf]]
* **Tags**: #search #game-theory #heuristics