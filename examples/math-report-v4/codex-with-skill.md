The problem is to find the distribution of one part of a jointly Gaussian vector after observing the other part. The observation shifts the mean, while the remaining uncertainty is described by a covariance matrix that does not depend on the observed value.

**Proposition (Gaussian conditioning).** Let \(X\in\mathbb R^p\) and \(Y\in\mathbb R^q\) satisfy
\[
\begin{pmatrix}X\\Y\end{pmatrix}
\sim\mathcal N_{p+q}\!\left(
\begin{pmatrix}\mu_X\\\mu_Y\end{pmatrix},
\begin{pmatrix}
\Sigma_{XX}&\Sigma_{XY}\\
\Sigma_{YX}&\Sigma_{YY}
\end{pmatrix}\right),
\]
where \(\Sigma_{XY}=\operatorname{Cov}(X,Y)=\Sigma_{YX}^{\mathsf T}\). Assume \(\Sigma_{YY}\) is positive definite. A version of the conditional distribution, defined for every \(y\in\mathbb R^q\), is
\[
\boxed{
X\mid(Y=y)\sim\mathcal N_p\!\left(
\mu_X+\Sigma_{XY}\Sigma_{YY}^{-1}(y-\mu_Y),\ S
\right),
}
\]
where
\[
S=\Sigma_{XX}-\Sigma_{XY}\Sigma_{YY}^{-1}\Sigma_{YX}
\]
is positive semidefinite and is called the Schur complement of \(\Sigma_{YY}\). The conditional Gaussian may be degenerate if \(S\) is singular.

**Proof.** Define the regression coefficient and residual by
\[
A=\Sigma_{XY}\Sigma_{YY}^{-1},
\qquad R=X-\mu_X-A(Y-\mu_Y).
\]
The pair \((R,Y)\) is jointly Gaussian: every linear combination of its components is an affine combination of the original jointly Gaussian components, hence is normal. Also, \(\mathbb E[R]=0\), and
\[
\operatorname{Cov}(R,Y)=\Sigma_{XY}-A\Sigma_{YY}=0.
\]
Expanding the residual covariance gives
\[
\begin{aligned}
\operatorname{Cov}(R)
&=\Sigma_{XX}-A\Sigma_{YX}-\Sigma_{XY}A^{\mathsf T}
  +A\Sigma_{YY}A^{\mathsf T}\\
&=\Sigma_{XX}-\Sigma_{XY}\Sigma_{YY}^{-1}\Sigma_{YX}=S.
\end{aligned}
\]
Thus \(S\) is positive semidefinite because it is a covariance matrix.

Joint Gaussianity turns the zero cross-covariance into independence. Explicitly, for \(t\in\mathbb R^p\) and \(u\in\mathbb R^q\), the joint characteristic function factors:
\[
\mathbb E\!\left[e^{i(t^{\mathsf T}R+u^{\mathsf T}(Y-\mu_Y))}\right]
=e^{-\frac12t^{\mathsf T}St}\,
 e^{-\frac12u^{\mathsf T}\Sigma_{YY}u}.
\]
These factors are the marginal characteristic functions, so \(R\) and \(Y\) are independent, with \(R\sim\mathcal N_p(0,S)\).

Finally, rewrite
\[
X=\mu_X+A(Y-\mu_Y)+R.
\]
Given \(Y=y\), the first two terms are fixed and the independent residual keeps its Gaussian distribution. Translating that residual gives exactly the stated conditional mean and covariance. \(\square\)

**Interpretation.** The conditional mean is the linear prediction of \(X\) from \(Y\), and \(S\) measures the uncertainty left in its residual. Gaussianity is essential to the independence step: uncorrelated random vectors need not be independent in general. Conditioning preserves Gaussianity here because it fixes the prediction and leaves an independent Gaussian residual. Since \(Y=y\) has probability zero, the displayed formula specifies a regular conditional distribution rather than a ratio of point probabilities.
