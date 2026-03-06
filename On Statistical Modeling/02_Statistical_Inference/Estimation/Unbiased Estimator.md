---
tags: [statistics, inference, estimators]
aliases: [Unbiasedness]
created: 2026-03-04
---
# Unbiased Estimator

## Definition
An [[Estimator]] $U$ for an unknown parameter function $g(\vartheta)$ is called **unbiased** if its expected value exactly equals the true parameter value, regardless of what the true parameter actually is.

$$E_\vartheta[U] = g(\vartheta) \quad \text{for all } \vartheta \in \Theta$$
*(Where $E_\vartheta$ stands for the expectation with respect to the true distribution $P_\vartheta$)*

## Intuition
Because estimators are calculated from random samples, they will almost never exactly equal the true parameter on any single attempt. However, an unbiased estimator guarantees that if you were to repeat the experiment infinitely, the average of your estimates would perfectly match reality. It has no systematic tendency to over-guess or under-guess.

## Example
For a normal sample with unknown expectation $\mu$, the sample mean $\bar{X} = \frac{1}{n} \sum X_i$ is an unbiased estimator for $\mu$ because:
$$E_\mu[\bar{X}] = \frac{1}{n} \sum_{i=1}^n E_\mu[X_i] = E_\mu[X_1] = \mu$$

## The Theoretical Setup
Consider a scenario where we want to infer the unknown true mean of a population based on a sample, knowing that the underlying noise is normally distributed.

* **Sample Space:** $\mathcal{X} = \mathbb{R}^n$ with the Borel $\sigma$-algebra $\mathcal{F}_{\mathcal{X}} = \mathcal{B}(\mathbb{R}^n)$.
* **Data Generating Process:** Let $P_\mu$ be the distribution of $n$ [[Independent and Identically Distributed (i.i.d.)]] random variables $X_1, \dots, X_n$.
* **Distribution:** Each $X_i$ follows a [[Normal Distribution]] with an unknown expectation $\mu \in \mathbb{R}$ and a *known* standard deviation $\sigma_0 \in (0, \infty)$.
* **The Normal Sample:** The [[Random Vector]] $X = (X_1, \dots, X_n)^T$ represents our collected data.

## The Proposed Estimator
Our goal is to infer the underlying parameter $\mu$ from our sample $X$. To do this, we define an [[Estimator]] function $g$. In this case, we use the identity function to calculate the **Sample Mean** ($\bar{X}$):

$$\bar{X} = \frac{1}{n} \sum_{i=1}^n X_i$$

## Proof of Unbiasedness
To prove that the sample mean is an [[Unbiased Estimator]], we must show that its expected value across infinite repeated samples perfectly equals the true parameter $\mu$. 

Using the linearity of expectation, the straightforward calculation is:

$$E_\mu[\bar{X}] = E_\mu \left[ \frac{1}{n} \sum_{i=1}^n X_i \right]$$

By pulling out the constant $\frac{1}{n}$ and distributing the expectation operator:

$$= \frac{1}{n} \sum_{i=1}^n E_\mu[X_i]$$

Because the variables are identically distributed, every $E_\mu[X_i]$ simply equals the expectation of the first variable $E_\mu[X_1]$, which is $\mu$:

$$= \frac{1}{n} (n \cdot \mu) = \mu$$

**Conclusion:** Because $E_\mu[\bar{X}] = \mu$, the sample mean is a strictly unbiased estimator for the population expectation.



---

**Connections:**
* Often contrasted with [[Consistent Estimator]]; an estimator can be biased in small samples but consistent as $n \to \infty$.