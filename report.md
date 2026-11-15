# Conditional distribution of a partitioned multivariate normal

A partitioned multivariate normal is a normal random vector divided into two blocks. The problem is to derive the conditional distribution of one block given a value of the other, and to explain why that conditional distribution is still normal. The derivation subtracts from the target block the affine function of the observed block that accounts for their cross-covariance. The residual is normal and independent of the observation, so the conditional law is a translate of that residual.

Four facts from Billingsley, *Probability and Measure*, are used as cited background. A Borel probability law on the line is uniquely determined by its characteristic function (Theorem 26.2), and the same uniqueness on $\mathbb{R}^d$ is the extension in Section 29. If the characteristic function is twice differentiable at the origin, those derivatives recover the mean and the second-moment matrix (Section 26). For every mean and every symmetric positive semidefinite covariance, a Borel law with the Gaussian characteristic function below exists (Section 29). Iterated integrals against a product measure are Fubini's theorem (Section 18).

## Definition

Let $d$ be a positive integer, let $\mu\in\mathbb{R}^d$, and let $\Sigma\in\mathbb{R}^{d\times d}$ be symmetric and positive semidefinite. The multivariate normal law $\mathcal{N}(\mu,\Sigma)$ is the Borel probability law on $\mathbb{R}^d$ with characteristic function

$$
t\mapsto\exp\bigl(it^\top\mu-\tfrac12 t^\top\Sigma t\bigr),
\qquad t\in\mathbb{R}^d.
$$

A random vector with this law has mean $\mu$ and covariance $\Sigma$.

## Affine images

**Lemma 1.** Let $d$ and $k$ be positive integers, let $Z\sim\mathcal{N}(\mu,\Sigma)$ take values in $\mathbb{R}^d$, let $A$ be a real $k\times d$ matrix, and let $c\in\mathbb{R}^k$. Then

$$
AZ+c\sim\mathcal{N}(A\mu+c,\ A\Sigma A^\top).
$$

**Proof.** Affine closure of the normal laws is recorded in Billingsley, Section 29. The substitution here makes the later appeal self-contained. For every $u\in\mathbb{R}^k$,

$$
\begin{aligned}
\mathbb{E}\exp\bigl(iu^\top(AZ+c)\bigr)
&= \exp(iu^\top c)\,\mathbb{E}\exp\bigl(i(A^\top u)^\top Z\bigr) \\
&= \exp\bigl(iu^\top(A\mu+c)-\tfrac12 u^\top A\Sigma A^\top u\bigr).
\end{aligned}
$$

The right-hand side is the characteristic function of $\mathcal{N}(A\mu+c, A\Sigma A^\top)$. The cited uniqueness theorem identifies the law of $AZ+c$ with that normal law. $\square$

## Conditional distribution

**Theorem 1.** Let $p$ and $q$ be positive integers, and let

$$
X=\begin{pmatrix}X_1\\ X_2\end{pmatrix}
$$

take values in $\mathbb{R}^{p+q}$, with $X_1$ taking values in $\mathbb{R}^p$ and $X_2$ in $\mathbb{R}^q$. Suppose $X\sim\mathcal{N}(\mu,\Sigma)$, where

$$
\mu=\begin{pmatrix}\mu_1\\ \mu_2\end{pmatrix},
\qquad
\Sigma=\begin{pmatrix}\Sigma_{11}&\Sigma_{12}\\ \Sigma_{12}^\top&\Sigma_{22}\end{pmatrix},
$$

$\mu_1\in\mathbb{R}^p$, $\mu_2\in\mathbb{R}^q$, $\Sigma_{11}$ is $p\times p$, $\Sigma_{12}$ is $p\times q$, and $\Sigma_{22}$ is $q\times q$. Assume $\Sigma_{22}$ is positive definite. Then, for every $x_2\in\mathbb{R}^q$, a regular conditional distribution of $X_1$ given $X_2=x_2$ is

$$
\mathcal{N}\!\left(
\mu_1+\Sigma_{12}\Sigma_{22}^{-1}(x_2-\mu_2),\;
\Sigma_{11}-\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top
\right).
$$

**Proof.** Define the residual

$$
R=X_1-\mu_1-\Sigma_{12}\Sigma_{22}^{-1}(X_2-\mu_2)
$$

and set $C=\Sigma_{12}\Sigma_{22}^{-1}$. Then $C^\top=\Sigma_{22}^{-1}\Sigma_{12}^\top$ and $R=(X_1-\mu_1)-C(X_2-\mu_2)$. The pair $(R,X_2)$ is an affine image of $X$. Lemma 1 says that $(R,X_2)$ is multivariate normal, with mean and covariance equal to the mean and covariance of this image. Linearity gives $\mathbb{E} X_2=\mu_2$ and

$$
\begin{aligned}
\mathbb{E} R &= 0,\\
\operatorname{Cov}(R,X_2) &= \Sigma_{12}-C\Sigma_{22}=0.
\end{aligned}
$$

The cross-block $\operatorname{Cov}(X_2,R)$ is the transpose of $\operatorname{Cov}(R,X_2)$, so both cross-blocks vanish. Expanding the residual covariance gives

$$
\operatorname{Cov}(R)
=\Sigma_{11}-C\Sigma_{12}^\top-\Sigma_{12}C^\top+C\Sigma_{22}C^\top.
$$

Since $C=\Sigma_{12}\Sigma_{22}^{-1}$ and $C^\top=\Sigma_{22}^{-1}\Sigma_{12}^\top$,

$$
C\Sigma_{12}^\top
=\Sigma_{12}C^\top
=C\Sigma_{22}C^\top
=\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top.
$$

Each of those three terms equals $\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top$, so

$$
-C\Sigma_{12}^\top-\Sigma_{12}C^\top+C\Sigma_{22}C^\top
=-\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top
$$

and

$$
\operatorname{Cov}(R)=\Sigma_{11}-\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top.
$$

The mean of $(R,X_2)$ is $(0,\mu_2)$ and its covariance is block diagonal. By the definition of $\mathcal{N}$, the joint characteristic function is the product of the characteristic function of $\mathcal{N}(0,\operatorname{Cov}(R))$ and the characteristic function of $\mathcal{N}(\mu_2,\Sigma_{22})$. The cited uniqueness theorem on $\mathbb{R}^{p+q}$ yields that $R$ and $X_2$ are independent and that

$$
R\sim\mathcal{N}\!\left(0,\ \Sigma_{11}-\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top\right).
$$

Rearrangement gives $X_1=\mu_1+C(X_2-\mu_2)+R$. Lemma 1, applied to $R$ after adding the constant vector $\mu_1+C(x_2-\mu_2)$, shows that for each fixed $x_2\in\mathbb{R}^q$ the law of $\mu_1+C(x_2-\mu_2)+R$ is

$$
\mathcal{N}\!\left(
\mu_1+C(x_2-\mu_2),\ 
\Sigma_{11}-\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top
\right).
$$

Denote that normal law by $\kappa(x_2,\cdot)$. For every bounded Borel function $f:\mathbb{R}^p\to\mathbb{R}$, define

$$
g(x_2)=\mathbb{E} f\bigl(\mu_1+C(x_2-\mu_2)+R\bigr),
$$

so $g(x_2)$ is the integral of $f$ under $\kappa(x_2,\cdot)$. The cited form of Fubini's theorem makes $g$ Borel. The joint law of $(R,X_2)$ is the product measure, so for every Borel set $B\subset\mathbb{R}^q$,

$$
\mathbb{E}\bigl[f(X_1)\mathbf{1}_{\{X_2\in B\}}\bigr]
=\mathbb{E}\bigl[g(X_2)\mathbf{1}_{\{X_2\in B\}}\bigr].
$$

For $f$ equal to the indicator of a Borel subset of $\mathbb{R}^p$, this is the defining identity of a regular conditional distribution, and $x_2\mapsto\kappa(x_2,\cdot)$ is a probability kernel because each value is a Borel probability law and $g$ is Borel. Substituting $C=\Sigma_{12}\Sigma_{22}^{-1}$ shows that $\kappa(x_2,\cdot)$ is the normal law in the statement, at every $x_2\in\mathbb{R}^q$. $\square$

## Why the conditional distribution is Gaussian

**Remark.** Joint normality is preserved by the affine map that builds the residual $R$ from $(X_1,X_2)$, which is Lemma 1. The coefficient $C=\Sigma_{12}\Sigma_{22}^{-1}$ is the matrix that cancels $\operatorname{Cov}(R,X_2)$. With that cross-covariance equal to the zero matrix, the joint characteristic function of $(R,X_2)$ factors, and the normal vector $R$ is independent of the conditioning block. Given $X_2=x_2$, the decomposition $X_1=\mu_1+C(X_2-\mu_2)+R$ freezes the affine function of $X_2$ at a constant vector, and what remains is a translate of $R$. Lemma 1 keeps every translate inside the normal family. The conditional covariance equals $\operatorname{Cov}(R)$, the Schur complement of $\Sigma_{22}$ in $\Sigma$, and this matrix is the same at every $x_2$.

Positive definiteness of $\Sigma_{22}$ supplies the inverse in $C$. That is the hypothesis used in Theorem 1. The conditional covariance is itself a covariance, hence symmetric and positive semidefinite. Singularity of that covariance is allowed.

**Example.** Let $p=q=1$, $\mu_1=\mu_2=0$, $\Sigma_{11}=\Sigma_{22}=1$, and $\Sigma_{12}=1$. The difference $X_1-X_2$ has mean zero and variance zero, so $X_1=X_2$ almost surely, while $\Sigma_{22}$ is positive definite. Theorem 1 gives the regular conditional distribution $\mathcal{N}(x_2,0)$, a point mass at the observed value. Here $R=0$, which is independent of $X_2$.
