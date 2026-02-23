The **Lebesgue Constant** ($\Lambda_k$) is the specific stability constant for Lagrange interpolation. It provides a computable upper bound for the stability of the interpolation operator.

**Mathematical Formulation:**

Given a set of interpolation nodes $\{x_0, \dots, x_k\}$ and their corresponding Lagrange basis polynomials $L_i(x)$, the Lebesgue constant is:

$$\Lambda_k := \max_{x \in [-1, 1]} \sum_{i=0}^k | L_i(x) |$$

where $L_i(x) = \prod_{j \neq i} \frac{x - x_j}{x_i - x_j}$.

## Comparison of Nodes

- **Equidistant Nodes:** $\Lambda_k$ grows exponentially ($2^k$). This leads to the **Runge Phenomenon** (divergence at the edges).
    
- **Chebyshev Nodes:** $\Lambda_k$ grows logarithmically ($\frac{2}{\pi} \log k$). This is the optimal growth rate, making Chebyshev nodes the standard choice for H-Matrices.
    

### Links

- **Is A:** [[Calculations/Stability Constant (C_stab)]]
    
- **Related To:** [[Approximation/Chebyshev Interpolation]]
    
- **Tags:** #calculations #interpolation #constants