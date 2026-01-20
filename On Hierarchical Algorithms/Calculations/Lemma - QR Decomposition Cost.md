
## The Cost Formula
For a matrix $A$ of size $n \times m$ (with $n \gg m$), the computational cost of a Householder QR decomposition is:
$$N_{QR} \approx 2n m^2 - \frac{2}{3}m^3$$

## In H-Matrix Context ($m = k$)
When compressing rank-$k$ blocks, we apply QR to the factor matrices $A$ ($n \times k$) and $B$ ($n \times k$).
* Since $k$ is a small constant and $n$ is large:
$$N_{QR} \approx 2n k^2$$

## Why this is critical
This **Linear Complexity $\mathcal{O}(n)$** (with respect to $n$) is the secret sauce that allows [[Algorithm - Algebraic Recompression]] to be fast.
* If the cost were $\mathcal{O}(n^3)$ or even $\mathcal{O}(n^2)$, we could not use it inside the recursion.
* Because it is $\mathcal{O}(n)$, we can afford to re-orthogonalize frequently to keep ranks low.

### Links
* **Used In:** [[Algorithm - Algebraic Recompression]]
* **Used In:** [[Algorithm - Formatted Agglomeration]]
* **Tags:** #calculations #complexity #qr

---
*Reference: Lecture Script Page 10*