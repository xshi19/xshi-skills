# Conditional distribution of a partitioned multivariate normal

The conditional distribution of one block of a multivariate normal vector, given the complementary block, is Gaussian. This report derives that law.

A random vector is Gaussian when every real linear functional of it is univariate normal, and a constant counts as normal with variance zero. A linear functional of an affine image is an affine function of a linear functional, so an affine image of a Gaussian vector is Gaussian. On a Euclidean space, the one-dimensional projections determine the law, and therefore a Gaussian law is determined by its mean and its covariance. The symbol \(\mathcal{N}\) denotes that law.

Let \((X_1,X_2)\) be a Gaussian random vector,
\[
\begin{pmatrix} X_1 \\ X_2 \end{pmatrix}
\sim
\mathcal{N}\!\left(
\begin{pmatrix} \mu_1 \\ \mu_2 \end{pmatrix},
\begin{pmatrix}
\Sigma_{11} & \Sigma_{12} \\
\Sigma_{12}^{\top} & \Sigma_{22}
\end{pmatrix}
\right).
\]
Thus \(\mathbb{E}X_1=\mu_1\), \(\mathbb{E}X_2=\mu_2\), \(\operatorname{Cov}(X_1)=\Sigma_{11}\), \(\operatorname{Cov}(X_1,X_2)=\Sigma_{12}\), and \(\operatorname{Cov}(X_2)=\Sigma_{22}\).

**Claim.** There exists a matrix \(A\) such that \(A\Sigma_{22}=\Sigma_{12}\). For any such \(A\), and for every point \(x_2\) in the ambient space of \(X_2\) with \(x_2-\mu_2\) in the range of \(\Sigma_{22}\),
\[
X_1\mid X_2=x_2
\sim
\mathcal{N}\!\bigl(
\mu_1+A(x_2-\mu_2),\;
\Sigma_{11}-A\Sigma_{12}^{\top}
\bigr).
\]
On that set, every solution \(A\) produces the same conditional mean and the same conditional covariance, so the conditional distribution is unambiguous and Gaussian. Almost every value of \(X_2\) lies in \(\mu_2+\operatorname{range}(\Sigma_{22})\). If \(\Sigma_{22}\) is positive definite, the unique solution is \(A=\Sigma_{12}\Sigma_{22}^{-1}\), every point \(x_2\) of the ambient space is allowed, and
\[
X_1\mid X_2=x_2
\sim
\mathcal{N}\!\left(
\mu_1+\Sigma_{12}\Sigma_{22}^{-1}(x_2-\mu_2),\;
\Sigma_{11}-\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^{\top}
\right).
\]

**Proof.** The joint covariance is positive semidefinite, so its quadratic form is nonnegative. Let \(v\) be a vector with \(\Sigma_{22}v=0\). For every vector \(w\) and every real scalar \(\lambda\), the quadratic form on \((w,\lambda v)\) equals
\[
w^{\top}\Sigma_{11}w+2\lambda\, w^{\top}\Sigma_{12}v.
\]
The summand \(\lambda^{2}v^{\top}\Sigma_{22}v\) vanishes because \(\Sigma_{22}v=0\), and each cross term equals \(\lambda\, w^{\top}\Sigma_{12}v\). This expression stays nonnegative for every real \(\lambda\). The coefficient of \(\lambda\) is \(2w^{\top}\Sigma_{12}v\), and that coefficient is zero: otherwise the expression would be negative for a large positive \(\lambda\) or a large negative \(\lambda\). Hence \(w^{\top}\Sigma_{12}v=0\). Since \(w\) is arbitrary, \(\Sigma_{12}v=0\).

Every column of \(\Sigma_{12}^{\top}\) is therefore orthogonal to \(\ker\Sigma_{22}\). Symmetry of \(\Sigma_{22}\) gives \(\ker(\Sigma_{22})^{\perp}=\operatorname{range}(\Sigma_{22})\), so each of those columns lies in the range of \(\Sigma_{22}\). Hence \(\Sigma_{12}^{\top}=\Sigma_{22}A^{\top}\) for a matrix \(A\), or equivalently
\[
A\Sigma_{22}=\Sigma_{12}.
\]

Fix one such matrix \(A\) and define the residual
\[
R=X_1-\mu_1-A(X_2-\mu_2).
\]
Linearity of expectation gives \(\mathbb{E}R=0\). Bilinearity of covariance gives
\[
\operatorname{Cov}(R,X_2)=\Sigma_{12}-A\Sigma_{22}=0
\]
and expands the residual covariance:
\[
\begin{aligned}
\operatorname{Cov}(R)
&=
\Sigma_{11}-\Sigma_{12}A^{\top}-A\Sigma_{12}^{\top}+A\Sigma_{22}A^{\top}\\
&=
\Sigma_{11}-A\Sigma_{12}^{\top},
\end{aligned}
\]
where the last step replaces \(A\Sigma_{22}A^{\top}\) by \(\Sigma_{12}A^{\top}\).

Let \(D\) be the difference of the fixed solution \(A\) and any other solution, so \(D\Sigma_{22}=0\). Transposing \(A\Sigma_{22}=\Sigma_{12}\) produces \(\Sigma_{12}^{\top}=\Sigma_{22}A^{\top}\), and therefore
\[
D\Sigma_{12}^{\top}=D\Sigma_{22}A^{\top}=0.
\]
Adding \(D\) leaves \(A\Sigma_{12}^{\top}\) unchanged, so that product is the same for every solution. On the set where \(x_2-\mu_2\) lies in the range of \(\Sigma_{22}\), choose a vector \(b\) with \(\Sigma_{22}b=x_2-\mu_2\). Then
\[
A(x_2-\mu_2)=A\Sigma_{22}b=\Sigma_{12}b.
\]
The difference of two preimages lies in \(\ker\Sigma_{22}\) and therefore in \(\ker\Sigma_{12}\), so \(\Sigma_{12}b\) does not depend on the preimage either. The conditional mean and \(\operatorname{Cov}(R)\) are the same for every solution \(A\).

The pair \((R,X_2)\) is an affine image of \((X_1,X_2)\), so \((R,X_2)\) is Gaussian. For all real vectors \(s\) and \(t\), the scalar \(s^{\top}R+t^{\top}X_2\) is univariate normal. Its mean is \(s^{\top}\mathbb{E}R+t^{\top}\mu_2=t^{\top}\mu_2\), and its variance is
\[
s^{\top}\operatorname{Cov}(R)\,s+2s^{\top}\operatorname{Cov}(R,X_2)\,t+t^{\top}\Sigma_{22}t
=
s^{\top}\operatorname{Cov}(R)\,s+t^{\top}\Sigma_{22}t.
\]
Every univariate normal random variable \(U\) satisfies
\[
\mathbb{E}\exp(iU)=\exp\bigl(i\mathbb{E}U-\tfrac12\operatorname{Var}U\bigr),
\]
where \(i\) is the imaginary unit. If \(U\) is almost surely constant, the variance is zero and both sides equal \(\exp(i\mathbb{E}U)\). Apply the identity to \(s^{\top}R+t^{\top}X_2\):
\[
\mathbb{E}\exp(is^{\top}R+it^{\top}X_2)
=
\exp\!\bigl(
it^{\top}\mu_2
-\tfrac12 s^{\top}\operatorname{Cov}(R)\,s
-\tfrac12 t^{\top}\Sigma_{22}t
\bigr).
\]
Setting \(t=0\) yields the characteristic function of \(R\), and setting \(s=0\) yields the characteristic function of \(X_2\). The joint characteristic function equals the product of the marginal characteristic functions, so \(R\) and \(X_2\) are independent. Therefore
\[
R\sim\mathcal{N}\!\bigl(0,\,\Sigma_{11}-A\Sigma_{12}^{\top}\bigr).
\]

Solving the definition of \(R\) for the first block gives
\[
X_1=\mu_1+A(X_2-\mu_2)+R.
\]
Because \(R\) is independent of \(X_2\), the conditional law of \(X_1\) given \(X_2=x_2\) is the law of the translate \(\mu_1+A(x_2-\mu_2)+R\). That translate is Gaussian, with the mean and covariance in the claim. Sending each \(x_2\) to this law defines a regular conditional distribution for the fixed solution \(A\). When \(x_2-\mu_2\) lies in the range of \(\Sigma_{22}\), that law is the same for every solution.

A linear functional of \(X_2-\mu_2\) that vanishes on \(\operatorname{range}(\Sigma_{22})\) is given by a vector in \(\ker\Sigma_{22}\). The variance of the functional is the quadratic form of \(\Sigma_{22}\) on that vector, hence zero, and the functional equals zero almost surely. A basis of the orthogonal complement of the range imposes finitely many such constraints, and the set they cut out is \(\mu_2+\operatorname{range}(\Sigma_{22})\). Hence \(X_2\) lies in that affine set almost surely. If \(\Sigma_{22}\) is positive definite, its kernel is \(\{0\}\), its range is the whole ambient space of \(X_2\), and right-multiplication by \(\Sigma_{22}^{-1}\) produces the unique solution \(A=\Sigma_{12}\Sigma_{22}^{-1}\).

**Why the conditional law is Gaussian.** Given \(X_2=x_2\), the decomposition \(X_1=\mu_1+A(X_2-\mu_2)+R\) is a translation of \(R\) by the constant \(\mu_1+A(x_2-\mu_2)\). The residual \(R\) is Gaussian and independent of \(X_2\), so the conditional law of \(R\) equals its unconditional law. Translation preserves Gaussianity.

Joint normality is used to pass from \(\operatorname{Cov}(R,X_2)=0\) to independence. The matrix equation \(A\Sigma_{22}=\Sigma_{12}\) makes that cross-covariance zero. For every frequency pair \((s,t)\), the scalar \(s^{\top}R+t^{\top}X_2\) is univariate normal, and the characteristic function of a univariate normal random variable is determined by its mean and its variance. With the cross-covariance equal to zero, the variance is the sum of a quadratic form in \(s\) and a quadratic form in \(t\), so the joint characteristic function factors into the two marginal characteristic functions. The conditional covariance equals \(\operatorname{Cov}(R)\) and stays the same for every \(x_2\). The conditional mean \(\mu_1+A(x_2-\mu_2)\) is affine in \(x_2\).
