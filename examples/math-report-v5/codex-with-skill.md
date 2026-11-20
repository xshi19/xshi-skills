The problem asks how observing one block of a jointly Gaussian vector changes the distribution of the other block. Let

\[
\begin{pmatrix}X\\Y\end{pmatrix}
\sim \mathcal N_{p+q}\!\left(
\begin{pmatrix}\mu_X\\\mu_Y\end{pmatrix},
\begin{pmatrix}
\Sigma_{XX}&\Sigma_{XY}\\
\Sigma_{YX}&\Sigma_{YY}
\end{pmatrix}\right),
\]

where \(X\in\mathbb R^p\), \(Y\in\mathbb R^q\), and \(\Sigma_{XY}=\operatorname{Cov}(X,Y)=\Sigma_{YX}^{\mathsf T}\). Assume \(\Sigma_{YY}\) is positive definite. We will prove that

\[
\boxed{
X\mid Y=y\sim\mathcal N_p\!\left(
\mu_X+\Sigma_{XY}\Sigma_{YY}^{-1}(y-\mu_Y),
\Sigma_{XX}-\Sigma_{XY}\Sigma_{YY}^{-1}\Sigma_{YX}
\right).
}
\]

To derive this, subtract the part of \(X\) predicted linearly by \(Y\), defining the residual

\[
R=X-\mu_X-\Sigma_{XY}\Sigma_{YY}^{-1}(Y-\mu_Y).
\]

The pair \((R,Y)\) is jointly Gaussian because it is an affine transformation of \((X,Y)\): every linear combination of its components is a linear combination of the original Gaussian components plus a constant. Also,

\[
\operatorname{Cov}(R,Y)
=\Sigma_{XY}-\Sigma_{XY}\Sigma_{YY}^{-1}\Sigma_{YY}=0.
\]

Uncorrelated jointly Gaussian vectors are independent. Indeed, their joint Gaussian characteristic function factors into the two marginal characteristic functions when the cross-covariance is zero. Thus \(R\) is independent of \(Y\). Its mean is zero, and expanding its covariance gives

\[
\begin{aligned}
\operatorname{Cov}(R)
&=\Sigma_{XX}-2\Sigma_{XY}\Sigma_{YY}^{-1}\Sigma_{YX}
  +\Sigma_{XY}\Sigma_{YY}^{-1}\Sigma_{YY}\Sigma_{YY}^{-1}\Sigma_{YX}\\
&=\Sigma_{XX}-\Sigma_{XY}\Sigma_{YY}^{-1}\Sigma_{YX}.
\end{aligned}
\]

Finally, rewrite

\[
X=\mu_X+\Sigma_{XY}\Sigma_{YY}^{-1}(Y-\mu_Y)+R.
\]

Conditioning on \(Y=y\) fixes the first two terms and leaves the distribution of \(R\) unchanged by independence. Consequently, the conditional distribution is a constant shift of a Gaussian residual, proving both the displayed formula and why the distribution remains Gaussian. This formula specifies a regular conditional distribution, so it does not require the event \(Y=y\) to have positive probability.

The conditional mean depends affinely on the observation \(y\), while the conditional covariance does not depend on its value. The covariance is the Schur complement of \(\Sigma_{YY}\); the subtracted matrix is positive semidefinite, so observing \(Y\) cannot increase the variance of any linear combination of \(X\). If \(\Sigma_{XY}=0\), the blocks are independent and conditioning changes nothing. If the joint covariance is singular, the same derivation still applies as long as \(\Sigma_{YY}\) is invertible, and the conditional Gaussian may be degenerate.
