# Conditional distribution of a partitioned multivariate normal

Let a random vector with a nonsingular normal distribution be split into two blocks. The problem is to derive the distribution of the first block when the second block is held fixed, and to explain why that conditional distribution is still normal. Part (iii) of Theorem 2 is the nonsingular case of T. W. Anderson, *An Introduction to Multivariate Statistical Analysis*, 3rd ed., Wiley, 2003, Theorem 2.5.1. The arguments below are self-contained.

**Definition.** Let $d$ be a positive integer, let $\mu\in\mathbb{R}^d$, and let $\Sigma$ be a $d\times d$ symmetric positive definite matrix. The nonsingular normal distribution $\mathcal{N}(\mu,\Sigma)$ is the probability measure on $\mathbb{R}^d$ with Lebesgue density
$$
(2\pi)^{-d/2}(\det\Sigma)^{-1/2}\exp\bigl(-\tfrac12(x-\mu)^\top\Sigma^{-1}(x-\mu)\bigr),
\qquad x\in\mathbb{R}^d.
$$

Let $p$ and $q$ be positive integers, and let $X$ be a random vector in $\mathbb{R}^{p+q}$ partitioned as
$$
X=\begin{pmatrix} X_1 \\ X_2 \end{pmatrix},
$$
where $X_1$ takes values in $\mathbb{R}^p$ and $X_2$ takes values in $\mathbb{R}^q$. Let its mean $\mu$ and covariance $\Sigma$ be partitioned in the same way,
$$
\mu=\begin{pmatrix} \mu_1 \\ \mu_2 \end{pmatrix},
\qquad
\Sigma=\begin{pmatrix} \Sigma_{11} & \Sigma_{12} \\ \Sigma_{12}^\top & \Sigma_{22} \end{pmatrix},
$$
where $\mu_1\in\mathbb{R}^p$, $\mu_2\in\mathbb{R}^q$, $\Sigma_{11}$ is $p\times p$, and $\Sigma_{22}$ is $q\times q$. Assume $X\sim\mathcal{N}(\mu,\Sigma)$. Write $f_X(x_1,x_2)$ for the joint density of $X$ at $(x_1,x_2)$. The marginal density of $X_2$ at $x_2$ is $\int_{\mathbb{R}^p} f_X(x_1,x_2)\,dx_1$. Wherever that marginal density is positive, the conditional distribution of $X_1$ given $X_2=x_2$ is the probability measure on $\mathbb{R}^p$ whose density is the joint density divided by the marginal density.

**Lemma 1.** The block $\Sigma_{22}$ is symmetric positive definite.

**Proof.** Symmetry of $\Sigma_{22}$ is the symmetry of the corresponding block of $\Sigma$. For every $w\in\mathbb{R}^q\setminus\{0\}$, the vector in $\mathbb{R}^{p+q}$ with first $p$ coordinates equal to $0$ and last $q$ coordinates equal to $w$ gives
$$
w^\top\Sigma_{22}w
=
\begin{pmatrix} 0 \\ w \end{pmatrix}^\top
\Sigma
\begin{pmatrix} 0 \\ w \end{pmatrix}
>0,
$$
because $\Sigma$ is positive definite. $\square$

**Theorem 2.** Define the Schur complement
$$
S=\Sigma_{11}-\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top.
$$
(i) $S$ is symmetric positive definite. (ii) $X_2\sim\mathcal{N}(\mu_2,\Sigma_{22})$, so the marginal density of $X_2$ is positive at every point of $\mathbb{R}^q$. (iii) For every $x_2\in\mathbb{R}^q$, the conditional distribution of $X_1$ given $X_2=x_2$ is
$$
\mathcal{N}\bigl(\mu_1+\Sigma_{12}\Sigma_{22}^{-1}(x_2-\mu_2),\, S\bigr).
$$
In particular, that conditional distribution is Gaussian. Part (iii) is Anderson's Theorem 2.5.1 in the nonsingular case.

**Proof.** Lemma 1 provides $\Sigma_{22}^{-1}$. Throughout the proof, write $B=\Sigma_{12}\Sigma_{22}^{-1}$. Then $B^\top=\Sigma_{22}^{-1}\Sigma_{12}^\top$ and $S=\Sigma_{11}-\Sigma_{12}B^\top$. The product $\Sigma_{12}B^\top=\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top$ is symmetric, so $S$ is symmetric.

To see that $S$ is positive definite, take $a\in\mathbb{R}^p\setminus\{0\}$ and set $c=-B^\top a$. Then $\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{12}^\top=\Sigma_{11}-S$, so $\Sigma_{12}c=-(\Sigma_{11}-S)a$. Also $B\Sigma_{22}=\Sigma_{12}$, and therefore
$$
c^\top\Sigma_{22}c=a^\top B\Sigma_{22}B^\top a=a^\top(\Sigma_{11}-S)a.
$$
Expanding the quadratic form gives
$$
\begin{pmatrix} a \\ c \end{pmatrix}^\top
\Sigma
\begin{pmatrix} a \\ c \end{pmatrix}
=
a^\top\Sigma_{11}a+2a^\top\Sigma_{12}c+c^\top\Sigma_{22}c
=
a^\top\Sigma_{11}a-a^\top(\Sigma_{11}-S)a
=
a^\top Sa.
$$
The stacked vector is nonzero because $a$ is nonzero, so the left side is positive. Hence $S$ is positive definite, which is (i).

Let $I_p$ and $I_q$ denote the identity matrices of orders $p$ and $q$, and set
$$
L=\begin{pmatrix} I_p & -B \\ 0 & I_q \end{pmatrix},
\qquad
M=\begin{pmatrix} I_p & 0 \\ -B^\top & I_q \end{pmatrix}.
$$
Block multiplication and the identities $B\Sigma_{22}=\Sigma_{12}$ and $\Sigma_{22}B^\top=\Sigma_{12}^\top$ give
$$
\Sigma M
=
\begin{pmatrix} \Sigma_{11}-\Sigma_{12}B^\top & \Sigma_{12} \\ \Sigma_{12}^\top-\Sigma_{22}B^\top & \Sigma_{22} \end{pmatrix}
=
\begin{pmatrix} S & \Sigma_{12} \\ 0 & \Sigma_{22} \end{pmatrix}
$$
and
$$
L\Sigma M
=
\begin{pmatrix} S & \Sigma_{12}-B\Sigma_{22} \\ 0 & \Sigma_{22} \end{pmatrix}
=
\begin{pmatrix} S & 0 \\ 0 & \Sigma_{22} \end{pmatrix}.
$$
The matrices $L$ and $M$ are block triangular with determinant $1$, so
$$
\det\Sigma=\det(S)\det(\Sigma_{22}). \qquad (1)
$$
Inverting $L\Sigma M=\operatorname{diag}(S,\Sigma_{22})$ gives $\Sigma^{-1}=M\operatorname{diag}(S^{-1},\Sigma_{22}^{-1})L$. A further block multiplication produces
$$
\Sigma^{-1}
=
\begin{pmatrix}
S^{-1} & -S^{-1}B \\
-B^\top S^{-1} & B^\top S^{-1}B+\Sigma_{22}^{-1}
\end{pmatrix}.
$$
Write $m(x_2)=\mu_1+B(x_2-\mu_2)$. For an arbitrary point $(x_1,x_2)$, abbreviate its centered coordinates by $u=x_1-\mu_1$ and $v=x_2-\mu_2$ in the expansion that follows. The quadratic form in the joint density then expands as
$$
\begin{pmatrix} u \\ v \end{pmatrix}^\top
\Sigma^{-1}
\begin{pmatrix} u \\ v \end{pmatrix}
=
u^\top S^{-1}u-2u^\top S^{-1}Bv+v^\top B^\top S^{-1}Bv+v^\top\Sigma_{22}^{-1}v
=
(u-Bv)^\top S^{-1}(u-Bv)+v^\top\Sigma_{22}^{-1}v.
$$
Restoring the centered coordinates and using $u-Bv=x_1-m(x_2)$ gives, for every $x_1\in\mathbb{R}^p$ and every $x_2\in\mathbb{R}^q$,
$$
\begin{pmatrix} x_1-\mu_1 \\ x_2-\mu_2 \end{pmatrix}^\top
\Sigma^{-1}
\begin{pmatrix} x_1-\mu_1 \\ x_2-\mu_2 \end{pmatrix}
=
(x_1-m(x_2))^\top S^{-1}(x_1-m(x_2))
+(x_2-\mu_2)^\top\Sigma_{22}^{-1}(x_2-\mu_2).
\qquad (2)
$$
Therefore
$$
f_X(x_1,x_2)
=
(2\pi)^{-(p+q)/2}(\det\Sigma)^{-1/2}
\exp\bigl(
-\tfrac12(x_1-m(x_2))^\top S^{-1}(x_1-m(x_2))
-\tfrac12(x_2-\mu_2)^\top\Sigma_{22}^{-1}(x_2-\mu_2)
\bigr).
$$

Translation does not change Lebesgue measure on $\mathbb{R}^p$. By the definition of $\mathcal{N}(0,S)$, that density integrates to $1$, so
$$
\int_{\mathbb{R}^p}
\exp\bigl(-\tfrac12(x_1-m(x_2))^\top S^{-1}(x_1-m(x_2))\bigr)\,dx_1
=
(2\pi)^{p/2}(\det S)^{1/2}.
$$
Integrating the joint density in $x_1$ and applying (1) shows that the marginal density of $X_2$ is
$$
f_{X_2}(x_2)
=
(2\pi)^{-q/2}(\det\Sigma_{22})^{-1/2}
\exp\bigl(-\tfrac12(x_2-\mu_2)^\top\Sigma_{22}^{-1}(x_2-\mu_2)\bigr).
$$
This is the $\mathcal{N}(\mu_2,\Sigma_{22})$ density, which proves (ii). It is positive at every $x_2\in\mathbb{R}^q$.

The conditional density is the ratio $f_X(x_1,x_2)/f_{X_2}(x_2)$. The factor depending only on $x_2$ cancels. The ratio of the constant prefactors is
$$
\frac{(2\pi)^{-(p+q)/2}(\det\Sigma)^{-1/2}}{(2\pi)^{-q/2}(\det\Sigma_{22})^{-1/2}}
=
(2\pi)^{-p/2}(\det S)^{-1/2}
$$
by (1), and the conditional density equals
$$
(2\pi)^{-p/2}(\det S)^{-1/2}
\exp\bigl(-\tfrac12(x_1-m(x_2))^\top S^{-1}(x_1-m(x_2))\bigr).
$$
By the definition of the nonsingular normal law, this is the density of $\mathcal{N}(m(x_2),S)$. Since $B=\Sigma_{12}\Sigma_{22}^{-1}$, the mean $m(x_2)$ is the mean in (iii). The conditional distribution therefore coincides with a nonsingular normal distribution, so it is Gaussian. $\square$

**Corollary 3.** Let $S$ be the Schur complement in Theorem 2, and define the residual
$$
R=X_1-\mu_1-\Sigma_{12}\Sigma_{22}^{-1}(X_2-\mu_2).
$$
Then $R\sim\mathcal{N}(0,S)$ and $R$ is independent of $X_2$. For every $x_2\in\mathbb{R}^q$, the conditional distribution of $X_1$ given $X_2=x_2$ is the law of
$$
R+\mu_1+\Sigma_{12}\Sigma_{22}^{-1}(x_2-\mu_2).
$$

**Proof.** Let $B=\Sigma_{12}\Sigma_{22}^{-1}$ and $m(x_2)=\mu_1+B(x_2-\mu_2)$, as in the proof of Theorem 2, so $R=X_1-m(X_2)$. The map $(x_1,x_2)\mapsto(x_1-m(x_2),\, x_2)$ has Jacobian determinant $1$. Substitute (2) and (1) into $f_X$. At a point $(r,x_2)$, the joint density of $(R,X_2)$ equals
$$
(2\pi)^{-p/2}(\det S)^{-1/2}\exp\bigl(-\tfrac12 r^\top S^{-1}r\bigr)
\cdot
f_{X_2}(x_2),
$$
where $f_{X_2}$ is the marginal density derived in the proof of Theorem 2. The first factor is the density of $\mathcal{N}(0,S)$. Call it $g(r)$. Both $g$ and $f_{X_2}$ integrate to $1$, and the joint density is $g(r)f_{X_2}(x_2)$. Integrating out $x_2$ shows that $R$ has density $g$, and integrating out $r$ recovers $f_{X_2}$. Thus $R\sim\mathcal{N}(0,S)$, $f_{X_2}$ is the marginal density of $X_2$, and the joint density is the product of the marginal densities, so $R$ is independent of $X_2$.

The conditional density of $R$ given $X_2=x_2$ is therefore $g(r)$ for every $x_2\in\mathbb{R}^q$. Equivalently, $X_1=R+m(X_2)$. Fix $x_2$ and let $R_0\sim\mathcal{N}(0,S)$. Independence says that the conditional law of $R$ given $X_2=x_2$ is the law of $R_0$, so the conditional law of $X_1$ given $X_2=x_2$ is the law of $R_0+m(x_2)$. The density of $R_0+m(x_2)$ is $g(x_1-m(x_2))$, which is the $\mathcal{N}(m(x_2),S)$ density and agrees with the conditional density in the proof of Theorem 2. $\square$

**Remarks.** Theorem 2 derives the conditional law by dividing the joint normal density by the marginal normal density of $X_2$. After the quadratic form is split as in (2), the conditional density in the free variable $x_1$ is a normal kernel whose precision $S^{-1}$ is free of $x_2$, while $x_2$ enters only through the mean. Corollary 3 gives the matching probabilistic picture: $R$ is a normal vector independent of $X_2$, and fixing $X_2=x_2$ translates $R$ by $\mu_1+\Sigma_{12}\Sigma_{22}^{-1}(x_2-\mu_2)$. A translate of a nonsingular normal vector is nonsingular normal, with the same covariance $S$.

The derivation uses a positive definite covariance, which gives $X$ a Lebesgue density on $\mathbb{R}^{p+q}$ and makes the conditional covariance $S$ positive definite. Those are the hypotheses of the nonsingular statement in Anderson's Theorem 2.5.1.
