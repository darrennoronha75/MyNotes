---
tags: [statistics, linear-regression, matrices]
aliases: [Regression Through Origin, Remark 3.13]
created: 2026-03-10
---
# Models Without Intercept

## The Adjustment
In standard formulations, the intercept $\gamma_0$ dictates that the first column of the [[Design Matrix]] $A$ is filled with ones. 

If a physical model requires forcing the regression through the origin (no intercept), all previous geometric proofs and theorems continue to hold perfectly. 

**The single required adjustment:** Because you are estimating one less parameter, you must replace the number of parameters $k+1$ with $k$ in all degrees of freedom calculations.