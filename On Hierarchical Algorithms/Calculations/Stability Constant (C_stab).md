The **Stability Constant** ($C_{stab}$ or $\Lambda_k$) measures how much an interpolation operator $\mathcal{I}_k$ can amplify the magnitude of a function. It serves as a multiplier in the error bound of the approximation.

**Mathematical Formulation:**

For an interpolation operator $\mathcal{I}_k$ projecting onto a polynomial space $P_k$:

$$C_{stab} := \sup_{f \neq 0} \frac{\| \mathcal{I}_k f \|_\infty}{\| f \|_\infty}$$

## Significance

- **Ideally:** We want $C_{stab}$ to be small (close to 1).    
- **Worst Case:** If $C_{stab}$ is large, even a tiny change in the function values (e.g., rounding errors) can lead to massive oscillations in the interpolant.    
- **Node Choice:** The value of $C_{stab}$ depends entirely on the choice of interpolation nodes (e.g., Equidistant vs. Chebyshev).   

### Links

- **Specific Case:** [[Calculations/Lebesgue Constant (C_L)]]    
- **Used In:** [[Calculations/Lemma - Interpolation Error Bound]]    
- **Tags:** #calculations #stability #interpolation