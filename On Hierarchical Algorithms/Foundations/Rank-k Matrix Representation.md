## Definition
A matrix $M \in \mathbb{R}^{n \times m}$ is called a **Rank-k Matrix** if it can be represented in a factorized form as the product of two "thin" matrices:
$$M = A B^T$$
Where:
* $A \in \mathbb{R}^{n \times k}$ (The "Left" factor)
* $B \in \mathbb{R}^{m \times k}$ (The "Right" factor)
* $k \ll \min(n, m)$ (The rank is much smaller than the dimensions)

## Mathematical Formulation
This can also be expressed as the sum of $k$ outer products (Rank-1 matrices):
$$M = \sum_{\nu=1}^{k} a_\nu b_\nu^T$$
Where $a_\nu$ are the columns of $A$ and $b_\nu$ are the columns of $B$.

## Intuition
Instead of storing a massive grid of data (which may contain redundant information), we store the "basis vectors" ($A$) and the "coefficients" ($B$) that generate the grid.

### Links
* **Prerequisite:** [[Rank of a Matrix]]
* **Uses:** [[Singular Value Decomposition (SVD)]]
* **Used In:** [[Hierarchical Matrix (Hp) Format]], [[Lemma - Rank-k Storage Cost]]
* **Tags:** #foundations #linear_algebra

---
*Reference: Lecture Script Page 5 (Definition 1.5)*

---
*Reference: Lecture Notes / Exercise Sheet*
