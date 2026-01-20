## Definition
In the context of Integral Equations, a **Kernel Function** $g(x, y)$ is a function of two variables that defines the "weight" or "influence" of a source point $y$ on a target point $x$ inside an integral.
$$f(x) = \int_{\Omega} g(x, y) u(y) dy$$
* **$u(y)$:** The density of the source (e.g., charge distribution).
* **$g(x, y)$:** The transfer function (e.g., how charge at $y$ creates potential at $x$).
* **$f(x)$:** The resulting field (e.g., total electric potential).

## Physical Intuition (Source vs. Target)
Think of the Kernel as the **"Interaction Rule"** of the universe you are simulating.
* **$y$ (Source):** Where the event is happening.
* **$x$ (Target):** Where you are measuring the effect.
* **$g(x, y)$:** How strong the effect is based on the relationship between $x$ and $y$.

**Example (Gravity/Electrostatics):**
$$g(x, y) = \frac{1}{|x - y|}$$
* If $x$ is very close to $y$ ($|x-y| \to 0$), the interaction is massive (Singularity).
* If $x$ is far from $y$, the interaction is weak and changes slowly (Smoothness).

## The "Matrix Generator"
In Hierarchical Algorithms, the Kernel Function is the "DNA" of the stiffness matrix $G$.
When we discretize the problem (Galerkin Method), the matrix entries are just averages of the kernel:
$$G_{ij} = \int_{D_i} \int_{D_j} g(x, y) \phi_i(x) \phi_j(y) dy dx \approx g(x_i, y_j)$$
* **Dense Matrix:** Since gravity/potential reaches everywhere, $g(x, y)$ is never zero. Thus, $G$ is a full, dense matrix.
* **H-Matrix Opportunity:** Because $g(x, y)$ becomes **smooth** when $x$ and $y$ are far apart, we can approximate it using [[Separable Functions]] (Taylor/Interpolation) in those regions.



## Types of Kernels
1.  **Singular Kernel:** Explodes when $x=y$ (e.g., $\log|x-y|$, $1/r$). These require H-Matrices.
2.  **Degenerate (Separable) Kernel:** Can be written as $\sum a(x)b(y)$. These create low-rank matrices naturally.
3.  **Compact Kernel:** Zero if $|x-y| > \delta$. These create Sparse matrices (Band matrices).

### Links
* **Approximated by:** [[Taylor Series Approximation]]
* **Approximated by:** [[Chebyshev Interpolation]]
* **Defines:** [[Separable Functions]]
* **Tags:** #foundations #definitions #physics-motivation
*