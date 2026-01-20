## The Story: Why do we care?
We proved that we *can* approximate the matrix as Rank-$k$ (using Taylor). But is the approximation **good**?
This Lemma answers: "How large must the rank $k$ be to achieve a specific error $\epsilon$?"
It proves that if the blocks are far enough apart, the error vanishes exponentially fast as we increase $k$.

## The Formula
The error of the rank-$k$ approximation is bounded by:
$$|g(x, y) - \tilde{g}(x, y)| \le C \cdot \left( \frac{\eta}{1+\eta} \right)^{k-1}$$


## Detailed Explanation of Terms
1.  **$\eta$ (Eta - Separation Ratio):**
    $$\eta = \frac{\text{Diameter of Block}}{2 \cdot \text{Distance to Target}}$$
    * This measures how "easy" the approximation is.
    * **Small $\eta$:** Block is far away (Easy).
    * ***Large $\eta$:** Block is close (Hard). 

2.  **The Convergence Factor $\left( \frac{\eta}{1+\eta} \right)$:**
    * Since $\eta > 0$, the fraction $\frac{\eta}{1+\eta}$ is always **less than 1**.
    * Example: If $\eta = 1$, factor is $0.5$.
    * As we take this to the power of $k-1$ (where $k$ is the Rank), the error shrinks.
    * **Exponential Convergence:** Because it is a power law ($0.5^k$), increasing the rank slightly drastically reduces the error.

## Link to Separable Approximations (Chapter 4)
This Taylor example is just a specific instance of a **Separable Approximation**.
* **Chapter 3 (Here):** We used Taylor polynomials to find the functions $a(x)$ and $b(y)$. This required analytic derivatives (Calculus).
* **Chapter 4 (Next):** We generalize this. We don't need derivatives. We can use **Interpolation** (Lagrange/Chebyshev polynomials) to find $a(x)$ and $b(y)$ for *any* function, even if we don't have a nice formula for it.
* **Connection:** Both methods rely on the same geometric "Admissibility Condition" ($\eta$) to work. 

### Links
* **Next Topic:** [[Separable Functions]]
* **Linked to** : [[Taylor Series Approximation]]
* **General Method:** [[Chebyshev Interpolation]]
* **Tags:** #calculations #error-analysis #convergence

