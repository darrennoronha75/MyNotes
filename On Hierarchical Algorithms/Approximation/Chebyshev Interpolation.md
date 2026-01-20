

## The "Practical" Alternative to Taylor
While Taylor Series provide the *proof* that H-Matrices work, they are often impossible to implement because they require calculating high-order derivatives.
* **The Shift:** Instead of matching the **slope** (derivatives) at a single center point, we match the **function value** at multiple specific grid points.
* **The Goal:** Construct a separable approximation $g(x,y) \approx \sum a(x)b(y)$ using only "Black Box" evaluations of the function.

## The "Gold Standard" of Grids
When doing interpolation, *where* you pick your sample points $\xi_\nu$ matters immensely.


* **Bad Choice (Uniform Grid):** If you pick points equally spaced, the approximation creates wild oscillations at the edges of the interval. This instability is known as **[[Runge's Phenomenon]]**.
* **Good Choice (Chebyshev Grid):** We select points that are **clustered near the edges** of the interval (defined by roots of Chebyshev polynomials).

## Why use Chebyshev?
Using Chebyshev nodes minimizes the interpolation error and distributes it evenly across the interval. It guarantees that the approximation is **stable** and converges exponentially fast, just like the Taylor series, but without the derivative headache.

### The Error Bound
$$Error \le \frac{2}{(m+1)!} \left( \frac{b-a}{4} \right)^{m+1} \max |f^{(m+1)}|$$
* **Key Insight:** The term $\left( \frac{b-a}{4} \right)$ ensures that as the interval gets smaller (or degree $m$ gets higher), the error vanishes rapidly.

## The Result: Variable Splitting without Pain
Chebyshev interpolation achieves the same "Separation of Variables" as Taylor series, but with superior practical properties:
1.  **Black Box:** It works on *any* function $g(x,y)$ that you can evaluate (even if you don't have the derivative formula).
2.  **Robust:** It avoids the numerical instability of high-degree polynomials on uniform grids.
3.  **Optimal:** It is mathematically close to the best possible polynomial approximation (Minimax property).

### Links
* **Solves:** [[Runge's Phenomenon]]
* **Used In:** [[Separable Functions]]
* **Tags:** #approximation #chebyshev #best-practice

---
*Reference: Lecture Script Pages 34-36*