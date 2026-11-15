The problem is to find the distribution of one part of a jointly Gaussian vector after observing the other part. Let

\[
\begin{pmatrix}X\\Y\end{pmatrix}
\sim \mathcal N_{p+q}\!\left(
\begin{pmatrix}\mu_X\\\mu_Y\end{pmatrix},
\begin{pmatrix}
\Sigma_{XX}&\Sigma_{XY}\\
\Sigma_{YX}&\Sigma_{YY}
\end{pmatrix}\right),
\]

where \(X\in\mathbb R^p\), \(Y\in\mathbb R^q\), and \(\Sigma_{XY}=\operatorname{Cov}(X,Y)=\Sigma_{YX}^{\mathsf T}\). Assume \(\Sigma_{YY}\) is positive definite, so its inverse exists.

**Proposition 1 (conditional Gaussian distribution).** For every \(y\in\mathbb R^q\), a version of the conditional distribution is

\[
\boxed{
X\mid Y=y\sim\mathcal N_p\!\left(
\mu_X+\Sigma_{XY}\Sigma_{YY}^{-1}(y-\mu_Y),
\ S\right),
\qquad
S=\Sigma_{XX}-\Sigma_{XY}\Sigma_{YY}^{-1}\Sigma_{YX}.
}
\]

This Gaussian distribution may be degenerate if the full covariance matrix is singular.

**Proof.** Set \(A=\Sigma_{XY}\Sigma_{YY}^{-1}\) and define the residual

\[
R=X-\mu_X-A(Y-\mu_Y).
\]

Every linear combination of \(R\) and \(Y-\mu_Y\) is a linear combination of the centered original Gaussian vector. Thus \((R,Y-\mu_Y)\) is jointly Gaussian with mean zero. Its covariance blocks satisfy

\[
\operatorname{Cov}(R,Y)
=\Sigma_{XY}-A\Sigma_{YY}=0,
\]

\[
\begin{aligned}
\operatorname{Cov}(R)
&=\Sigma_{XX}-A\Sigma_{YX}-\Sigma_{XY}A^{\mathsf T}
  +A\Sigma_{YY}A^{\mathsf T}\\
&=\Sigma_{XX}-\Sigma_{XY}\Sigma_{YY}^{-1}\Sigma_{YX}=S.
\end{aligned}
\]

For jointly Gaussian vectors, this zero cross covariance implies independence. Explicitly, for \(u\in\mathbb R^p\) and \(v\in\mathbb R^q\), their joint characteristic function is

\[
\mathbb E\!\left[e^{\mathrm i(u^{\mathsf T}R+v^{\mathsf T}(Y-\mu_Y))}\right]
=e^{-\frac12 u^{\mathsf T}Su}\,
 e^{-\frac12 v^{\mathsf T}\Sigma_{YY}v}.
\]

The product consists of their marginal characteristic functions, proving that \(R\) and \(Y\) are independent. Since

\[
X=\mu_X+A(Y-\mu_Y)+R,
\]

conditioning on \(Y=y\) leaves the law \(R\sim\mathcal N_p(0,S)\) unchanged and makes the other terms deterministic. A deterministic shift of a Gaussian vector is Gaussian, with the mean and covariance stated above. \(\square\)

The conditional mean adjusts \(\mu_X\) according to the observed deviation \(y-\mu_Y\) and the covariance between the blocks. The conditional covariance \(S\), called the Schur complement of \(\Sigma_{YY}\), describes the remaining uncertainty and does not depend on the observed value \(y\). The independent Gaussian residual is the reason the conditional distribution remains Gaussian; zero covariance alone would not imply independence for arbitrary distributions.

Because \(Y\) is continuous, conditioning on \(Y=y\) is understood through a regular conditional distribution, rather than a ratio of probabilities of events with positive probability.
