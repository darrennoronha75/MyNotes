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

---
**Connections:**
* Often contrasted with [[Consistent Estimator]]; an estimator can be biased in small samples but consistent as $n \to \infty$.