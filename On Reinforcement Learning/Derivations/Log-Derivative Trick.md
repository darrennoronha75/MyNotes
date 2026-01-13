---
tags:
  - Derivation
  - L3
  - Math
aliases:
  - Score Function Estimator
  - Log Probability Gradient
---

The "trick" relies on a simple property of the natural logarithm derivative. For any differentiable probability function $p_\theta(x)$ dependent on parameters $\theta$:

$$\nabla_\theta \log p_\theta(x) = \frac{\nabla_\theta p_\theta(x)}{p_\theta(x)}$$

By rearranging terms, we get the identity that substitutes the gradient of the probability density:

$$\nabla_\theta p_\theta(x) = p_\theta(x) \nabla_\theta \log p_\theta(x)$$

### The "Score Function"
The term $\nabla_\theta \log p_\theta(x)$ is formally known as the **Score Function** in statistics. It indicates the direction in parameter space $\theta$ that increases the likelihood of sample $x$.

---

### Derivation: Gradient of an Expectation
This is the critical proof required for the [[Policy Gradient Theorem]]. We want to calculate the gradient of the expected return $J(\theta)$ without knowing the dynamics of the environment.

**Problem:** The gradient is *outside* the expectation, but we need it *inside* to estimate it with samples.
$$\nabla_\theta J(\theta) = \nabla_\theta \mathbb{E}_{\tau \sim p_\theta} [R(\tau)]$$

**Step 1: Expand Definition**
Write the expectation as an integral over trajectories $\tau$:
$$\nabla_\theta J(\theta) = \nabla_\theta \int p_\theta(\tau) R(\tau) d\tau$$

**Step 2: Swap Derivative and Integral**
Assuming regularity conditions, move the gradient inside:
$$\nabla_\theta J(\theta) = \int \nabla_\theta p_\theta(\tau) R(\tau) d\tau$$

**Step 3: Apply the Log Derivative Trick**
Substitute $\nabla_\theta p_\theta(\tau)$ with $p_\theta(\tau) \nabla_\theta \log p_\theta(\tau)$:
$$\nabla_\theta J(\theta) = \int [ p_\theta(\tau) \nabla_\theta \log p_\theta(\tau) ] R(\tau) d\tau$$

**Step 4: Re-write as Expectation**
Group the terms to bring back the definition of expectation $\mathbb{E}_{\tau \sim p_\theta}$:
$$\nabla_\theta J(\theta) = \int p_\theta(\tau) [ \nabla_\theta \log p_\theta(\tau) R(\tau) ] d\tau$$
$$\nabla_\theta J(\theta) = \mathbb{E}_{\tau \sim p_\theta} [ \nabla_\theta \log p_\theta(\tau) R(\tau) ]$$

### Why is this "Magic"?
1.  **Model-Free:** We eliminated $\nabla_\theta p_\theta(\tau)$. We no longer need to know *how* the probability changes (which would require knowing the environment dynamics). We only need to know the *log probability* of the actions we took, which comes solely from our policy $\pi_\theta$.
2.  **Sampling:** We transformed an integral of a gradient (unsolvable) into an expectation (solvable). We can now just run the agent, collect samples, and average them to estimate the gradient.

### Links
* **Used In:** [[Policy Gradient Theorem]]
* **Foundation For:** [[REINFORCE]]