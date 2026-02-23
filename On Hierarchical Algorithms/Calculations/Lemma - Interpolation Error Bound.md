This lemma connects the **best possible approximation** (which is theoretically nice but hard to find) with the **interpolation** (which is easy to compute). It states that interpolation is "almost" as good as the best approximation, up to a factor of the Lebesgue constant.

**Statement:**

Let $f \in C[-1, 1]$ and let $\mathcal{I}_k f$ be the interpolation polynomial of degree $k$. Let $p_{best}$ be the polynomial of degree $k$ that minimizes $\|f - p\|_\infty$. Then:

$$\| f - \mathcal{I}_k f \|_\infty \le (1 + \Lambda_k) \cdot \| f - p_{best} \|_\infty$$

where $\Lambda_k$ is the [[Calculations/Lebesgue Constant (C_L)]].

## Interpretation

1. **Minimax Error ($\| f - p_{best} \|$):** This is the fundamental limit of how well a degree $k$ polynomial can fit $f$.    
2. **Amplification ($(1 + \Lambda_k)$):** By choosing good nodes (Chebyshev), $\Lambda_k$ is small, so our interpolation error is very close to the optimal error.    

### Links

- **Uses:** [[Calculations/Lebesgue Constant (C_L)]]    
- **Applied In:** [[Calculations/Lemma - Exponential Convergence of Separable Functions]]    
- **Tags:** #lemmas #error-analysis #interpolation