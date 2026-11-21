# Conditional distribution of a partitioned multivariate normal

## Statement

Let \(X_1\in\mathbb{R}^{d_1}\) and \(X_2\in\mathbb{R}^{d_2}\) be random vectors such that
\[
X=\begin{pmatrix}X_1\\ X_2\end{pmatrix}
\]
is multivariate normal, \(X\sim\mathcal{N}(\mu,\Sigma)\), with
\[
\mu=\begin{pmatrix}\mu_1\\ \mu_2\end{pmatrix},
\qquad
\Sigma=\begin{pmatrix}
\Sigma_{11}&\Sigma_{12}\\
\Sigma_{21}&\Sigma_{22}
\end{pmatrix}.
\]
Here \(\Sigma\) is a covariance matrix, \(\Sigma_{21}=\Sigma_{12}^\top\), and \(\Sigma_{22}\) is positive definite. Define
\[
\mu_{1\mid 2}(x_2)
=
\mu_1+\Sigma_{12}\Sigma_{22}^{-1}(x_2-\mu_2)
\]
and
\[
\Sigma_{1\mid 2}
=
\Sigma_{11}-\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}.
\]
What is proved below is that, for every \(x_2\in\mathbb{R}^{d_2}\),
\[
X_1\mid X_2=x_2
\sim
\mathcal{N}\bigl(\mu_{1\mid 2}(x_2),\,\Sigma_{1\mid 2}\bigr).
\]
The conditional mean is affine in the observed value \(x_2\), and the conditional covariance \(\Sigma_{1\mid 2}\) is the same for every \(x_2\).

## Proof

Set \(A=\Sigma_{12}\Sigma_{22}^{-1}\) and
\[
R=X_1-\mu_1-A(X_2-\mu_2).
\]
The vector \((R,X_2)\) is an affine image of \(X\). Affine images of multivariate normal vectors are multivariate normal, so \((R,X_2)\) is jointly normal. The cross-covariance is
\begin{align*}
\operatorname{Cov}(R,X_2)
&=
\operatorname{Cov}(X_1,X_2)-A\operatorname{Cov}(X_2,X_2)\\
&=
\Sigma_{12}-\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{22}
=
0.
\end{align*}
The covariance of \((R,X_2)\) is therefore block diagonal. The characteristic function of a multivariate normal vector is \(\exp(iu^\top m-\tfrac12 u^\top\Gamma u)\). With a block-diagonal \(\Gamma\), this characteristic function factors into a function of the frequency for \(R\) and a function of the frequency for \(X_2\), so \(R\) and \(X_2\) are independent. The marginal \(R\) is normal, with mean zero. Its covariance equals the Schur complement of \(\Sigma_{22}\) in \(\Sigma\):
\begin{align*}
\operatorname{Cov}(R)
&=
\Sigma_{11}-A\Sigma_{21}-\Sigma_{12}A^\top+A\Sigma_{22}A^\top\\
&=
\Sigma_{11}-\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}
=
\Sigma_{1\mid 2}.
\end{align*}
The identity \(A^\top=\Sigma_{22}^{-1}\Sigma_{21}\) was used here, which holds because \(\Sigma_{22}\) is symmetric. Rearrangement gives
\[
X_1=\mu_{1\mid 2}(X_2)+R.
\]
Condition on \(X_2=x_2\). Then \(\mu_{1\mid 2}(X_2)\) becomes the constant \(\mu_{1\mid 2}(x_2)\), while independence leaves the law of \(R\) equal to \(\mathcal{N}(0,\Sigma_{1\mid 2})\). Hence
\[
X_1\mid X_2=x_2
\sim
\mathcal{N}\bigl(\mu_{1\mid 2}(x_2),\,\Sigma_{1\mid 2}\bigr).
\]

This conditional law is Gaussian because, once \(X_2=x_2\) is given, \(X_1\) equals a constant vector plus the residual \(R\), and \(R\) is Gaussian and independent of \(X_2\). That independence also shows why \(\Sigma_{1\mid 2}\) is the same for every \(x_2\): it is the covariance of \(R\) alone.
