## The Function
The standard model problem for Hierarchical Matrices uses the kernel function:
$$g(x, y) = -\log|x - y|$$
defined on $[0, 1] \times [0, 1]$.

## Why this specific function?
This is not an arbitrary choice. It is the perfect "stress test" for the H-Matrix format for two fundamental reasons:

### 1. Physical Relevance (Green's Function)
In physics, this function is the **Fundamental Solution (Green's Function)** for the Laplace equation in 2D (electrostatics, potential flow, etc.).
* **Meaning:** It represents the potential at $x$ induced by a source at $y$.
* **Implication:** If H-Matrices work for this, they work for real-world Boundary Element Methods (BEM). 

### 2. Structural Duality (Singular vs. Smooth)
This function forces the algorithm to handle two opposing behaviors simultaneously, justifying the block structure:

* **The Singularity (Near-Field):**
    * **Behavior:** As $x \to y$, the function explodes ($-\infty$). It is non-differentiable.
    * **Consequence:** Taylor series expansions **fail** here. ]This forces us to store diagonal blocks as **Dense Matrices**. 
    

* **Asymptotic Smoothness (Far-Field):**
    * **Behavior:** As soon as $x \neq y$, the function becomes infinitely differentiable. Crucially, its derivatives decay rapidly with distance:
        $$|\partial_x^\nu g(x,y)| = (\nu-1)! |x-y|^{-\nu}$$
    * **Consequence:** This decay allows Taylor/Interpolation error bounds to converge exponentially. This justifies compressing off-diagonal blocks to **Low Rank**.

## Conclusion
We use the log function because it mathematically proves that **Near-Field must be Dense** and **Far-Field can be Low-Rank**, which is the central hypothesis of the H-Matrix format.

### Links
* **Analysis:** [[Definition - Asymptotically Smooth]]
* **Approximation:** [[Lemma - Error Bound of Taylor Expansion]]
* **Tags:** #foundations #model-problem #physics
