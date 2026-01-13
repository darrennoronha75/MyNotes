## Concept
The addition of two Rank-k matrices is performed by **concatenation**, not arithmetic summation.
Given $M_1 = A_1 B_1^T$ and $M_2 = A_2 B_2^T$:

## Formula
$$M_{sum} = M_1 + M_2 = \begin{bmatrix} A_1 & A_2 \end{bmatrix} \cdot \begin{bmatrix} B_1^T \\ B_2^T \end{bmatrix}$$

## Properties
* **New Factors:**
    * $A_{new} = [A_1, A_2] \in \mathbb{R}^{n \times (k_1+k_2)}$
    * $B_{new} = [B_1, B_2] \in \mathbb{R}^{m \times (k_1+k_2)}$
* **Cost:** $0$ FLOPs (Pointer copy only).
* **The Problem:** The rank increases to $k_{new} = k_1 + k_2$.
    * Repeated addition causes the matrix to explode in size.

## Solution
This operation must usually be followed by **Truncation** to keep the rank small.

### Links
* **Prerequisite:** [[Rank-k Matrix Representation]]
* **Requires:** [[Algorithm - Algebraic Recompression]] (to fix the rank increase)
* **Used In:** [[Algorithm - Formatted Addition]]
* **Tags:** #algorithms #arithmetic

---
*Reference: Lecture Script Page 6 (Section 2.2)*