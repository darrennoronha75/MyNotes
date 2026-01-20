
## The Better Way (Chapter 4)
Instead of derivatives (Taylor), we use **Lagrange Interpolation**.
We approximate the kernel $g(x,y)$ by sampling it at specific grid points (support nodes) $\xi_\nu$.

## The Formula
$$g(x, y) \approx \sum_{\nu=0}^{k} g(\xi_\nu, y) \cdot L_\nu(x)$$
* **$g(\xi_\nu, y)$:** The function value at the grid point. This is the **coefficient** (depends on $y$).
* **$L_\nu(x)$:** The **Lagrange Polynomial**. It is $1$ at node $\xi_\nu$ and $0$ at all other nodes. This is the **basis** (depends on $x$).

## Why is this "Separable"?
Look at the formula again. We have successfully split $x$ and $y$:
* **Term A ($y$):** $b_\nu(y) = g(\xi_\nu, y)$
* **Term B ($x$):** $a_\nu(x) = L_\nu(x)$

This gives us a Rank-$k$ matrix automatically, and we never had to calculate a derivative!


### Links
* **Optimized by:** [[Chebyshev Interpolation]]
* **Tags:** #approximation #interpolation

---
[cite_start]*Reference: Lecture Script Page 33 [cite: 3698-3707]*