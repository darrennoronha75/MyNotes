We derive the exact operation count for Matrix-Vector Multiplication $y = A x$ in the $\mathcal{H}_p$ format.

**Recurrence Relation:**

Let $W_{MVM}(n)$ be the work for a block of size $n$.

- If $n=1$ (Leaf): $W(1) = 1$ (1 mult).    
- If $n > 1$ (Recursion):
    
    $$A = \begin{pmatrix} A_{11} & R_{12} \\ R_{21} & A_{22} \end{pmatrix}$$
    
    - 2 Recursive calls for $A_{11}, A_{22}$: $2 W(n/2)$.        
    - 2 Low-Rank products for $R_{12}, R_{21}$: $2 \times C_{rank-k}(n/2)$.        
        - Cost of rank-$k$ MVM is $2k(n/2 + n/2) = 2kn$.
            

**Total Work:**

$$W(n) = 2 W(n/2) + 2kn$$

This is the standard Master Theorem case $T(n) = 2T(n/2) + O(n)$.

**Solution:**
$$W(n) = O(n \log n)$$

**Exact Constant:**

Resolving the recurrence gives $W(n) \approx 2k \cdot n \log_2 n$.
### Links

- **Algorithm:** [[Algorithm - Hp-Matrix Vector Multiplication (MVM)]]    
- **Tags:** #derivations #complexity #mvm