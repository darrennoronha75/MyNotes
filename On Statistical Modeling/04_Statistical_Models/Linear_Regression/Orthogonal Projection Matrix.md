---
tags: [statistics, linear-algebra, matrices]
aliases: [Orthogonal Projection]
created: 2026-03-10
---
## Motivation
In high-dimensional space, the observed data vector $Y$ almost never lies perfectly within the linear subspace $U$ defined by our model. The orthogonal projection provides the mathematically perfect "compromise." It finds the unique point $z_0 \in U$ that is physically closest to $Y$. 



## Definition
Let $U \subseteq \mathbb{R}^d$ be a linear subspace. For any vector $z \in \mathbb{R}^d$, there exists a unique solution $z_0 \in U$ to the geometric optimization problem:
$$\min_{v \in U} \|z - v\|$$
The linear map $\Pi_U : \mathbb{R}^d \to U$ that maps every $z$ to its closest point $z_0$ is called the **orthogonal projection onto $U$**. 

## Strict Mathematical Properties
Let $M \in \mathbb{R}^{d \times d}$ be the matrix representing the linear map $\Pi_U$. $M$ is an orthogonal projection matrix if and only if it satisfies two absolute conditions:

**1. It is Idempotent ($\Pi_U^2 = \Pi_U$)**
Projecting a point that is already in the subspace does nothing. If you apply the projection matrix twice, it is identical to applying it once.

**2. It is Symmetric ($M = M^T$)**
This is proven via the orthogonality condition. Because the error vector $(z - Mz)$ is strictly perpendicular to the subspace $U$ ($\perp U$), for all $x, y \in \mathbb{R}^d$:
$$\langle Mx, y \rangle - \langle x, My \rangle = \langle Mx, y \rangle - \langle Mx, My \rangle + \langle Mx, My \rangle - \langle x, My \rangle$$
$$= \langle Mx, y - My \rangle + \langle Mx - x, My \rangle = 0$$
Thus, $x^T(M^T - M)y = 0$, proving that $M = M^T$.

---
**Connections:**
* The specific implementation of this matrix in linear regression is the [[Hat Matrix]].
* The orthogonality property is formalized in [[Lemma 3.6 - Projection and Annihilator Matrices]].