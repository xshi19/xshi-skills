# Conditional law of a partitioned multivariate normal

## Statement

Let \(\mathbf{X}_1\in\mathbb{R}^p\) and \(\mathbf{X}_2\in\mathbb{R}^q\), and write
\[
\mathbf{X}
=
\begin{pmatrix}\mathbf{X}_1\\ \mathbf{X}_2\end{pmatrix}
\sim
\mathcal{N}_{p+q}\!\left(
\boldsymbol{\mu},\Sigma
\right),
\qquad
\boldsymbol{\mu}
=
\begin{pmatrix}\boldsymbol{\mu}_1\\ \boldsymbol{\mu}_2\end{pmatrix},
\qquad
\Sigma
=
\begin{pmatrix}
\Sigma_{11}&\Sigma_{12}\\
\Sigma_{21}&\Sigma_{22}
\end{pmatrix},
\]
where \(\Sigma\) is symmetric positive definite and \(\Sigma_{21}=\Sigma_{12}^{\top}\). The claim is that, for every \(\mathbf{x}_2\in\mathbb{R}^q\),
\[
\mathbf{X}_1\mid \mathbf{X}_2=\mathbf{x}_2
\sim
\mathcal{N}_p(\boldsymbol{\mu}_{1\mid 2},\Sigma_{1\mid 2}),
\]
with conditional mean and covariance
\[
\boldsymbol{\mu}_{1\mid 2}
=
\boldsymbol{\mu}_1+\Sigma_{12}\Sigma_{22}^{-1}(\mathbf{x}_2-\boldsymbol{\mu}_2),
\qquad
\Sigma_{1\mid 2}
=
\Sigma_{11}-\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}.
\]
The conditional distribution is Gaussian because it is the law of a Gaussian residual, independent of \(\mathbf{X}_2\), translated by the affine function \(\boldsymbol{\mu}_{1\mid 2}\) of the observed value \(\mathbf{x}_2\).

## Proof

Positive definiteness of \(\Sigma\) implies that the principal submatrix \(\Sigma_{22}\) is positive definite, so \(\Sigma_{22}^{-1}\) exists. Set
\[
A=\Sigma_{12}\Sigma_{22}^{-1}
\]
and define the residual
\[
\mathbf{Z}
=
(\mathbf{X}_1-\boldsymbol{\mu}_1)-A(\mathbf{X}_2-\boldsymbol{\mu}_2).
\]
Then
\[
\begin{pmatrix}\mathbf{Z}\\ \mathbf{X}_2-\boldsymbol{\mu}_2\end{pmatrix}
=
\begin{pmatrix}I_p&-A\\ 0&I_q\end{pmatrix}
\begin{pmatrix}\mathbf{X}_1-\boldsymbol{\mu}_1\\ \mathbf{X}_2-\boldsymbol{\mu}_2\end{pmatrix}.
\]
The right-hand side is a linear image of a centered multivariate normal vector, so \((\mathbf{Z},\mathbf{X}_2)\) is jointly normal and \(\mathbb{E}[\mathbf{Z}]=\mathbf{0}\). Its cross-covariance is
\begin{align*}
\operatorname{Cov}(\mathbf{Z},\mathbf{X}_2)
&=
\operatorname{Cov}(\mathbf{X}_1-A\mathbf{X}_2,\mathbf{X}_2)
=
\Sigma_{12}-A\Sigma_{22}
=
\Sigma_{12}-\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{22}
=
0.
\end{align*}
The joint characteristic function of the centered pair \((\mathbf{Z},\mathbf{X}_2-\boldsymbol{\mu}_2)\) is therefore
\[
\exp\!\Bigl(-\tfrac12 \mathbf{t}_1^{\top}\operatorname{Cov}(\mathbf{Z})\,\mathbf{t}_1\Bigr)
\,
\exp\!\Bigl(-\tfrac12 \mathbf{t}_2^{\top}\Sigma_{22}\,\mathbf{t}_2\Bigr),
\]
which is the product of the marginal characteristic functions. Hence \(\mathbf{Z}\) is independent of \(\mathbf{X}_2\), and the marginal law of \(\mathbf{Z}\) is multivariate normal.

Rearrangement gives the identity
\[
\mathbf{X}_1
=
\boldsymbol{\mu}_1+A(\mathbf{X}_2-\boldsymbol{\mu}_2)+\mathbf{Z}.
\]
Conditioning on \(\mathbf{X}_2=\mathbf{x}_2\) replaces \(\mathbf{X}_2\) by the constant \(\mathbf{x}_2\) and leaves the law of \(\mathbf{Z}\) unchanged. The conditional distribution is the law of
\[
\boldsymbol{\mu}_{1\mid 2}+\mathbf{Z},
\qquad
\boldsymbol{\mu}_{1\mid 2}
=
\boldsymbol{\mu}_1+A(\mathbf{x}_2-\boldsymbol{\mu}_2),
\]
which is \(\mathcal{N}_p(\boldsymbol{\mu}_{1\mid 2},\operatorname{Cov}(\mathbf{Z}))\).

The residual covariance is the Schur complement of \(\Sigma_{22}\) in \(\Sigma\). Expanding it and using \(A\Sigma_{22}A^{\top}=\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}\) yields
\begin{align*}
\operatorname{Cov}(\mathbf{Z})
&=
\operatorname{Cov}(\mathbf{X}_1-A\mathbf{X}_2)\\
&=
\Sigma_{11}-\Sigma_{12}A^{\top}-A\Sigma_{21}+A\Sigma_{22}A^{\top}\\
&=
\Sigma_{11}-\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}
=
\Sigma_{1\mid 2}.
\end{align*}
For every \(\mathbf{v}\neq\mathbf{0}\),
\[
\begin{pmatrix}\mathbf{v}\\ -A^{\top}\mathbf{v}\end{pmatrix}^{\!\top}
\Sigma
\begin{pmatrix}\mathbf{v}\\ -A^{\top}\mathbf{v}\end{pmatrix}
=
\mathbf{v}^{\top}\Sigma_{1\mid 2}\mathbf{v}
>0,
\]
so \(\Sigma_{1\mid 2}\) is positive definite. Therefore
\[
\mathbf{X}_1\mid\mathbf{X}_2=\mathbf{x}_2
\sim
\mathcal{N}_p(\boldsymbol{\mu}_{1\mid 2},\Sigma_{1\mid 2}).
\]

Gaussianity is inherited from the joint law. The residual \(\mathbf{Z}\) is a linear image of the jointly normal vector \(\mathbf{X}\), so \(\mathbf{Z}\) is normal. Independence of \(\mathbf{Z}\) and \(\mathbf{X}_2\) means that the conditional law given \(\mathbf{X}_2=\mathbf{x}_2\) is a translate of the law of \(\mathbf{Z}\) by \(\boldsymbol{\mu}_{1\mid 2}\). Translation preserves the Gaussian family, and the conditional covariance \(\Sigma_{1\mid 2}\) does not depend on \(\mathbf{x}_2\).
