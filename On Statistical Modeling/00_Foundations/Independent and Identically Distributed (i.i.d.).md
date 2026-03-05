---
tags: [statistics, foundations, probability]
aliases: [i.i.d., Independent Random Variables, Independence]
created: 2026-03-04
---
# Independent and Identically Distributed (i.i.d.)

## Definition
A collection of [[Random Variable|random variables]] $(X_i)_{i \in I}$ is **independent** if the joint probability of their outcomes is strictly equal to the product of their individual marginal probabilities.

For a finite set of random variables $X_1, \dots, X_n$ and any subsets $A_1, \dots, A_n$ in the Borel $\sigma$-algebra $\mathcal{B}(\mathbb{R})$:
$$P(X_1 \in A_1, \dots, X_n \in A_n) = \prod_{i=1}^n P(X_i \in A_i)$$

## Identically Distributed
We denote a collection of random variables as **i.i.d.** (independent and identically distributed) if they are independent AND every $X_i$ follows the exact same [[Probability Distribution]].

## Properties / Assumptions
* This is the foundational assumption for almost all random sampling in classical statistics. It guarantees that each observation provides a completely new, uncorrelated piece of information from the exact same [[Data Generating Process]].

---
**Connections:**
* The i.i.d. assumption is a strict prerequisite for both the [[Law of Large Numbers (LLN)]] and the [[Central Limit Theorem]].