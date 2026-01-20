## Definition
A kernel function $g(x, y)$ is called **asymptotically smooth** if it is infinitely differentiable away from the diagonal ($x \neq y$) and its derivatives decay predictably as the distance between $x$ and $y$ increases.

This property is the mathematical "guarantee" that allows H-Matrices to exist. It ensures that the farther apart two clusters are, the smoother the interaction becomes, allowing us to approximate it with fewer terms (Low Rank).

## Mathematical Formulation
A function $g: \mathbb{R}^d \times \mathbb{R}^d \to \mathbb{R}$ is asymptotically smooth if there exist constants $C_{as1}, C_{as2} > 0$ such that for all multi-indices $\alpha \in \mathbb{N}_0^d$:

$$|\partial_x^\alpha g(x, y)| \le C_{as1} \cdot |\alpha|! \cdot C_{as2}^{|\alpha|} \cdot |x - y|^{-|\alpha| - g}$$
* **$|x - y|$:** The distance between target and source.
* **$|\alpha|!$:** Factorial growth of derivatives.
* **$|x - y|^{-|\alpha|}$:** The crucial decay term. As order $\alpha$ increases, the derivative shrinks rapidly *if* $|x-y|$ is large.
* **$g$:** A singularity exponent (e.g., $g=1$ for $1/r$ potentials).

## Standard Examples
1.  **Logarithmic Kernel (2D):** $g(x, y) = \log|x - y|$. Used in the Model Problem.
2.  **Newton Potential (3D):** $g(x, y) = \frac{1}{|x - y|}$. Used in Gravitation/Electrostatics.

## Complexity / Cost Implications
* **Approximation Rank:** Because of this smoothness, the rank $k$ required to achieve an error $\epsilon$ grows very slowly:
    $$k \sim \log(1/\epsilon)^d$$
* **Admissibility:** This definition drives the **Admissibility Condition** ($\text{diam} < \eta \cdot \text{dist}$). We only compress blocks where this smoothness dominates.

### Links
* **Basis for:** [[Lemma - Error Bound of Taylor Expansion]]
* **Basis for:** [[Interpolation]]
* **Example:** [[Model Problem - The Logarithmic Kernel]]
* **Tags:** #foundations #definitions #kernels #physics

---
*Reference: Lecture Script Page 101, Definition 8.1 and Page 24, Section 3.10*