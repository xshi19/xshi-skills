# Conditional distribution of a partitioned multivariate normal

Split a multivariate normal random vector into blocks $(X_1, X_2)$. Under the hypotheses of the Theorem below, the conditional distribution of the unobserved block $X_1$ given $X_2 = x_2$ is multivariate normal for every value $x_2$. The conditional mean is an affine function of $x_2$, and the conditional covariance is the same at every $x_2$. Two lemmas supply the reason the conditional law stays Gaussian: affine images of Gaussian vectors are Gaussian, and uncorrelated jointly Gaussian blocks are independent.

Write $\mathbb{E}$ for expectation and $\operatorname{Cov}$ for a covariance matrix. A superscript $\top$ denotes transpose. Throughout, $i$ is the imaginary unit.

### Definition (Multivariate normal)

Let $d \ge 1$. A random vector $X$ with values in $\mathbb{R}^d$ is Gaussian with mean $\mu \in \mathbb{R}^d$ and covariance $\Sigma$, written $X \sim \mathcal{N}(\mu, \Sigma)$, when $\Sigma$ is a symmetric $d \times d$ matrix, $v^\top \Sigma v \ge 0$ for every $v \in \mathbb{R}^d$, $\mathbb{E} X = \mu$, $\operatorname{Cov}(X) = \Sigma$, and

$$
\mathbb{E}\exp(i t^\top X) = \exp\bigl(i t^\top \mu - \tfrac12 t^\top \Sigma t\bigr)
$$

for every $t \in \mathbb{R}^d$. The quadratic-form condition is positive semidefiniteness of $\Sigma$, and it permits a Gaussian law supported on a proper affine subspace.

### Lemma (Affine images)

Let $X \sim \mathcal{N}(\mu, \Sigma)$ take values in $\mathbb{R}^d$, let $B$ be an $m \times d$ real matrix, and let $c \in \mathbb{R}^m$. Then

$$
BX + c \sim \mathcal{N}(B\mu + c,\, B\Sigma B^\top).
$$

**Proof.** For every $t \in \mathbb{R}^m$,

$$
\begin{aligned}
\mathbb{E}\exp\bigl(i t^\top (BX + c)\bigr)
&= \exp(i t^\top c)\, \mathbb{E}\exp\bigl(i (B^\top t)^\top X\bigr) \\
&= \exp\bigl(i t^\top (B\mu + c) - \tfrac12 t^\top B\Sigma B^\top t\bigr).
\end{aligned}
$$

The matrix $B\Sigma B^\top$ is symmetric, and $u^\top B\Sigma B^\top u = (B^\top u)^\top \Sigma (B^\top u) \ge 0$ for every $u \in \mathbb{R}^m$, so $B\Sigma B^\top$ is positive semidefinite. Linearity gives $\mathbb{E}(BX + c) = B\mu + c$ and $\operatorname{Cov}(BX + c) = B\Sigma B^\top$. Therefore $BX + c$ meets the definition of $\mathcal{N}(B\mu + c, B\Sigma B^\top)$.

**End of proof.**

### Lemma (Uncorrelated blocks)

Let $Y$ and $Z$ be random vectors, with values in Euclidean spaces, such that the concatenation $\begin{pmatrix} Y \\ Z \end{pmatrix}$ is Gaussian and the cross-covariance matrix $\operatorname{Cov}(Y, Z)$ is zero. Then $Y$ and $Z$ are independent,

$$
Y \sim \mathcal{N}(\mathbb{E} Y, \operatorname{Cov}(Y)), \qquad Z \sim \mathcal{N}(\mathbb{E} Z, \operatorname{Cov}(Z)).
$$

**Proof.** Let $s$ and $t$ be real vectors of the same dimensions as $Y$ and $Z$. The covariance of the concatenation has diagonal blocks $\operatorname{Cov}(Y)$ and $\operatorname{Cov}(Z)$. Its off-diagonal blocks are $\operatorname{Cov}(Y, Z)$ and $\operatorname{Cov}(Z, Y) = \operatorname{Cov}(Y, Z)^\top$, and both are zero. The quadratic form in the joint characteristic function therefore loses its cross terms, and the definition gives

$$
\begin{aligned}
&\mathbb{E}\exp(i s^\top Y + i t^\top Z) \\
&\quad = \exp\Bigl(i s^\top \mathbb{E} Y + i t^\top \mathbb{E} Z - \tfrac12 s^\top \operatorname{Cov}(Y)\, s - \tfrac12 t^\top \operatorname{Cov}(Z)\, t\Bigr).
\end{aligned}
$$

The exponent is a sum of a function of $s$ and a function of $t$, so the right-hand side factors. Setting $t = 0$ shows that the factor in $s$ is the characteristic function of $Y$ and equals the characteristic function of $\mathcal{N}(\mathbb{E} Y, \operatorname{Cov}(Y))$. The same argument with $s = 0$ applies to $Z$. Thus $Y$ and $Z$ are Gaussian with those parameters, and the joint characteristic function equals the product of the marginal characteristic functions. On Euclidean space the characteristic function determines the Borel law, so the joint law is the product of the marginal laws. Hence $Y$ and $Z$ are independent.

**End of proof.**

### Theorem (Conditional Gaussian)

Let $d \ge 1$ and $k \ge 1$. Let $X_1$ and $X_2$ take values in $\mathbb{R}^d$ and $\mathbb{R}^k$, and suppose

$$
\begin{pmatrix} X_1 \\ X_2 \end{pmatrix}
\sim
\mathcal{N}\!\left(
\begin{pmatrix} \mu_1 \\ \mu_2 \end{pmatrix},
\Sigma
\right),
\qquad
\Sigma
=
\begin{pmatrix}
\Sigma_{11} & \Sigma_{12} \\
\Sigma_{21} & \Sigma_{22}
\end{pmatrix},
$$

where $\mu_1 \in \mathbb{R}^d$, $\mu_2 \in \mathbb{R}^k$, the blocks of $\Sigma$ have sizes $d \times d$, $d \times k$, $k \times d$, and $k \times k$, the matrix $\Sigma$ is symmetric and positive semidefinite (in particular $\Sigma_{21} = \Sigma_{12}^\top$), and $\Sigma_{22}$ is positive definite. Then there is a regular conditional distribution of $X_1$ given $X_2$ such that, for every $x_2 \in \mathbb{R}^k$,

$$
X_1 \mid X_2 = x_2
\sim
\mathcal{N}\!\bigl(
\mu_1 + \Sigma_{12}\Sigma_{22}^{-1}(x_2 - \mu_2),\;
\Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}
\bigr).
$$

In particular, this conditional distribution is Gaussian. Its covariance is positive semidefinite and is the same at every $x_2$.

**Proof.** Translating $(X_1, X_2)$ by $-(\mu_1, \mu_2)$ centers the vector and preserves both the covariance and the Gaussian family. Conditioning the original $X_1$ on $X_2 = x_2$ is the same as conditioning the centered first block on the centered second block equaling $x_2 - \mu_2$, and then adding $\mu_1$. The conditional covariance is unchanged by that translation. Without loss of generality, assume $\mu_1 = 0$ and $\mu_2 = 0$ in the body of the argument below. The general law is recovered at the end by adding $\mu_1$ and replacing the conditioning value with $x_2 - \mu_2$.

Since $\Sigma_{22}$ is symmetric and positive definite, it is invertible and $\Sigma_{22}^{-1}$ is symmetric. Write $A = \Sigma_{12}\Sigma_{22}^{-1}$ for the rest of this proof, and define the residual

$$
R = X_1 - A X_2.
$$

Then $\mathbb{E} R = 0$, and

$$
\begin{pmatrix} R \\ X_2 \end{pmatrix}
=
\begin{pmatrix} I_d & -A \\ 0 & I_k \end{pmatrix}
\begin{pmatrix} X_1 \\ X_2 \end{pmatrix},
$$

where $I_d$ and $I_k$ are the identity matrices of orders $d$ and $k$. Lemma (Affine images) yields that $(R, X_2)$ is Gaussian, with covariance equal to the product of this matrix, $\Sigma$, and the transpose of the matrix. First

$$
\Sigma
\begin{pmatrix} I_d & 0 \\ -A^\top & I_k \end{pmatrix}
=
\begin{pmatrix}
\Sigma_{11} - \Sigma_{12} A^\top & \Sigma_{12} \\
\Sigma_{21} - \Sigma_{22} A^\top & \Sigma_{22}
\end{pmatrix}.
$$

Since $\Sigma_{22}^{-1}$ is symmetric and $\Sigma_{12}^\top = \Sigma_{21}$, one has $A^\top = \Sigma_{22}^{-1}\Sigma_{21}$, so $\Sigma_{22} A^\top = \Sigma_{21}$ and the lower-left block vanishes. Also $\Sigma_{12} A^\top = \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}$. Multiplying on the left by the original matrix then gives

$$
\begin{pmatrix} I_d & -A \\ 0 & I_k \end{pmatrix}
\begin{pmatrix}
\Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21} & \Sigma_{12} \\
0 & \Sigma_{22}
\end{pmatrix}
=
\begin{pmatrix}
\Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21} & 0 \\
0 & \Sigma_{22}
\end{pmatrix},
$$

where the upper-right block simplifies because $A\Sigma_{22} = \Sigma_{12}$. Thus $\operatorname{Cov}(R, X_2) = 0$ and

$$
\operatorname{Cov}(R) = \Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21},
$$

which is positive semidefinite because it is a diagonal block of a covariance matrix. Lemma (Uncorrelated blocks) yields that $R$ is independent of $X_2$ and

$$
R \sim \mathcal{N}\!\bigl(0,\, \Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}\bigr).
$$

The residual decomposition $X_1 = R + A X_2$ holds pathwise. Let $f$ and $g$ be bounded continuous real functions on $\mathbb{R}^d$ and $\mathbb{R}^k$. Independence integrates out $R$ first:

$$
\mathbb{E}\bigl[f(X_1)\, g(X_2)\bigr]
=
\mathbb{E}\Bigl[
g(X_2)
\int f(r + A X_2)\, \mathbb{P}(R \in dr)
\Bigr].
$$

For each fixed $x_2$, Lemma (Affine images) applied to $R + A x_2$ shows that the inner integral is the integral of $f$ against

$$
\mathcal{N}\!\bigl(A x_2,\, \Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}\bigr).
$$

For a regular conditional distribution of $X_1$ given $X_2$, which exists because $\mathbb{R}^d$ is a Polish space, the same product formula holds when the inner integral is computed from that conditional distribution instead of from the law of $R$. The expectation of $g(X_2)$ times the difference of these two integrals of $f$ is therefore zero for every bounded continuous $g$, so the two integrals of $f$ agree almost surely. Borel probability measures on $\mathbb{R}^d$ are determined by their integrals against a countable family of bounded continuous functions, and one null set covers that family. Outside it, the conditional distribution equals

$$
\mathcal{N}\!\bigl(
A x_2,\;
\Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}
\bigr)
$$

at the realized value $x_2 = X_2$. The same formula defines a probability kernel at every $x_2 \in \mathbb{R}^k$. A kernel that agrees almost surely with a regular conditional distribution is itself a regular conditional distribution of $X_1$ given $X_2$.

The reduction is now removed. Shift the centered conditional law by $\mu_1$ and evaluate it at $x_2 - \mu_2$. For every $x_2 \in \mathbb{R}^k$,

$$
X_1 \mid X_2 = x_2
\sim
\mathcal{N}\!\bigl(
\mu_1 + \Sigma_{12}\Sigma_{22}^{-1}(x_2 - \mu_2),\;
\Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}
\bigr).
$$

**End of proof.**

### Corollary (Positive definite conditional covariance)

Assume the hypotheses of Theorem (Conditional Gaussian), and assume in addition that $\Sigma$ is positive definite. Then the conditional covariance $\Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}$ is positive definite.

**Proof.** The matrix identity in the proof of Theorem (Conditional Gaussian) depends only on $\Sigma$. With $A = \Sigma_{12}\Sigma_{22}^{-1}$ and

$$
B =
\begin{pmatrix} I_d & -A \\ 0 & I_k \end{pmatrix},
$$

that computation is

$$
B\Sigma B^\top
=
\begin{pmatrix}
\Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21} & 0 \\
0 & \Sigma_{22}
\end{pmatrix}.
$$

The product of $B$ on the left with $\begin{pmatrix} I_d & A \\ 0 & I_k \end{pmatrix}$ is the identity, so $B$ is invertible. For every nonzero $u \in \mathbb{R}^{d+k}$, the vector $B^\top u$ is nonzero and

$$
u^\top B\Sigma B^\top u = (B^\top u)^\top \Sigma (B^\top u) > 0,
$$

because $\Sigma$ is positive definite. Hence $B\Sigma B^\top$ is positive definite, and its diagonal blocks are symmetric. For every nonzero $v \in \mathbb{R}^d$, the stacked vector $\begin{pmatrix} v \\ 0 \end{pmatrix}$ is a nonzero vector in $\mathbb{R}^{d+k}$, and the quadratic form of $B\Sigma B^\top$ on it equals $v^\top \bigl(\Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}\bigr) v$. That quantity is positive:

$$
v^\top \bigl(\Sigma_{11} - \Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}\bigr) v > 0.
$$

The conditional covariance is therefore positive definite.

**End of proof.**

## Remarks

**Why the conditional distribution is Gaussian.** Restore the means in the residual from the proof by writing $R = X_1 - \mu_1 - \Sigma_{12}\Sigma_{22}^{-1}(X_2 - \mu_2)$. This agrees with the centered residual when $\mu_1 = 0$ and $\mu_2 = 0$, and $X_1 = R + \mu_1 + \Sigma_{12}\Sigma_{22}^{-1}(X_2 - \mu_2)$. The vector $(R, X_2)$ is an affine image of $(X_1, X_2)$, hence jointly Gaussian, and the coefficient of $X_2$ forces $\operatorname{Cov}(R, X_2) = 0$. Lemma (Uncorrelated blocks) turns that vanishing cross-covariance into independence of $R$ and $X_2$. Joint normality is what makes that passage valid. Conditioning on $X_2 = x_2$ leaves the law of $R$ fixed and substitutes $x_2$ into the affine term. Lemma (Affine images) keeps the shifted residual inside the Gaussian family. The conditional covariance equals $\operatorname{Cov}(R)$, so it is the same for every $x_2$. That covariance is the Schur complement of $\Sigma_{22}$ in $\Sigma$.

The block factorization of $\Sigma$ in the proof is the same algebra as completing the square in the joint quadratic form. The residual argument reads that algebra as an independence statement.

**Role of positive definiteness.** Positive definiteness of $\Sigma_{22}$ supplies the inverse in the coefficient of $X_2$. The coordinate projection $(X_1, X_2) \mapsto X_2$ has matrix $\begin{pmatrix} 0 & I_k \end{pmatrix}$, so Lemma (Affine images) gives the marginal law $X_2 \sim \mathcal{N}(\mu_2, \Sigma_{22})$. Separately, the conditional kernel constructed in the proof of Theorem (Conditional Gaussian) is defined at every point of $\mathbb{R}^k$. A singular conditioning block calls for a generalized inverse and for conditioning values in the affine support of $X_2$.

**Example.** Suppose $d = k = 1$, $X_1 = X_2$, and the common variance $\sigma^2$ satisfies $\sigma^2 > 0$. Then $\mu_1 = \mu_2$ and $\Sigma_{11} = \Sigma_{12} = \Sigma_{22} = \sigma^2$. The joint covariance has rank one. The conditional mean in Theorem (Conditional Gaussian) is $\mu_1 + \sigma^2(\sigma^2)^{-1}(x_2 - \mu_1) = x_2$, and the conditional variance is

$$
\sigma^2 - \sigma^2(\sigma^2)^{-1}\sigma^2 = 0.
$$

The conditional distribution is a point mass at $x_2$, the Gaussian law $\mathcal{N}(x_2, 0)$ allowed by the definition.