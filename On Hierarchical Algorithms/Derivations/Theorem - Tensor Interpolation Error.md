In higher dimensions ($d > 1$), we approximate the kernel $g(x, y)$ using a tensor product of 1D interpolations. This theorem bounds the error of this multidimensional approximation.

**Formulation:**

Let $\mathcal{I}^{(x)}_k$ and $\mathcal{I}^{(y)}_k$ be interpolation operators on the $x$ and $y$ domains respectively. The tensor product interpolant is $\mathcal{I} = \mathcal{I}^{(x)}_k \otimes \mathcal{I}^{(y)}_k$.

The error is bounded by:

$$\| g - (\mathcal{I}^{(x)}_k \otimes \mathcal{I}^{(y)}_k) g \|_\infty \le (1 + \Lambda_k^{(x)}) E_y + (1 + \Lambda_k^{(y)}) E_x$$

where $E_x$ and $E_y$ are the interpolation errors in the single variables.

## Dimensionality

- **Storage Cost:** For a rank $k$ approximation in $d$ dimensions, the storage often scales as $k^d$ (Standard Tensor Product) or $d \cdot k$ (if using CP/Tucker format).
- **H-Matrices:** We typically use this theorem to justify that we can apply standard 1D interpolation strategies (like Chebyshev grids) to 3D integral problems by applying them along each coordinate axis.    

### Links

- **Uses:** [[Calculations/Lebesgue Constant (C_L)]]    
- **Extends:** [[Calculations/Lemma - Interpolation Error Bound]]    
- **Tags:** #derivations #tensor-product #multidimensional