# Conditional Distribution of a Partitioned Multivariate Normal

## Problem

Let a random vector be jointly multivariate normal and split into two blocks. Derive the law of one block given the other, and explain why that conditional distribution is Gaussian.

## Setup

Partition \(\mathbf{X}\in\mathbb{R}^{d}\) as
\[
\mathbf{X}
=
\begin{pmatrix}
\mathbf{X}_1 \\
\mathbf{X}_2
\end{pmatrix},
\qquad
\mathbf{X}_1\in\mathbb{R}^{d_1},\ 
\mathbf{X}_2\in\mathbb{R}^{d_2},
\]
with \(d_1+d_2=d\) and
\[
\mathbf{X}
\sim
\mathcal{N}(\boldsymbol{\mu},\boldsymbol{\Sigma}),
\qquad
\boldsymbol{\mu}
=
\begin{pmatrix}
\boldsymbol{\mu}_1 \\
\boldsymbol{\mu}_2
\end{pmatrix},
\qquad
\boldsymbol{\Sigma}
=
\begin{pmatrix}
\boldsymbol{\Sigma}_{11} & \boldsymbol{\Sigma}_{12} \\
\boldsymbol{\Sigma}_{21} & \boldsymbol{\Sigma}_{22}
\end{pmatrix}.
\]
Assume \(\boldsymbol{\Sigma}\) is positive definite. Then \(\boldsymbol{\Sigma}_{22}\) is invertible and \(\boldsymbol{\Sigma}_{21}=\boldsymbol{\Sigma}_{12}^{\top}\).

## Derivation

Set \(\mathbf{A}=\boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}\) and define the residual
\[
\mathbf{R}
=
\mathbf{X}_1-\mathbf{A}\mathbf{X}_2.
\]
Linearity keeps \((\mathbf{R},\mathbf{X}_2)\) jointly normal, because it is an affine image of \(\mathbf{X}\). The cross-covariance vanishes:
\begin{align*}
\operatorname{Cov}(\mathbf{R},\mathbf{X}_2)
&=
\operatorname{Cov}(\mathbf{X}_1,\mathbf{X}_2)
-
\mathbf{A}\operatorname{Cov}(\mathbf{X}_2,\mathbf{X}_2) \\
&=
\boldsymbol{\Sigma}_{12}
-
\boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}\boldsymbol{\Sigma}_{22}
=
\mathbf{0}.
\end{align*}
Jointly normal random vectors with zero cross-covariance are independent, so \(\mathbf{R}\) is independent of \(\mathbf{X}_2\). Rearrangement gives the regression identity
\[
\mathbf{X}_1
=
\mathbf{R}
+
\boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}\mathbf{X}_2.
\]
Conditioning on \(\mathbf{X}_2=\mathbf{x}_2\) replaces \(\mathbf{X}_2\) by the constant \(\mathbf{x}_2\) and leaves the law of \(\mathbf{R}\) unchanged:
\[
\mathbf{X}_1\mid\mathbf{X}_2=\mathbf{x}_2
\;\stackrel{d}{=}\;
\mathbf{R}
+
\boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}\mathbf{x}_2.
\]

The moments of \(\mathbf{R}\) are
\begin{align*}
\mathbb{E}[\mathbf{R}]
&=
\boldsymbol{\mu}_1-\boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}\boldsymbol{\mu}_2, \\[4pt]
\operatorname{Cov}(\mathbf{R})
&=
\boldsymbol{\Sigma}_{11}
-
\mathbf{A}\boldsymbol{\Sigma}_{21}
-
\boldsymbol{\Sigma}_{12}\mathbf{A}^{\top}
+
\mathbf{A}\boldsymbol{\Sigma}_{22}\mathbf{A}^{\top}.
\end{align*}
Substituting \(\mathbf{A}=\boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}\) makes the last three terms equal the same matrix, so
\[
\operatorname{Cov}(\mathbf{R})
=
\boldsymbol{\Sigma}_{11}
-
\boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}\boldsymbol{\Sigma}_{21}.
\]
This is the Schur complement of \(\boldsymbol{\Sigma}_{22}\) in \(\boldsymbol{\Sigma}\). Shifting by the observed block produces the conditional parameters
\begin{align*}
\boldsymbol{\mu}_{1\mid 2}
&=
\boldsymbol{\mu}_1
+
\boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}(\mathbf{x}_2-\boldsymbol{\mu}_2), \\[4pt]
\boldsymbol{\Sigma}_{1\mid 2}
&=
\boldsymbol{\Sigma}_{11}
-
\boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}\boldsymbol{\Sigma}_{21}.
\end{align*}
The conditional covariance does not depend on \(\mathbf{x}_2\). Only the mean moves, and it moves as an affine function of the observation.

## Why the conditional law is Gaussian

\(\mathbf{R}\) is an affine image of the jointly normal vector \(\mathbf{X}\), so \(\mathbf{R}\) is normal. Independence of \(\mathbf{R}\) and \(\mathbf{X}_2\) means that the conditional law of \(\mathbf{R}\) given \(\mathbf{X}_2=\mathbf{x}_2\) is still \(\mathcal{N}(\mathbb{E}[\mathbf{R}],\operatorname{Cov}(\mathbf{R}))\). Adding the constant \(\boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}\mathbf{x}_2\) preserves normality. Therefore
\[
\mathbf{X}_1\mid\mathbf{X}_2=\mathbf{x}_2
\sim
\mathcal{N}(\boldsymbol{\mu}_{1\mid 2},\boldsymbol{\Sigma}_{1\mid 2}).
\]

The same conclusion is visible in the density. The joint density has kernel
\[
\exp\Bigl(
-\tfrac12
(\mathbf{x}-\boldsymbol{\mu})^{\top}
\boldsymbol{\Sigma}^{-1}
(\mathbf{x}-\boldsymbol{\mu})
\Bigr).
\]
The block inverse of \(\boldsymbol{\Sigma}\) splits this quadratic form into a piece that depends only on \(\mathbf{x}_2\) and the piece
\[
(\mathbf{x}_1-\boldsymbol{\mu}_{1\mid 2})^{\top}
\boldsymbol{\Sigma}_{1\mid 2}^{-1}
(\mathbf{x}_1-\boldsymbol{\mu}_{1\mid 2}).
\]
The marginal density of \(\mathbf{X}_2\) cancels the \(\mathbf{x}_2\)-only factor. What remains is the density of \(\mathcal{N}(\boldsymbol{\mu}_{1\mid 2},\boldsymbol{\Sigma}_{1\mid 2})\).

Joint normality is what closes the argument: it turns the uncorrelated pair \((\mathbf{R},\mathbf{X}_2)\) into an independent pair, and it keeps every affine image inside the Gaussian family. The conditional distribution of a subvector is then Gaussian, with a covariance fixed by the Schur complement and a mean that is linear in the conditioned value.

## Result

\[
\mathbf{X}_1\mid\mathbf{X}_2=\mathbf{x}_2
\sim
\mathcal{N}\!\left(
\boldsymbol{\mu}_1
+
\boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}(\mathbf{x}_2-\boldsymbol{\mu}_2),\;
\boldsymbol{\Sigma}_{11}
-
\boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}\boldsymbol{\Sigma}_{21}
\right).
\]
Exchanging the block indices gives \(\mathbf{X}_2\mid\mathbf{X}_1\). If \(\boldsymbol{\Sigma}_{22}\) is only positive semidefinite, the same formulae hold on the support of \(\mathbf{X}_2\) after \(\boldsymbol{\Sigma}_{22}^{-1}\) is replaced by a generalized inverse.
