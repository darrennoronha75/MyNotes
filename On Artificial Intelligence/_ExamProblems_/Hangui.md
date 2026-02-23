
![[Pasted image 20260218181950.png]]


# Hangul (Korean) Syllable Grammar

Solution for **Exam SoSe 24 (Question 19)**.
Formalizing the 2D spatial syntax of Korean syllables based on vowel orientation.

### 1. Predicates (Vocabulary)
* **Types**: $Cons(x)$, $Vowel(x)$, $Vert(x)$ (Vertical vowel `|`), $Horiz(x)$ (Horizontal vowel `_`).
* **Relations**: $Right(x, y)$ ($x$ is right of $y$), $Below(x, y)$ ($x$ is below $y$).

### 2. The Logic of "Vertical" Syllables (e.g., 가)
We define a macro $Structure_{Vert}(S)$ that is true if syllable $S$ follows the vertical pattern.

$$
Structure_{Vert}(S) \iff 
\underbrace{\exists c_1, v : (Cons(c_1) \wedge Vowel(v) \wedge Vert(v) \wedge Right(v, c_1))}_{\text{Mandatory Core}}
\wedge 
\underbrace{\forall x : ((x \neq c_1 \wedge x \neq v) \rightarrow (Cons(x) \wedge Below(x, c_1) \wedge Below(x, v)))}_{\text{Optional Tail (Batchim)}}
$$

**Explanation of the $\forall$ clause:**
* This clause handles the **optional** second consonant ($C2$).
* It reads: *"If there is any other item $x$ in the block, it MUST be a consonant at the bottom."*
* If no $x$ exists, the statement is vacuously true. This allows the definition to validly describe both 2-letter (CV) and 3-letter (CVC) blocks.

### 3. The Logic of "Horizontal" Syllables (e.g., 구)
We define $Structure_{Horiz}(S)$ similarly, but with different spatial rules.

$$
Structure_{Horiz}(S) \iff 
\exists c_1, v : (Cons(c_1) \wedge Vowel(v) \wedge Horiz(v) \wedge Below(v, c_1))
\wedge 
\forall x : ((x \neq c_1 \wedge x \neq v) \rightarrow (Cons(x) \wedge Below(x, v)))
$$

### 4. Final Definition
A valid syllable must satisfy one of the two structures:

$$ValidSyllable(S) \iff Structure_{Vert}(S) \vee Structure_{Horiz}(S)$$



### Links
* **Concept**: [[First Order Logic]]
* **Exam**: [[exam-sose2024.pdf]]