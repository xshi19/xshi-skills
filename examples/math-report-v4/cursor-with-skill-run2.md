# Conditional distribution of a partitioned multivariate normal

The problem is to condition one block of a multivariate normal vector on the other block, to derive the conditional mean and covariance, and to explain why the conditional distribution is Gaussian. The conditional distribution is Gaussian. Its mean is the linear regression on the observed block, and its covariance is the covariance of the regression residual. That covariance does not depend on the observed value. Joint normality makes the residual independent of the conditioning block, so conditioning translates that residual's Gaussian law.

## Definition

Let $d$ be a positive integer, let $\mu \in \mathbb{R}^d$, and let $\Sigma$ be a $d \times d$ symmetric positive semidefinite matrix. A random vector $X$ with values in $\mathbb{R}^d$ satisfies $X \sim \mathcal{N}_d(\mu, \Sigma)$ when
$$
\mathbb{E}\exp(i t^\top X) = \exp\bigl(i t^\top \mu - \tfrac12 t^\top \Sigma t\bigr)
$$
for every $t \in \mathbb{R}^d$, where $i$ denotes the imaginary unit. Singular $\Sigma$ is allowed. The distribution is then supported on a proper affine subspace, and this characteristic function is the definition of that Gaussian law.

## Lemma 1 (Affine images)

Let $X \sim \mathcal{N}_d(\mu, \Sigma)$, let $A$ be a $k \times d$ real matrix, and let $b \in \mathbb{R}^k$. Then
$$
AX + b \sim \mathcal{N}_k(A\mu + b,\, A\Sigma A^\top).
$$

**Proof.** The product $A\Sigma A^\top$ is symmetric and positive semidefinite. For every $t \in \mathbb{R}^k$,
$$
\mathbb{E}\exp\bigl(i t^\top (AX + b)\bigr)
= \exp(i t^\top b)\, \mathbb{E}\exp\bigl(i (A^\top t)^\top X\bigr)
= \exp\bigl(i t^\top (A\mu + b) - \tfrac12 t^\top A\Sigma A^\top t\bigr).
$$
This is the characteristic function of $\mathcal{N}_k(A\mu + b, A\Sigma A^\top)$. $\square$

## Lemma 2 (Uncorrelated normal blocks are independent)

Let $U$ and $V$ be finite-dimensional random vectors such that the stack of $U$ and $V$ is multivariate normal and $\operatorname{Cov}(U, V) = 0$. Then $U$ and $V$ are independent,
$$
U \sim \mathcal{N}(\mathbb{E} U, \operatorname{Cov}(U)), \qquad V \sim \mathcal{N}(\mathbb{E} V, \operatorname{Cov}(V)).
$$

**Proof.** For all real vectors $s$ and $t$ of the matching dimensions,
$$
\begin{pmatrix} s \\ t \end{pmatrix}^\top
\operatorname{Cov}\begin{pmatrix} U \\ V \end{pmatrix}
\begin{pmatrix} s \\ t \end{pmatrix}
= s^\top \operatorname{Cov}(U)\, s + 2 s^\top \operatorname{Cov}(U, V)\, t + t^\top \operatorname{Cov}(V)\, t.
$$
By definition, the joint characteristic function is the exponential of $i s^\top \mathbb{E} U + i t^\top \mathbb{E} V$ minus half of this quadratic form. The cross-covariance is the zero matrix, so the middle summand vanishes and the characteristic function factors:
$$
\mathbb{E}\exp(i s^\top U + i t^\top V)
= \exp\bigl(i s^\top \mathbb{E} U - \tfrac12 s^\top \operatorname{Cov}(U)\, s\bigr)
\exp\bigl(i t^\top \mathbb{E} V - \tfrac12 t^\top \operatorname{Cov}(V)\, t\bigr).
$$
The factors are the characteristic functions of the two stated normal laws, so those laws are the marginals. Their product is the joint characteristic function, so $U$ and $V$ are independent. $\square$

## Theorem 1 (Conditional distribution)

Let $p$ and $q$ be positive integers, and let
$$
X = \begin{pmatrix} X_1 \\ X_2 \end{pmatrix}
\sim
\mathcal{N}_{p+q}\!\left(
\begin{pmatrix} \mu_1 \\ \mu_2 \end{pmatrix},
\begin{pmatrix} \Sigma_{11} & \Sigma_{12} \\ \Sigma_{12}^\top & \Sigma_{22} \end{pmatrix}
\right),
$$
where $X_1, \mu_1 \in \mathbb{R}^p$, $X_2, \mu_2 \in \mathbb{R}^q$, $\Sigma_{11}$ is $p \times p$, $\Sigma_{22}$ is $q \times q$ and positive definite, and $\Sigma_{12}$ is $p \times q$. The block matrix is the covariance of $X$, hence symmetric and positive semidefinite. Then, for every $x_2 \in \mathbb{R}^q$,
$$
X_1 \mid X_2 = x_2
\sim
\mathcal{N}_p\bigl(
\mu_1 + \Sigma_{12}\Sigma_{22}^{-1}(x_2 - \mu_2),\;
\Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top
\bigr).
$$
In particular, the conditional distribution is Gaussian, its covariance does not depend on $x_2$, and its mean is an affine function of $x_2$.

**Proof.** Let $B = \Sigma_{12}\Sigma_{22}^{-1}$. Positive definiteness of $\Sigma_{22}$ makes this inverse exist, and symmetry of $\Sigma_{22}$ makes the inverse symmetric, so $B^\top = \Sigma_{22}^{-1}\Sigma_{12}^\top$. Define the residual
$$
R = (X_1 - \mu_1) - B(X_2 - \mu_2).
$$
Then $\mathbb{E} R = 0$, and $X_1 = \mu_1 + B(X_2 - \mu_2) + R$. The pair $(R, X_2)$ is an affine image of $X$:
$$
\begin{pmatrix} R \\ X_2 \end{pmatrix}
=
\begin{pmatrix} I_p & -B \\ 0 & I_q \end{pmatrix}
X
+
\begin{pmatrix} -\mu_1 + B\mu_2 \\ 0 \end{pmatrix},
$$
where $I_p$ and $I_q$ are identity matrices. Lemma 1 implies that the pair is multivariate normal. Subtracting the means does not change covariances, so
$$
\operatorname{Cov}(R, X_2) = \operatorname{Cov}(X_1 - B X_2, X_2) = \Sigma_{12} - B\Sigma_{22} = 0.
$$
Bilinearity and $\operatorname{Cov}(X_2, X_1) = \Sigma_{12}^\top$ give
$$
\operatorname{Cov}(R) = \Sigma_{11} - \Sigma_{12} B^\top - B\Sigma_{12}^\top + B\Sigma_{22} B^\top.
$$
Each correction term equals $\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top$:
$$
\Sigma_{12} B^\top = \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top,
\qquad
B\Sigma_{12}^\top = \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top,
\qquad
B\Sigma_{22} B^\top = \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top.
$$
The last equality uses $B\Sigma_{22} = \Sigma_{12}$. The three correction terms therefore contribute $-\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top$, and
$$
\operatorname{Cov}(R) = \Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top.
$$
This matrix is symmetric and positive semidefinite because it is a covariance. Lemma 2 yields independence of $R$ and $X_2$, and
$$
R \sim \mathcal{N}_p\bigl(0,\, \Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top\bigr).
$$
Fix $t \in \mathbb{R}^p$. Independence of $R$ and $X_2$ gives $\mathbb{E}[\exp(i t^\top R) \mid X_2] = \mathbb{E}\exp(i t^\top R)$ almost surely, while $\exp\bigl(i t^\top(\mu_1 + B(X_2 - \mu_2))\bigr)$ is a function of $X_2$. The conditional characteristic function therefore has the version, defined for every $x_2 \in \mathbb{R}^q$,
$$
\begin{aligned}
\mathbb{E}\bigl[\exp(i t^\top X_1) \mid X_2 = x_2\bigr]
&= \exp\bigl(i t^\top(\mu_1 + B(x_2 - \mu_2))\bigr)\, \mathbb{E}\exp(i t^\top R) \\
&= \exp\bigl(i t^\top(\mu_1 + B(x_2 - \mu_2)) - \tfrac12 t^\top \operatorname{Cov}(R)\, t\bigr).
\end{aligned}
$$
The second step substitutes the characteristic function of $R$. The right-hand side is the characteristic function of
$$
\mathcal{N}_p\bigl(\mu_1 + \Sigma_{12}\Sigma_{22}^{-1}(x_2 - \mu_2),\, \Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top\bigr).
$$
Thus, for every $x_2 \in \mathbb{R}^q$, the conditional distribution of $X_1$ given $X_2 = x_2$ is that normal law. It is Gaussian because, once $x_2$ is given, $X_1$ differs from the constant $\mu_1 + B(x_2 - \mu_2)$ by the Gaussian vector $R$, and the law of $R$ does not depend on $x_2$. The conditional mean is affine in $x_2$, and the conditional covariance is $\operatorname{Cov}(R)$. $\square$

## Remark

The coefficient $B$ is the population regression coefficient of $X_1$ on $X_2$, and $R$ is the residual from that regression. The conditional covariance is the Schur complement of $\Sigma_{22}$ in the joint covariance. Conditioning on $X_2 = x_2$ freezes the regression and leaves the law of $R$ unchanged, which is why the conditional distribution is Gaussian. The Schur complement need not be positive definite. If $p = q = 1$ and $X_1 = X_2 \sim \mathcal{N}_1(0, 1)$, then $\Sigma_{11} = \Sigma_{12} = \Sigma_{22} = 1$, so Theorem 1 gives $\mathcal{N}_1(x_2, 0)$, a point mass at $x_2$, in agreement with $X_1 = X_2$. When the joint covariance is nonsingular, Theorem 1 agrees with Anderson (2003, Theorem 2.5.1). The argument in that section divides the joint Gaussian density by the marginal Gaussian density of the conditioning block and assumes a nonsingular joint covariance. The characteristic-function argument above keeps degenerate conditional laws inside the same Gaussian family.

## Reference

T. W. Anderson, *An Introduction to Multivariate Statistical Analysis*, 3rd ed., Wiley, 2003, Theorem 2.5.1.
