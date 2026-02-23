**Cardinality Balanced Clustering** is a strategy for constructing a cluster tree $T_I$ by recursively splitting the list of indices to ensure the tree is perfectly balanced. It prioritizes the **count** of indices over their geometric distribution.

**1. The Method:**

Given an index set $I$ (optionally sorted by a coordinate direction):

1. **Sort:** Sort the indices based on their spatial coordinates (e.g., along the principal axis).    
2. **Split Count:** Find the median index in the sorted list.    
3. **Partition:** Assign the first half of the list to the first child and the second half to the second child.    
4. **Repeat:** Recursively apply until $\#t \le n_{min}$.   

## Properties

- **Load Balancing:** Every leaf node has approximately the same number of indices.    
- **Tree Depth:** The depth is exactly $\lceil \log_2(\#I / n_{min}) \rceil$.    
- **Geometry:** The geometric bounding boxes of the clusters may vary significantly in size if the point distribution is non-uniform.
    

**Comparison:**
While geometric clustering guarantees fast decay of cluster _diameters_ (good for approximation error), cardinality clustering guarantees a balanced _tree structure_ (good for parallel processing and predictable storage). In uniform particle distributions, both methods yield similar results.

### Links

- **Contrast With:** [[Construction/Geometric Balanced Clustering]]    
- **Related:** [[Structures/Cluster Tree Definition]]    
- **Tags:** #construction #clustering #algorithms