---
tags:
  - Derivation
  - L3
  - Theory_Hub
aliases:
  - Policy Gradient
  - Gradient of J
  - PG Theorem
---

The **Policy Gradient Theorem** proves that the gradient of the objective function $J(\theta)$ depends only on the gradient of the policy, ignoring the environment dynamics.

### The Theorem (Final Formulation)
$$\nabla_\theta J(\theta) = \mathbb{E}_{\pi_\theta} \left[ \sum_{t=0}^{T} \nabla_\theta \log \pi_\theta(a_t|s_t) G_t \right]$$

---

### Step-by-Step Derivation

**1. Gradient of Expectation**
Using the [[Log-Derivative Trick]], we first establish that:
$$\nabla_\theta J(\theta) = \mathbb{E}_{\tau \sim \pi_\theta} [ \nabla_\theta \log p_\theta(\tau) R(\tau) ]$$

**2. Trajectory Probability Decomposition**
A trajectory $\tau$ is a sequence $s_0, a_0, s_1, a_1, \dots, s_T$. Its probability is the product of the initial state distribution, the policy at every step, and the transition dynamics at every step:
$$p_\theta(\tau) = p(s_0) \prod_{t=0}^{T} \pi_\theta(a_t|s_t) p(s_{t+1}|s_t, a_t)$$

**3. Log-Probability Decomposition**
Taking the natural logarithm turns the product into a sum:
$$\log p_\theta(\tau) = \log p(s_0) + \sum_{t=0}^{T} \log \pi_\theta(a_t|s_t) + \sum_{t=0}^{T} \log p(s_{t+1}|s_t, a_t)$$

**4. Differentiating w.r.t. $\theta$**
Now we apply the gradient $\nabla_\theta$ to each term.
* $\nabla_\theta \log p(s_0) = 0$ (Initial state does not depend on policy parameters).
* $\nabla_\theta \log p(s_{t+1}|s_t, a_t) = 0$ (Environment dynamics are unknown and independent of $\theta$).

The only term that remains is the policy:
$$\nabla_\theta \log p_\theta(\tau) = \sum_{t=0}^{T} \nabla_\theta \log \pi_\theta(a_t|s_t)$$

**5. Substitution**
Substituting this sum back into the expectation gives the basic Policy Gradient form:
$$\nabla_\theta J(\theta) = \mathbb{E}_{\pi_\theta} \left[ \left( \sum_{t=0}^{T} \nabla_\theta \log \pi_\theta(a_t|s_t) \right) R(\tau) \right]$$

**6. Final Form with [[Reward-to-Go|Reward-to-Go]]**
Using causality (derived in the linked note), we replace $R(\tau)$ with $G_t$:
$$\nabla_\theta J(\theta) = \mathbb{E}_{\pi_\theta} \left[ \sum_{t=0}^{T} \nabla_\theta \log \pi_\theta(a_t|s_t) G_t \right]$$

### Links
* **Uses:** [[Log-Derivative Trick]]
* **Requires:** [[Reward-to-Go]]