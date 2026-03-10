---
tags: [statistics, inference, hypothesis-testing, foundations]
aliases: [Statistical Test, Formal Test Definition]
created: 2026-03-10
---
# Statistical Test (Formal Definition)

## Motivation
While [[Null Hypothesis Significance Testing (NHST)]] provides the philosophical framework, we need a strict mathematical object to operate on data. A statistical test formally bridges the gap between the sample space (our raw data) and a binary decision, translating pure mathematics into an actionable conclusion.

## The Parameter Space Split
Let $\Theta$ be the entire space of possible true parameters for a [[Data Generating Process]]. We mathematically partition this space into two mutually exclusive sets:
* **$\Theta_0$**: The parameter space where the Null Hypothesis ($H_0$) is true.
* **$\Theta_1$**: The parameter space where the Alternative Hypothesis ($H_1$) is true.

These sets must completely exhaust the possibilities without overlapping: $\Theta_0 \cap \Theta_1 = \emptyset$ and $\Theta_0 \cup \Theta_1 = \Theta$.

## Definition
A statistical test is formally defined as a decision rule, represented mathematically as a map $\varphi$ from the sample space $\mathcal{X}$ (the observed data) to a binary outcome:
$$\varphi : \mathcal{X} \rightarrow \{\text{not reject}, \text{reject}\}$$

## The Asymmetry of the Decision
The null hypothesis and the alternative are deliberately **not symmetric**. The mathematical philosophy is heavily skeptical: $H_0$ is presumed true as long as the data does not convincingly contradict it. 
* If $\varphi(X) = \text{reject}$, the data sufficiently disagrees with $H_0$, proving $H_1$ is true.
* If $\varphi(X) = \text{not reject}$, it does *not* prove $H_0$ is true; it merely means there wasn't enough evidence to discard it.

---
**Connections:**
* The probability of this map outputting the wrong decision is governed by [[Type I Error]] and [[Type II Error]].
* The strict mathematical threshold for this decision is constrained by the [[Level Alpha Test]].