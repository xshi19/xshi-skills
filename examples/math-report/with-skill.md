# Conditional distribution of a partitioned multivariate normal

Partition a multivariate normal random vector into two blocks. The conditional distribution of the first block, given a value of the second, is multivariate normal: its mean is an affine function of the observed value, and its covariance does not depend on that value. This report states the law and derives it. The conditional distribution is Gaussian because an affine function of the observed block can be chosen so that the residual is uncorrelated with that block; under joint normality the residual is independent of the block and remains Gaussian; translating the residual by the observed value stays inside the Gaussian family.

## Background

The following facts are used below and are not proved in this report.

- The standard normal law $\mathcal{N}(0,1)$ on $\mathbb{R}$ has mean $0$, variance $1$, and characteristic function $\exp(-u^2/2)$ for every real number $u$.
- A probability law on a Euclidean space is determined by its characteristic function.
- Independent real random variables with finite variances are uncorrelated.
- Every positive semidefinite matrix has a symmetric square root, by the spectral theorem.
- A square real matrix with trivial kernel is invertible.

A real symmetric matrix is positive semidefinite when its quadratic form is nonnegative at every conforming real vector, and positive definite when the quadratic form is positive at every nonzero conforming vector. Every covariance matrix is positive semidefinite, because its quadratic form in a deterministic vector equals the variance of the corresponding linear functional.

A random vector in $\mathbb{R}^k$, for an integer $k \geq 1$, is standard normal when its coordinates are independent and each coordinate has law $\mathcal{N}(0,1)$. Each coordinate then has variance $1$, and distinct coordinates are uncorrelated, so the covariance matrix of a standard normal vector is the identity. Independence of random vectors means that their joint law is the product of their marginal laws. Expectations of products of bounded measurable functions of disjoint coordinate blocks therefore factor, and the same factoring applies to bounded complex-valued functions by separating real and imaginary parts. A measurable function of one factor of a product law is independent of a measurable function of another factor.

## Lemma 1

**Lemma 1 (Gaussian laws and affine images).** Let $d \geq 1$, let $\mu \in \mathbb{R}^d$, and let $\Sigma$ be a positive semidefinite $d \times d$ matrix. There exists a real $d \times d$ matrix $A$ with $AA^\top = \Sigma$. For every such matrix and every standard normal vector $Z$ in $\mathbb{R}^d$, the random vector $Y = \mu + AZ$ has characteristic function
$$
\mathbb{E}\exp(i t^\top Y)
=
\exp\bigl(i t^\top \mu - \tfrac12 t^\top \Sigma t\bigr),
\qquad t \in \mathbb{R}^d,
$$
where $i$ is the imaginary unit. The displayed function of $t$ is the same for every admissible factor $A$. It therefore determines one law on $\mathbb{R}^d$, denoted $\mathcal{N}_d(\mu, \Sigma)$. That law has mean $\mu$ and covariance $\Sigma$. Every random vector with this law has this characteristic function.

Let $Y$ now denote an arbitrary random vector with law $\mathcal{N}_d(\mu, \Sigma)$. If $m \geq 1$, $c \in \mathbb{R}^m$, and $B$ is a real $m \times d$ matrix, then $B\Sigma B^\top$ is positive semidefinite and
$$
c + BY \sim \mathcal{N}_m(c + B\mu,\ B\Sigma B^\top).
$$

**Proof.** The spectral theorem supplies a symmetric square root of $\Sigma$, so a factor $A$ with $AA^\top = \Sigma$ exists. The calculation that follows uses only this product, so it applies to every such factor. Let $Z = (Z_1,\ldots,Z_d)$ be standard normal, and let $a \in \mathbb{R}^d$. The coordinates are independent and the summands $\exp(i a_j Z_j)$ are bounded, so
$$
\mathbb{E}\exp(i a^\top Z)
=
\prod_{j=1}^{d} \mathbb{E}\exp(i a_j Z_j)
=
\prod_{j=1}^{d} \exp(-a_j^2/2)
=
\exp\bigl(-\tfrac12 a^\top a\bigr).
$$
Set $a = A^\top t$. Then
$$
\mathbb{E}\exp(i t^\top AZ)
=
\exp\bigl(-\tfrac12 (A^\top t)^\top (A^\top t)\bigr)
=
\exp\bigl(-\tfrac12 t^\top AA^\top t\bigr)
=
\exp\bigl(-\tfrac12 t^\top \Sigma t\bigr).
$$
Multiplying by the deterministic factor $\exp(i t^\top \mu)$ yields the characteristic function of $Y$. By the uniqueness theorem for characteristic functions, the law of $Y$ is determined by $(\mu, \Sigma)$. Each coordinate of $Z$ has mean $0$, so $\mathbb{E}[AZ] = 0$ and $\mathbb{E} Y = \mu$. The covariance matrix of $Z$ is the identity, so
$$
\operatorname{Cov}(Y)
=
A \operatorname{Cov}(Z) A^\top
=
AA^\top
=
\Sigma.
$$

Now let $Y$ be any random vector with law $\mathcal{N}_d(\mu, \Sigma)$. For every $t \in \mathbb{R}^m$,
$$
\begin{align*}
\mathbb{E}\exp(i t^\top (c + BY))
&=
\exp(i t^\top c)\,
\mathbb{E}\exp\bigl(i (B^\top t)^\top Y\bigr) \\
&=
\exp\bigl(i t^\top (c + B\mu) - \tfrac12 t^\top B\Sigma B^\top t\bigr).
\end{align*}
$$
The matrix $B\Sigma B^\top$ is symmetric because $\Sigma$ is symmetric. For every $v \in \mathbb{R}^m$,
$$
v^\top B\Sigma B^\top v
=
(B^\top v)^\top \Sigma (B^\top v)
\geq 0,
$$
so $B\Sigma B^\top$ is positive semidefinite. The characteristic function of $c + BY$ is therefore the one that defines $\mathcal{N}_m(c + B\mu, B\Sigma B^\top)$.

**End of proof.**

## Partition

Let $p$ and $q$ be positive integers, and let
$$
X
=
\begin{pmatrix} X_1 \\ X_2 \end{pmatrix}
\sim
\mathcal{N}_{p+q}(\mu, \Sigma),
$$
where $X_1$ takes values in $\mathbb{R}^p$ and $X_2$ takes values in $\mathbb{R}^q$. Write
$$
\mu
=
\begin{pmatrix} \mu_1 \\ \mu_2 \end{pmatrix},
\qquad
\Sigma
=
\begin{pmatrix}
\Sigma_{11} & \Sigma_{12} \\
\Sigma_{12}^\top & \Sigma_{22}
\end{pmatrix},
$$
with $\mu_1 \in \mathbb{R}^p$, $\mu_2 \in \mathbb{R}^q$, $\Sigma_{11}$ of size $p \times p$, $\Sigma_{22}$ of size $q \times q$, and $\Sigma_{12}$ of size $p \times q$. The superscript $\top$ denotes the transpose. Lemma 1 gives $\mathbb{E} X = \mu$ and $\operatorname{Cov}(X) = \Sigma$, and therefore
$$
\operatorname{Cov}(X_1) = \Sigma_{11},
\qquad
\operatorname{Cov}(X_2) = \Sigma_{22},
\qquad
\operatorname{Cov}(X_1, X_2) = \Sigma_{12},
\qquad
\operatorname{Cov}(X_2, X_1) = \Sigma_{12}^\top.
$$
The blocks $\Sigma_{11}$ and $\Sigma_{22}$ are positive semidefinite.

## Lemma 2

**Lemma 2 (Uncorrelated blocks are independent).** Under the partition above, assume $\Sigma_{12} = 0$. Then $X_1$ and $X_2$ are independent,
$$
X_1 \sim \mathcal{N}_p(\mu_1, \Sigma_{11}),
\qquad
X_2 \sim \mathcal{N}_q(\mu_2, \Sigma_{22}).
$$

**Proof.** The spectral theorem supplies a $p \times p$ symmetric square root $A_1$ of $\Sigma_{11}$ and a $q \times q$ symmetric square root $A_2$ of $\Sigma_{22}$, so $A_1 A_1^\top = \Sigma_{11}$ and $A_2 A_2^\top = \Sigma_{22}$. Let $Z$ be standard normal in $\mathbb{R}^{p+q}$, and split $Z$ into a leading block $U \in \mathbb{R}^p$ and a trailing block $V \in \mathbb{R}^q$. The blocks $U$ and $V$ are independent. The block-diagonal factor acts by
$$
\begin{pmatrix} A_1 & 0 \\ 0 & A_2 \end{pmatrix}
\begin{pmatrix} U \\ V \end{pmatrix}
=
\begin{pmatrix} A_1 U \\ A_2 V \end{pmatrix}.
$$
Because $\Sigma_{12} = 0$, the block $\Sigma_{12}^\top$ vanishes as well, and
$$
\begin{pmatrix} A_1 & 0 \\ 0 & A_2 \end{pmatrix}
\begin{pmatrix} A_1^\top & 0 \\ 0 & A_2^\top \end{pmatrix}
=
\begin{pmatrix} \Sigma_{11} & 0 \\ 0 & \Sigma_{22} \end{pmatrix}
=
\Sigma.
$$
Lemma 1, applied to this square factor, shows that $X$ has the same law as
$$
\begin{pmatrix}
\mu_1 + A_1 U \\
\mu_2 + A_2 V
\end{pmatrix}.
$$
Lemma 1, applied to $\mu_1 + A_1 U$ and the factor $A_1$, gives that block the law $\mathcal{N}_p(\mu_1, \Sigma_{11})$. The same argument gives the second block the law $\mathcal{N}_q(\mu_2, \Sigma_{22})$. The two blocks are functions of the independent vectors $U$ and $V$, so they are independent. Equality of joint laws preserves marginals and independence, and $X$ has this joint law, so $X_1$ and $X_2$ are independent and have these marginal laws.

**End of proof.**

## Theorem 1

**Theorem 1 (Conditional Gaussian).** Assume the partition above, and assume in addition that $\Sigma_{22}$ is positive definite. For every $x_2 \in \mathbb{R}^q$, define
$$
\mu_{1\mid 2}(x_2)
=
\mu_1 + \Sigma_{12}\Sigma_{22}^{-1}(x_2 - \mu_2)
$$
and define the $p \times p$ matrix
$$
\Sigma_{1\mid 2}
=
\Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top.
$$
Then $\Sigma_{1\mid 2}$ is positive semidefinite and does not depend on $x_2$. For every $x_2 \in \mathbb{R}^q$,
$$
X_1 \mid X_2 = x_2
\sim
\mathcal{N}_p\bigl(\mu_{1\mid 2}(x_2),\ \Sigma_{1\mid 2}\bigr),
$$
in the following sense. Drawing $X_2$ from its marginal law, and then drawing $X_1$ from $\mathcal{N}_p(\mu_{1\mid 2}(X_2), \Sigma_{1\mid 2})$, reproduces the joint law of $(X_1, X_2)$ on $\mathbb{R}^p \times \mathbb{R}^q$. In particular, the conditional distribution is Gaussian.

**Proof.** The block $\Sigma_{22}$ is symmetric because $\Sigma$ is symmetric. If $\Sigma_{22} v = 0$, then $v^\top \Sigma_{22} v = 0$, so positive definiteness forces $v = 0$. Thus $\Sigma_{22}$ has trivial kernel. A square real matrix with trivial kernel is invertible, so $\Sigma_{22}^{-1}$ exists. Symmetry of the inverse is the identity $(\Sigma_{22}^{-1})^\top = (\Sigma_{22}^\top)^{-1} = \Sigma_{22}^{-1}$. In this proof, write
$$
C = \Sigma_{12}\Sigma_{22}^{-1},
\qquad
R = X_1 - C X_2.
$$
Symmetry of the inverse gives $C^\top = \Sigma_{22}^{-1}\Sigma_{12}^\top$. The map $(x_1, x_2) \mapsto (x_1 - C x_2,\ x_2)$ is linear, and $(R, X_2)$ is the image of $X$ under that map. Lemma 1 therefore asserts that $(R, X_2)$ is Gaussian on $\mathbb{R}^{p+q}$. The parameters of that normal law are the mean and covariance of $(R, X_2)$, because Lemma 1 states that a law $\mathcal{N}_{p+q}(\cdot,\ \cdot)$ has those moments. The moments are
$$
\mathbb{E} R = \mu_1 - C\mu_2,
\qquad
\mathbb{E} X_2 = \mu_2,
$$
$$
\operatorname{Cov}(R, X_2)
=
\operatorname{Cov}(X_1, X_2) - C\operatorname{Cov}(X_2)
=
\Sigma_{12} - C\Sigma_{22}.
$$
Substitute $C\Sigma_{22} = \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{22} = \Sigma_{12}$. The cross-covariance collapses:
$$
\operatorname{Cov}(R, X_2) = \Sigma_{12} - \Sigma_{12} = 0,
$$
and $\operatorname{Cov}(X_2, R) = \operatorname{Cov}(R, X_2)^\top = 0$. Expand the residual covariance as
$$
\begin{align*}
\operatorname{Cov}(R)
&=
\operatorname{Cov}(X_1 - C X_2) \\
&=
\Sigma_{11}
- \Sigma_{12} C^\top
- C \Sigma_{12}^\top
+ C \Sigma_{22} C^\top.
\end{align*}
$$
The identity $C\Sigma_{22} = \Sigma_{12}$ replaces the last term by $\Sigma_{12} C^\top$. Symmetry of $\Sigma_{22}^{-1}$ gives
$$
\Sigma_{12} C^\top
=
\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top
=
C\Sigma_{12}^\top.
$$
The three correction terms are the same matrix, with signs minus, minus, and plus, so two copies cancel:
$$
\operatorname{Cov}(R)
=
\Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top
=
\Sigma_{1\mid 2}.
$$
For every $v \in \mathbb{R}^p$, $v^\top \Sigma_{1\mid 2} v = \operatorname{Var}(v^\top R) \geq 0$, hence $\Sigma_{1\mid 2}$ is positive semidefinite. Its formula does not contain $x_2$.

The pair $(R, X_2)$ is therefore Gaussian, its cross-covariance block is $0$, its block means are $\mu_1 - C\mu_2$ and $\mu_2$, and its diagonal covariance blocks are $\Sigma_{1\mid 2}$ and $\Sigma_{22}$. These are the hypotheses of Lemma 2, with $(R, X_2)$ in the role of $(X_1, X_2)$. Lemma 2 yields
$$
R \sim \mathcal{N}_p(\mu_1 - C\mu_2,\ \Sigma_{1\mid 2}),
\qquad
X_2 \sim \mathcal{N}_q(\mu_2,\ \Sigma_{22}),
$$
and it yields that $R$ is independent of $X_2$.

The definition of $R$ rearranges to the identity $X_1 = R + C X_2$. Independence means that the joint law of $(R, X_2)$ is the product of the two marginals above. Because the identity holds on the original probability space, the joint law of $(X_1, X_2)$ is the image of that product under the map that adds $C$ times the second component to the first and leaves the second component unchanged. Sampling from the product is the same procedure as drawing $X_2$ from $\mathcal{N}_q(\mu_2, \Sigma_{22})$ and drawing $R$ independently from its marginal. For an arbitrary fixed value $x_2 \in \mathbb{R}^q$, the inner draw shifted by the constant $C x_2$ has law $\mathcal{N}_p(\mu_1 - C\mu_2 + C x_2,\ \Sigma_{1\mid 2})$. This is Lemma 1 applied to $R$, using the identity map on $\mathbb{R}^p$ as the matrix and $C x_2$ as the added vector; the covariance in that application remains $\Sigma_{1\mid 2}$. The mean of this law is
$$
\mu_1 - C\mu_2 + C x_2
=
\mu_1 + C(x_2 - \mu_2)
=
\mu_1 + \Sigma_{12}\Sigma_{22}^{-1}(x_2 - \mu_2)
=
\mu_{1\mid 2}(x_2).
$$
The sampling procedure is exactly the one in the statement of Theorem 1, and it specifies the conditional distribution at every $x_2 \in \mathbb{R}^q$.

The conditional distribution is Gaussian because, at each fixed $x_2$, the draw of $X_1$ is an affine image of the Gaussian vector $R$. Lemma 1 states that every affine image of a Gaussian vector is Gaussian. The observed value enters only through the translation $C x_2$, so the conditional covariance equals $\operatorname{Cov}(R) = \Sigma_{1\mid 2}$ at every $x_2$. The appeal to Lemma 2 is what makes the conditional law of the residual equal to the marginal law of $R$: after the cross-covariance has been removed, the residual and the conditioning block are independent, so the value of $X_2$ changes the location of $X_1$ and leaves the law of the residual unchanged.

**End of proof.**

## Remark

The conditional covariance $\Sigma_{1\mid 2}$ is the Schur complement of $\Sigma_{22}$ in $\Sigma$. With $C$ as in the proof of Theorem 1, that coefficient is the only $p \times q$ matrix $\Gamma$ for which $X_1 - \Gamma X_2$ is uncorrelated with $X_2$. Uncorrelatedness is the equation $\Sigma_{12} = \Gamma\Sigma_{22}$. The proof gives $\Sigma_{12} = C\Sigma_{22}$, so $(\Gamma - C)\Sigma_{22} = 0$. The matrix $\Sigma_{22}$ is invertible, so $\Gamma = C$.

Theorem 1 assumes that $\Sigma_{22}$ is positive definite, which is the condition under which $\Sigma_{22}^{-1}$ exists. When $\Sigma_{22}$ is singular, that inverse is undefined, and a conditional distribution is a statement about values in the affine support of $X_2$. Theorem 1 does not treat singular conditioning. When $\Sigma$ is singular while $\Sigma_{22}$ remains positive definite, the hypotheses of Theorem 1 still hold. If $\Sigma_{1\mid 2}$ is not positive definite, there is a nonzero $v \in \mathbb{R}^p$ with $v^\top \Sigma_{1\mid 2} v = 0$. Let $A$ be a square factor of $\Sigma_{1\mid 2}$, as supplied by Lemma 1, so $v^\top \Sigma_{1\mid 2} v = (A^\top v)^\top (A^\top v) = 0$. Hence $A^\top v = 0$, the column space of $A$ is orthogonal to the nonzero vector $v$, and that column space is a proper subspace of $\mathbb{R}^p$. Lemma 1 realizes a vector of law $\mathcal{N}_p(\mu_{1\mid 2}(x_2), \Sigma_{1\mid 2})$ as $\mu_{1\mid 2}(x_2) + AZ$ for a standard normal vector $Z$. The term $AZ$ takes values in the column space of $A$, so the conditional law is supported on a proper affine subspace of $\mathbb{R}^p$.
