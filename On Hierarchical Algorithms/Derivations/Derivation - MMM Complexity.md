We derive the operation count for Matrix-Matrix Multiplication $C = A \cdot B$ in the $\mathcal{H}_p$ format. This is significantly more expensive than MVM.

**Recurrence Relation:**

Let $W_{MMM}(n)$ be the work for multiplying two size $n$ blocks.

- If $n=1$: $1$ op.    
- If $n > 1$:
    
    $$C_{11} = A_{11}B_{11} + A_{12}B_{21}$$
    
    - $A_{11}B_{11}$: Recursive call. (Recursive $\times$ Recursive).        
    - $A_{12}B_{21}$: Low-Rank $\times$ Low-Rank.        
    - **Dominant Term:** The recursive calls. There are 8 sub-block multiplications in total for a standard product, but the structure of $\mathcal{H}_p$ (sparse off-diagonals) simplifies this.
        

**The $\mathcal{H}_p$ Bottleneck:**

Even with the structure, calculating the updates for the sub-blocks involves adding low-rank matrices to recursive results.

The recurrence generally solves to:

$$W_{MMM}(n) = O(n \log^2 n)$$

The extra $\log n$ factor comes from the fact that at each of the $\log n$ levels, we perform work equivalent to a "full" MVM-like pass ($O(n \log n)$).

### Links

- **Algorithm:** [[Algorithm - Hp-Matrix Matrix Multiplication (MMM)]]
    
- **Tags:** #derivations #complexity #mmm