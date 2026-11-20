# Conditional distribution of a partitioned multivariate normal

The problem is to split a multivariate normal vector into blocks $X_1$ and $X_2$ and derive the conditional distribution of $X_1$ given $X_2=x_2$. The conditional distribution is Gaussian for every $x_2$. Its mean is affine in $x_2$, and its covariance is the same at every $x_2$: it is the covariance left after an affine regression of $X_1$ on $X_2$. That regression residual is jointly normal with $X_2$ and uncorrelated with $X_2$. The argument below upgrades the uncorrelated residual to an independent residual, so the condition $X_2=x_2$ only shifts it.

For random vectors $U$ and $V$ of finite dimension, write
$$
\operatorname{Cov}(U,V)=\mathbb{E}\bigl[(U-\mathbb{E}U)(V-\mathbb{E}V)^\top\bigr].
$$
A random vector $Y$ is Gaussian, written $Y\sim\mathcal{N}(\mu,\Sigma)$, when $\Sigma$ is symmetric and positive semidefinite and
$$
\mathbb{E}\exp(it^\top Y)=\exp\bigl(it^\top\mu-\tfrac12 t^\top\Sigma t\bigr)
$$
for every real vector $t$ of the same dimension as $Y$. In one dimension the parameters in this formula are the mean and the variance, and a zero variance is a point mass at the mean. For a vector $Y$, let $a$ be any real vector of the same dimension. At a scalar frequency $\tau$, the characteristic function of $a^\top Y$ is the characteristic function of $Y$ at the frequency $\tau a$,
$$
\mathbb{E}\exp(i\tau\, a^\top Y)=\exp\bigl(i\tau\, a^\top\mu-\tfrac12\tau^2 a^\top\Sigma a\bigr).
$$
By the one-dimensional fact, $a^\top Y$ is univariate normal with mean $a^\top\mu$ and variance $a^\top\Sigma a$. Since $a$ is arbitrary, $\mu=\mathbb{E}Y$. The quadratic form of $\operatorname{Cov}(Y)$ is $a\mapsto\operatorname{Var}(a^\top Y)$, so it equals $a\mapsto a^\top\Sigma a$. Set $S=\Sigma-\operatorname{Cov}(Y)$. Then $S$ is symmetric and $a^\top S a=0$ for every $a$. Symmetry gives the polarization identity: for every vector $c$ of the same dimension,
$$
4a^\top S c=(a+c)^\top S(a+c)-(a-c)^\top S(a-c).
$$
The right-hand side is zero, so $a^\top S c=0$. Every entry of $S$ vanishes, and $\Sigma=\operatorname{Cov}(Y)$. Characteristic functions determine Borel probability laws on Euclidean space, so the parameters $(\mu,\Sigma)$ determine the law of $Y$.

Write
$$
\mu_1=\mathbb{E}X_1,\quad
\mu_2=\mathbb{E}X_2,\quad
\Sigma_{11}=\operatorname{Cov}(X_1,X_1),\quad
\Sigma_{12}=\operatorname{Cov}(X_1,X_2),\quad
\Sigma_{22}=\operatorname{Cov}(X_2,X_2).
$$
Then $\operatorname{Cov}(X_2,X_1)=\Sigma_{12}^\top$, and the block $\Sigma_{22}$ is symmetric.

**Theorem.** Assume that the concatenated vector $(X_1,X_2)$ is Gaussian and that $\Sigma_{22}$ is positive definite. Then, for every real vector $x_2$ of the same dimension as $X_2$,
$$
X_1\mid X_2=x_2
\sim
\mathcal{N}\!\Bigl(
\mu_1+\Sigma_{12}\Sigma_{22}^{-1}(x_2-\mu_2),\;
\Sigma_{11}-\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top
\Bigr).
$$
The mean depends continuously on $x_2$ and the covariance is constant, so the formula defines a probability kernel in $x_2$. The kernel is a regular conditional distribution of $X_1$ given $X_2$: for every bounded measurable real function $g$ of $X_1$, the conditional expectation $\mathbb{E}[g(X_1)\mid X_2]$ equals the integral of $g$ against this normal law evaluated at $X_2$, almost surely. The formula gives the conditional law at every $x_2$. Any regular conditional distribution agrees with this formula for almost every $x_2$ under the law of $X_2$.

**Proof.** Affine images of Gaussian vectors are Gaussian. Let $Y\sim\mathcal{N}(\mu,\Sigma)$, let $b$ be a constant vector, and let $A$ be a constant matrix of compatible size. Set $Z=b+AY$. Then $Z\sim\mathcal{N}(b+A\mu,\,A\Sigma A^\top)$. For every real vector $u$ of the dimension of $Z$, the definition of $Y$ at the frequency $A^\top u$ gives
$$
\begin{aligned}
\mathbb{E}\exp(iu^\top Z)
&=\mathbb{E}\exp\bigl(iu^\top b+i(A^\top u)^\top Y\bigr)\\
&=\exp\bigl(iu^\top(b+A\mu)-\tfrac12(A^\top u)^\top\Sigma(A^\top u)\bigr)\\
&=\exp\bigl(iu^\top(b+A\mu)-\tfrac12 u^\top A\Sigma A^\top u\bigr).
\end{aligned}
$$
The quadratic form $u\mapsto u^\top A\Sigma A^\top u$ equals $(A^\top u)^\top\Sigma(A^\top u)$, so it is nonnegative. The matrix $A\Sigma A^\top$ is symmetric. It is therefore a covariance parameter of the required kind.

Define the regression coefficient and the residual by
$$
B=\Sigma_{12}\Sigma_{22}^{-1},
\qquad
R=(X_1-\mu_1)-B(X_2-\mu_2).
$$
Then $X_1=\mu_1+B(X_2-\mu_2)+R$. The pair $(R,X_2)$ is an affine image of $(X_1,X_2)$, since $R$ is an affine function of $(X_1,X_2)$ and the second block is unchanged. The affine-image fact yields that $(R,X_2)$ is Gaussian. Linearity gives $\mathbb{E}R=0$. The coefficient satisfies $B\Sigma_{22}=\Sigma_{12}$, and the definition of covariance gives
$$
\begin{aligned}
\operatorname{Cov}(R,X_2)
&=\mathbb{E}\bigl[((X_1-\mu_1)-B(X_2-\mu_2))(X_2-\mu_2)^\top\bigr]
=\Sigma_{12}-B\Sigma_{22}
=0,\\[0.35em]
\operatorname{Cov}(R)
&=\mathbb{E}[RR^\top]
=\Sigma_{11}-\Sigma_{12}B^\top-B\Sigma_{12}^\top+B\Sigma_{22}B^\top.
\end{aligned}
$$
Both identities come from expanding the products $(X_1-\mu_1)-B(X_2-\mu_2)$ and taking expectations. The relation $B\Sigma_{22}=\Sigma_{12}$ turns $B\Sigma_{22}B^\top$ into $\Sigma_{12}B^\top$. Since $\Sigma_{22}$ is symmetric, so is $\Sigma_{22}^{-1}$, and $B^\top=\Sigma_{22}^{-1}\Sigma_{12}^\top$. Hence
$$
\Sigma_{12}B^\top=B\Sigma_{12}^\top=B\Sigma_{22}B^\top=\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top.
$$
The three correction terms therefore sum to $-\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top$, and
$$
\operatorname{Cov}(R)=\Sigma_{11}-\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top.
$$
The residual $R$ is an affine image of $(X_1,X_2)$, so $R$ is Gaussian. With the moments above,
$$
R\sim\mathcal{N}\!\bigl(0,\,\Sigma_{11}-\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top\bigr).
$$
The block $X_2$ is a coordinate projection of $(X_1,X_2)$, so $X_2\sim\mathcal{N}(\mu_2,\Sigma_{22})$.

Thus $(R,X_2)$ is Gaussian with mean $(0,\mu_2)$ and with block-diagonal covariance, the diagonal blocks being $\operatorname{Cov}(R)$ and $\Sigma_{22}$. For all real vectors $s$ and $t$ of the dimensions of $R$ and $X_2$,
$$
\begin{aligned}
\mathbb{E}\exp(is^\top R+it^\top X_2)
&=\exp\bigl(it^\top\mu_2-\tfrac12 s^\top\operatorname{Cov}(R)s-\tfrac12 t^\top\Sigma_{22}t\bigr)\\
&=\mathbb{E}\exp(is^\top R)\,\mathbb{E}\exp(it^\top X_2).
\end{aligned}
$$
The product is the characteristic function of the product of the marginal laws. By uniqueness of characteristic functions, $R$ and $X_2$ are independent.

Fix a value $x_2$. Independence means that the conditional law of $R$ given $X_2$ is the unconditional law of $R$, so replacing $X_2$ by $x_2$ leaves the law of $R$ unchanged. Translating that Gaussian vector yields
$$
\mu_1+B(x_2-\mu_2)+R
\sim
\mathcal{N}\!\bigl(\mu_1+B(x_2-\mu_2),\,\operatorname{Cov}(R)\bigr).
$$
For every bounded measurable $g$ as in the theorem, the identity $X_1=\mu_1+B(X_2-\mu_2)+R$ gives, almost surely,
$$
\mathbb{E}\bigl[g(X_1)\bigm|X_2\bigr]
=\mathbb{E}\bigl[g\bigl(\mu_1+B(X_2-\mu_2)+R\bigr)\bigm|X_2\bigr].
$$
The right-hand side equals the integral of $g$ against $\mathcal{N}(\mu_1+B(x_2-\mu_2),\operatorname{Cov}(R))$ evaluated at $x_2=X_2$. Restoring $B=\Sigma_{12}\Sigma_{22}^{-1}$ gives the mean and covariance in the theorem.

**Why the conditional distribution is Gaussian.** The coefficient $B$ is chosen so that $\operatorname{Cov}(R,X_2)=0$. Second moments and the inverse of $\Sigma_{22}$ determine $B$. Joint normality of $(X_1,X_2)$ passes to the affine image $(R,X_2)$, and the characteristic function of that image then factors. The factors are the marginal characteristic functions, so $R$ is independent of $X_2$ and keeps the Gaussian law $\mathcal{N}(0,\operatorname{Cov}(R))$ under the condition $X_2=x_2$. The conditional vector is this residual plus the constant $\mu_1+B(x_2-\mu_2)$. An added constant preserves the Gaussian class, by the affine-image fact. The conditional distribution is therefore Gaussian for every $x_2$, with covariance $\operatorname{Cov}(R)$ at every conditioning value.

Positive definiteness of $\Sigma_{22}$ is the hypothesis that provides $\Sigma_{22}^{-1}$. The joint covariance of $(X_1,X_2)$ may be singular. The conditional covariance equals $\operatorname{Cov}(R)$, hence is symmetric and positive semidefinite, and it may itself be singular. A linear form of $R$ whose variance is zero is almost surely constant. If $\operatorname{Cov}(R)$ is singular, some nonzero linear form has variance zero, and the conditional distribution is supported on a proper affine subspace. The definition of $\mathcal{N}(\mu,\Sigma)$ already includes that case.

The identity $X_1=X_2$ almost surely is a check. It forces $\mu_1=\mu_2$ and $\Sigma_{11}=\Sigma_{12}=\Sigma_{22}$. If $\Sigma_{22}$ is positive definite, then $B$ is the identity matrix and $R=0$ almost surely. The conditional mean is $\mu_2+(x_2-\mu_2)=x_2$, and the conditional covariance is $\Sigma_{22}-\Sigma_{22}\Sigma_{22}^{-1}\Sigma_{22}=0$. The conditional law is a point mass at $x_2$.
