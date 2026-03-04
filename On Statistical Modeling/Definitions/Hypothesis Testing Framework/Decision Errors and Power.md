## Core Concept
Because our decision to Reject or Fail to Reject is based on a random [[Statistics as Random Variables|statistic]], there is always a probability that the data fools us. The reality of the population parameter is fixed, but our conclusion is a probabilistic guess.

## The Confusion Matrix of Testing
There are two ways to be right, and two ways to be wrong:

|                          | $H_0$ is True (Reality)              | $H_1$ is True (Reality)              |
| :----------------------- | :----------------------------------- | :----------------------------------- |
| **Reject $H_0$**         | **Type I Error** (False Positive)    | **Correct Decision** (True Positive) |
| **Fail to Reject $H_0$** | **Correct Decision** (True Negative) | **Type II Error** (False Negative)   |
|                          |                                      |                                      |

## The Metrics
1. **Type I Error ($\alpha$):** The level of the test. The maximum tolerated probability of rejecting a true Null Hypothesis (declaring a difference when none exists). Usually set to $0.05$.
2. **Type II Error ($\beta$):** The probability of failing to reject a false Null Hypothesis (missing a real effect).
3. **Statistical Power ($1 - \beta$):** The probability of successfully rejecting the Null Hypothesis, *assuming the alternative hypothesis is true*. It is the sensitivity of the test to detect reality.

## Formal Probabilistic Definitions

### 1. Type I Error ($\alpha$)
A False Positive. The probability that the test statistic ($T$) falls into the critical region ($K$) given that the Null Hypothesis is actually true.
$$P(T \in K \mid H_0 \text{ is true}) \le \alpha$$
* $\alpha$ is chosen by the researcher (the "Level of the test") prior to the experiment.

### 2. Type II Error ($\beta$)
A False Negative. The probability that the test statistic fails to reach the critical region given that the Alternative Hypothesis is actually true.
$$P(T \notin K \mid H_1 \text{ is true}) = \beta$$

## Statistical Power
Power is the probability of a True Positive. It is the test's mathematical sensitivity—its ability to correctly detect reality when $H_0$ is false.
$$\text{Power} = P(T \in K \mid H_1 \text{ is true}) = 1 - \beta$$
### The Power Function $\pi(\mu)$
Power is not a single number; it is a function of the *true* unknown parameter. 
$$\pi(\mu) = P(T \in K \mid \mu)$$
The power of a test increases depending on three specific mathematical levers:
1. **Effect Size:** As the true population mean ($\mu$) moves further away from the hypothesized mean ($\mu_0$), the distributions overlap less, and $1-\beta$ approaches $1.0$.
2. **Sample Size ($n$):** Because standard error features $\sqrt{n}$ in the denominator, increasing $n$ shrinks the variance of the distributions. The curves become narrower, reducing overlap and driving $\beta$ down.
3. **Significance Level ($\alpha$):** Increasing $\alpha$ (e.g., from $0.01$ to $0.05$) moves the critical boundary closer to the center of the null distribution, inherently increasing Power but sacrificing Type I error control.

---
**Connections:**
* Power analysis is critical before conducting [[The Two-Sample t-test]] to ensure the sample sizes ($n_A, n_B$) are large enough to actually detect the expected difference.