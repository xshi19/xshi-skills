Let $X$ and $Y$ be real-valued random variables with $\mathbb{E}|X|<\infty$ and $\mathbb{E}|Y|<\infty$. Write $\mu_X=\mathbb{E}[X]$ and $\mu_Y=\mathbb{E}[Y]$, and set $a=\mu_X$, $b=\mu_Y$. Define
$$
m=\min(a,b),\qquad M=\max(a,b),\qquad \Delta=M-m.
$$
Let $\phi(t)=\mathbf{1}\{t>0\}$. Splitting on the sign of $a-b$ gives
$$
\Delta=\phi(a-b)\,(a-b)+\phi(b-a)\,(b-a).
$$
In either case $\Delta=|a-b|$. The triangle inequality yields $\Delta\le|a|+|b|$, and therefore
$$
|\mu_X-\mu_Y|=\Delta\le|\mu_X|+|\mu_Y|\le\mathbb{E}|X|+\mathbb{E}|Y|.
$$
Exchanging the names of $X$ and $Y$ exchanges $a$ and $b$ and leaves both the hypothesis and $\Delta$ unchanged.

Separately, let $x_1,\ldots,x_n$ be a nonconstant real sample with mean $\bar x$ and standard deviation $s>0$. Define the standardized sample $z_i=(x_i-\bar x)/s$ and write $w_i=z_i$. The original values $x_i$ are not used after this display. Then
$$
\frac{1}{n}\sum_{i=1}^n w_i=0.
$$
