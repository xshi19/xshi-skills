Conditioning one block of a jointly multivariate normal vector on another gives a Gaussian distribution. The conditional mean is an affine function of the observed block, and the conditional covariance does not depend on the observed value.

Let \(X\in\mathbb R^p\) and \(Y\in\mathbb R^q\) satisfy

\[
\begin{pmatrix}X\\Y\end{pmatrix}
\sim\mathcal N_{p+q}\!\left(
\begin{pmatrix}\mu_X\\\mu_Y\end{pmatrix},
\begin{pmatrix}
\Sigma_{XX}&\Sigma_{XY}\\
\Sigma_{YX}&\Sigma_{YY}
\end{pmatrix}\right),
\qquad \Sigma_{YX}=\Sigma_{XY}^{\mathsf T}.
\]

Assume the full covariance matrix is positive definite, so \(\Sigma_{YY}\) is invertible. The conditional distribution is

\[
\boxed{
X\mid Y=y\sim\mathcal N_p\!\left(
\mu_X+\Sigma_{XY}\Sigma_{YY}^{-1}(y-\mu_Y),
\Sigma_{XX}-\Sigma_{XY}\Sigma_{YY}^{-1}\Sigma_{YX}
\right).
}
\]

To derive this, remove the linear dependence of \(X\) on \(Y\). Define

\[
B=\Sigma_{XY}\Sigma_{YY}^{-1},
\qquad R=X-\mu_X-B(Y-\mu_Y).
\]

The pair \((R,Y)\) is jointly Gaussian because it is an affine transformation of \((X,Y)\): every linear combination of its coordinates is a linear combination of the original Gaussian coordinates plus a constant. Moreover,

\[
\mathbb E[R]=0,
\qquad
\operatorname{Cov}(R,Y)=\Sigma_{XY}-B\Sigma_{YY}=0,
\]

and

\[
\begin{aligned}
\operatorname{Cov}(R)
&=\Sigma_{XX}-B\Sigma_{YX}-\Sigma_{XY}B^{\mathsf T}
  +B\Sigma_{YY}B^{\mathsf T}\\
&=\Sigma_{XX}-\Sigma_{XY}\Sigma_{YY}^{-1}\Sigma_{YX}
\equiv S.
\end{aligned}
\]

For jointly Gaussian vectors, zero cross-covariance implies independence. Here the covariance of \((R,Y)\) is block diagonal, so its joint Gaussian density factors into the product of the marginal densities. Thus \(R\) is independent of \(Y\), and conditioning on \(Y=y\) leaves \(R\sim\mathcal N_p(0,S)\) unchanged.

Finally, rewrite

\[
X=\mu_X+B(Y-\mu_Y)+R.
\]

After conditioning, the first two terms become the fixed vector \(\mu_X+B(y-\mu_Y)\). Therefore the conditional distribution is a translated Gaussian residual, proving both the displayed formula and why the result is Gaussian.

The matrix \(S\) is the **Schur complement** of \(\Sigma_{YY}\) in the full covariance matrix and is positive definite under our assumption. It represents the uncertainty remaining after observing \(Y\). Since \(\Sigma_{XY}\Sigma_{YY}^{-1}\Sigma_{YX}\) is positive semidefinite, conditioning cannot increase the variance of any linear combination of \(X\). If \(\Sigma_{XY}=0\), the blocks are independent and conditioning leaves the distribution of \(X\) unchanged. These independence conclusions rely on joint Gaussianity; zero covariance alone does not imply independence for arbitrary distributions.
