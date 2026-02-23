This lemma provides the theoretical guarantee that H-Matrices work. It proves that for [[Foundations/Asymptotically Smooth Kernels]], the interpolation error decays **exponentially** as we increase the rank $k$.

**Statement:**

Let $g(x, y)$ be an asymptotically smooth kernel defined on admissible domains $D_x \times D_y$ satisfying the condition $\text{diam}(D_y) \le \eta \cdot \text{dist}(D_x, D_y)$.

Then, the interpolation error decays as:

$$\| g - \mathcal{I}_k g \|_\infty \le C \cdot \left( \frac{\eta}{1 + \sqrt{1 - \eta^2}} \right)^k$$

(Note: The exact base of the exponential depends on the specific domain geometry, but it is always $< 1$ for admissible blocks).

## Key Takeaway

- **Rate:** The error behaves like $O(\rho^{-k})$ where $\rho > 1$.
    
- **Implication:** To achieve an accuracy of $\varepsilon$, we only need a rank $k \sim |\log \varepsilon|$.
    
- **Efficiency:** This logarithmic rank growth is what enables the $O(N \log N)$ complexity of H-Matrix storage.
    

### Links

- **Requires:** [[Foundations/Asymptotically Smooth Kernels]]    
- **Requires:** [[Foundations/Admissibility Condition]]    
- **Justifies:** [[Rank-k Matrix Representation]]
- Tags: #lemmas #convergence #proofs