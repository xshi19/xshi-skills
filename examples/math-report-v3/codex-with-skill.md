The problem asks how observing one part of a jointly Gaussian vector changes the distribution of the remaining part. The answer is another Gaussian: its mean shifts linearly with the observation, while its covariance does not depend on the observed value.

**Proposition (conditional multivariate normal).** Let

\[
\begin{pmatrix}X_1\\X_2\end{pmatrix}
\sim \mathcal N_{p+q}\!\left(
\begin{pmatrix}\mu_1\\\mu_2\end{pmatrix},
\begin{pmatrix}
\Sigma_{11}&\Sigma_{12}\\
\Sigma_{21}&\Sigma_{22}
\end{pmatrix}\right),
\]

where \(X_1\in\mathbb R^p\), \(X_2\in\mathbb R^q\), and \(\Sigma_{ij}=\operatorname{Cov}(X_i,X_j)\), so \(\Sigma_{21}=\Sigma_{12}^{\mathsf T}\). Assume \(\Sigma_{22}\) is positive definite. A version of the conditional distribution, defined for every \(x_2\in\mathbb R^q\), is

\[
\boxed{
X_1\mid X_2=x_2
\sim \mathcal N_p\!\left(
\mu_1+\Sigma_{12}\Sigma_{22}^{-1}(x_2-\mu_2),\ S
\right),
\qquad
S=\Sigma_{11}-\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}.
}
\]

The conditional covariance \(S\) is the Schur complement of \(\Sigma_{22}\); it may be singular, in which case the conditional Gaussian is degenerate.

**Proof.** Set \(B=\Sigma_{12}\Sigma_{22}^{-1}\) and subtract the linear prediction from \(X_1\) to form the residual

\[
R=X_1-\mu_1-B(X_2-\mu_2).
\]

The pair \((R,X_2)\) is jointly Gaussian because it is an affine transformation of the original Gaussian vector: every linear combination of its coordinates is Gaussian. Its residual has mean zero, and

\[
\operatorname{Cov}(R,X_2)
=\Sigma_{12}-B\Sigma_{22}=0.
\]

Moreover,

\[
\begin{aligned}
\operatorname{Cov}(R)
&=\Sigma_{11}-B\Sigma_{21}-\Sigma_{12}B^{\mathsf T}
  +B\Sigma_{22}B^{\mathsf T}\\
&=\Sigma_{11}-\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}
=S.
\end{aligned}
\]

For jointly Gaussian vectors, zero cross-covariance implies independence. Here this follows directly from the joint characteristic function: for \(t\in\mathbb R^p\) and \(u\in\mathbb R^q\),

\[
\mathbb E\!\left[e^{i t^{\mathsf T}R+i u^{\mathsf T}(X_2-\mu_2)}\right]
=e^{-\frac12 t^{\mathsf T}St}\,
 e^{-\frac12 u^{\mathsf T}\Sigma_{22}u}.
\]

This is the product of the two marginal characteristic functions, so \(R\) and \(X_2\) are independent. Consequently, observing \(X_2=x_2\) leaves \(R\sim\mathcal N_p(0,S)\) unchanged. Substituting into

\[
X_1=\mu_1+B(X_2-\mu_2)+R
\]

shows that the conditional vector is a fixed shift of a Gaussian residual, giving exactly the stated mean and covariance. \(\square\)

**Interpretation.** The conditional mean is the original mean plus a correction determined by the cross-covariance and the observation's deviation from \(\mu_2\). The conditional covariance subtracts the positive semidefinite matrix \(\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}\) from \(\Sigma_{11}\), reflecting reduced uncertainty. If \(\Sigma_{12}=0\), the blocks are independent and conditioning changes nothing. Joint Gaussianity is essential: uncorrelated residuals need not be independent for other distributions.

Since \(X_2\) is continuous, the event \(X_2=x_2\) has probability zero; the formula describes a regular conditional distribution, rather than a ratio of probabilities of point events.
