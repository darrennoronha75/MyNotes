**Geometric Balanced Clustering** is a strategy for constructing a cluster tree $T_I$ by recursively splitting the physical domain containing the indices. It prioritizes the **geometry** (diameter) of the clusters over the number of indices they contain.

**1. The Method:**

Given an index set $I$ associated with points $\{x_i\}_{i \in I}$ in a bounding box $Q$:

1. **Identify Axis:** Choose a coordinate direction (e.g., the longest edge of the box).    
2. **Split Point:** Determine the geometric midpoint $m = \frac{a+b}{2}$ of the box along that axis.    
3. **Partition:** Assign indices with $x_i < m$ to the first child and $x_i \ge m$ to the second child.    
4. **Repeat:** Recursively apply to the children until the box size or number of points is small ($n_{min}$).

**2. Bounding Boxes ($Q_t$):**

Crucially, every cluster $t$ is assigned a geometric **Bounding Box** $Q_t$.

- $Q_t$ is the smallest axis-aligned box containing all points $\{x_i\}_{i \in t}$.    
- Used to calculate `diam(t)` and `dist(s, t)` for the admissibility condition.    

## Behavior in Dimensions

The number of successors depends on the spatial dimension $d$:

- **1D:** Interval split into 2 halves ($\#S(t) = 2$).    
- **2D:** Square split into 4 quadrants ($\#S(t) = 4$).    
- **3D:** Cube split into 8 octants ($\#S(t) = 8$).
        In general, a simultaneous split in all directions yields $2^d$ children.    

**Pros:** guarantees that the diameter of clusters shrinks exponentially ($\text{diam} \propto 2^{-\text{level}}$), which is essential for ensuring admissibility.

**Cons:** Can lead to an unbalanced tree if points are not distributed uniformly.

### Links

- **Contrast With:** [[Construction/Cardinality Balanced Clustering]]    
- **Required For:** [[Foundations/Admissibility Condition]]    
- **Used In:** [[Calculations/Sparsity Constant (C_sp)]]    
- **Tags:** #construction #clustering #geometry