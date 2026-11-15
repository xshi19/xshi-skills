# Conditional distribution of a partitioned multivariate normal

## Problem

Let \(\mathbf{X}\) be a random vector in \(\mathbb{R}^{p+q}\) with a nondegenerate multivariate normal distribution, partitioned as

\[
\mathbf{X}
=
\begin{pmatrix} \mathbf{X}_1 \\ \mathbf{X}_2 \end{pmatrix}
\sim
\mathcal{N}_{p+q}\!\left(
\begin{pmatrix} \boldsymbol{\mu}_1 \\ \boldsymbol{\mu}_2 \end{pmatrix},
\begin{pmatrix}
\boldsymbol{\Sigma}_{11} & \boldsymbol{\Sigma}_{12} \\
\boldsymbol{\Sigma}_{21} & \boldsymbol{\Sigma}_{22}
\end{pmatrix}
\right),
\]

where \(\mathbf{X}_1\in\mathbb{R}^p\), \(\mathbf{X}_2\in\mathbb{R}^q\), \(\boldsymbol{\Sigma}_{21}=\boldsymbol{\Sigma}_{12}^{\top}\), and the covariance \(\boldsymbol{\Sigma}\) is positive definite. The task is to derive the conditional law of \(\mathbf{X}_1\) given \(\mathbf{X}_2=\mathbf{x}_2\), and to explain why that law is Gaussian.

## Joint density and completion of the square

Let \(\boldsymbol{\Lambda}=\boldsymbol{\Sigma}^{-1}\) be the precision matrix, partitioned into blocks \(\boldsymbol{\Lambda}_{ij}\) of the same sizes, and write \(\mathbf{y}_i=\mathbf{x}_i-\boldsymbol{\mu}_i\). The joint density is

\[
f(\mathbf{x}_1,\mathbf{x}_2)
=
(2\pi)^{-(p+q)/2}\,|\boldsymbol{\Sigma}|^{-1/2}
\exp\!\left(-\tfrac12 Q\right),
\]

where the quadratic form in the exponent is

\[
Q
=
\mathbf{y}_1^{\top}\boldsymbol{\Lambda}_{11}\mathbf{y}_1
+ 2\mathbf{y}_1^{\top}\boldsymbol{\Lambda}_{12}\mathbf{y}_2
+ \mathbf{y}_2^{\top}\boldsymbol{\Lambda}_{22}\mathbf{y}_2.
\]

Positive definiteness of \(\boldsymbol{\Sigma}\) implies that the diagonal block \(\boldsymbol{\Lambda}_{11}\) is positive definite, so the square in \(\mathbf{y}_1\) can be completed:

\begin{align*}
Q
&=
\bigl(\mathbf{y}_1+\boldsymbol{\Lambda}_{11}^{-1}\boldsymbol{\Lambda}_{12}\mathbf{y}_2\bigr)^{\top}
\boldsymbol{\Lambda}_{11}
\bigl(\mathbf{y}_1+\boldsymbol{\Lambda}_{11}^{-1}\boldsymbol{\Lambda}_{12}\mathbf{y}_2\bigr) \\
&\qquad
+ \mathbf{y}_2^{\top}
\bigl(\boldsymbol{\Lambda}_{22}-\boldsymbol{\Lambda}_{21}\boldsymbol{\Lambda}_{11}^{-1}\boldsymbol{\Lambda}_{12}\bigr)
\mathbf{y}_2.
\end{align*}

The second term does not depend on \(\mathbf{x}_1\). Integrating the joint density over \(\mathbf{x}_1\) is a Gaussian integral. It contributes the factor \((2\pi)^{p/2}|\boldsymbol{\Lambda}_{11}|^{-1/2}\) and leaves a density in \(\mathbf{x}_2\) whose logarithm is quadratic, so the marginal is Gaussian:

\[
\mathbf{X}_2\sim\mathcal{N}_q(\boldsymbol{\mu}_2,\boldsymbol{\Sigma}_{22}).
\]

## The conditional law

The conditional density is the ratio \(f(\mathbf{x}_1,\mathbf{x}_2)/f(\mathbf{x}_2)\). Every factor independent of \(\mathbf{x}_1\) cancels, and the remaining exponent is the completed square in \(\mathbf{y}_1\). Therefore

\[
f(\mathbf{x}_1\mid\mathbf{x}_2)
=
(2\pi)^{-p/2}\,|\boldsymbol{\Lambda}_{11}|^{1/2}
\exp\!\left(
-\tfrac12
\bigl(\mathbf{y}_1+\boldsymbol{\Lambda}_{11}^{-1}\boldsymbol{\Lambda}_{12}\mathbf{y}_2\bigr)^{\top}
\boldsymbol{\Lambda}_{11}
\bigl(\mathbf{y}_1+\boldsymbol{\Lambda}_{11}^{-1}\boldsymbol{\Lambda}_{12}\mathbf{y}_2\bigr)
\right).
\]

This is the density of

\[
\mathcal{N}_p\!\bigl(
\boldsymbol{\mu}_1-\boldsymbol{\Lambda}_{11}^{-1}\boldsymbol{\Lambda}_{12}(\mathbf{x}_2-\boldsymbol{\mu}_2),\;
\boldsymbol{\Lambda}_{11}^{-1}
\bigr).
\]

The block-inverse identities

\[
\boldsymbol{\Lambda}_{11}
=
\bigl(\boldsymbol{\Sigma}_{11}-\boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}\boldsymbol{\Sigma}_{21}\bigr)^{-1},
\qquad
\boldsymbol{\Lambda}_{12}
=
-\boldsymbol{\Lambda}_{11}\boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}
\]

convert the conditional parameters from the precision metric back to the covariance metric:

\begin{align*}
\boldsymbol{\mu}_{1\mid 2}
&=
\boldsymbol{\mu}_1+\boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}(\mathbf{x}_2-\boldsymbol{\mu}_2), \\
\boldsymbol{\Sigma}_{1\mid 2}
&=
\boldsymbol{\Sigma}_{11}-\boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}\boldsymbol{\Sigma}_{21}.
\end{align*}

The conditional covariance is the Schur complement of \(\boldsymbol{\Sigma}_{22}\) in \(\boldsymbol{\Sigma}\). It is positive definite, and it does not depend on the conditioning value \(\mathbf{x}_2\).

## Why the conditional distribution is Gaussian

The conditional law stays Gaussian for two equivalent reasons.

**Conditioning preserves a quadratic log-density.** The logarithm of a nondegenerate normal density is a polynomial of degree 2. The marginal density of \(\mathbf{X}_2\) has the same form, because the integral that removes \(\mathbf{x}_1\) only changes the quadratic form by the Schur complement above. Forming the conditional density subtracts \(\log f(\mathbf{x}_2)\) from \(\log f(\mathbf{x}_1,\mathbf{x}_2)\). With \(\mathbf{x}_2\) held fixed, the difference is a quadratic polynomial in \(\mathbf{x}_1\). A positive density on \(\mathbb{R}^p\) with quadratic logarithm is a nondegenerate normal density. Matching the completed square identifies its mean and covariance as \(\boldsymbol{\mu}_{1\mid 2}\) and \(\boldsymbol{\Sigma}_{1\mid 2}\).

**The regression residual is an independent normal vector.** Define

\[
\mathbf{Z}
=
\mathbf{X}_1-\boldsymbol{\mu}_1-\boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}(\mathbf{X}_2-\boldsymbol{\mu}_2).
\]

Linear images of multivariate normal vectors are multivariate normal, so \((\mathbf{Z},\mathbf{X}_2)\) is jointly normal. The cross-covariance is zero:

\[
\operatorname{Cov}(\mathbf{Z},\mathbf{X}_2)
=
\boldsymbol{\Sigma}_{12}-\boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}\boldsymbol{\Sigma}_{22}
=
\mathbf{0}.
\]

Jointly normal random vectors with zero cross-covariance are independent, and

\[
\mathbf{Z}
\sim
\mathcal{N}_p\!\bigl(\mathbf{0},\,\boldsymbol{\Sigma}_{11}-\boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}\boldsymbol{\Sigma}_{21}\bigr).
\]

Conditioning on \(\mathbf{X}_2=\mathbf{x}_2\) replaces the regression term by a constant, so

\[
\mathbf{X}_1\mid\mathbf{X}_2=\mathbf{x}_2
\;\stackrel{d}{=}\;
\boldsymbol{\mu}_{1\mid 2}+\mathbf{Z}.
\]

Adding a constant to a normal vector leaves a normal vector, with the same covariance as \(\mathbf{Z}\). Independence of the residual from \(\mathbf{X}_2\) is why that covariance does not depend on \(\mathbf{x}_2\).

## Result

\[
\mathbf{X}_1\mid\mathbf{X}_2=\mathbf{x}_2
\sim
\mathcal{N}_p\!\bigl(
\boldsymbol{\mu}_1+\boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}(\mathbf{x}_2-\boldsymbol{\mu}_2),\;
\boldsymbol{\Sigma}_{11}-\boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}\boldsymbol{\Sigma}_{21}
\bigr).
\]

The conditional distribution is Gaussian because it is the law of an independent Gaussian residual shifted by an affine function of \(\mathbf{x}_2\). Equivalently, the conditional log-density is a quadratic polynomial in the free variable \(\mathbf{x}_1\).
