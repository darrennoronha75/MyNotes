The **Admissibility Condition** ($Adm(s, t)$) is a boolean test used to decide whether a matrix block $s \times t$ can be approximated as a low-rank matrix ($\mathcal{R}(k)$) or must be stored densely. It essentially asks: "Are these two clusters far enough apart relative to their size?"

**1. Standard Condition ($\eta$-Admissibility):**

$$\min \{ \text{diam}(Q_s), \text{diam}(Q_t) \} \le \eta \cdot \text{dist}(Q_s, Q_t)$$

- **diam:** The diameter of the bounding box (usually Euclidean or Max-norm).
    
- **dist:** The geometric distance between the two bounding boxes.
    
- **$\eta$:** A control parameter (typically $1.0$ or $0.5$). Smaller $\eta$ means stricter admissibility (more dense blocks, higher accuracy).
    

**2. Weak Admissibility:**

$$\text{dist}(Q_s, Q_t) > 0$$

This simply requires that the clusters do not touch or overlap. It leads to a simpler structure but usually requires higher ranks $k$ for the same accuracy.

## Geometric Interpretation

- **Admissible (True):** The clusters are well-separated. The underlying kernel function $g(x, y)$ is smooth in this region, allowing efficient interpolation or Taylor expansion. -> **Green Block (Low Rank)**.
    
- **Inadmissible (False):** The clusters are close or touching. The kernel has a singularity (like $1/|x-y|$) or high variation. -> **Red Block (Dense)**.
    

### Links

- **Determines:** [[Structures/Block Cluster Tree Definition]]    
- **Relates To:** [[Foundations/Asymptotically Smooth Kernels]]    
- **Implemented In:** [[Construction/Geometric Balanced Clustering]]    
- **Tags:** #foundations #approximation #geometry