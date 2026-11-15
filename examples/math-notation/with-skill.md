Let $X$ and $Y$ be real-valued random variables with $\mathbb{E}|X|<\infty$ and $\mathbb{E}|Y|<\infty$. Without loss of generality, assume $\mathbb{E}[X]\le\mathbb{E}[Y]$, since exchanging the names of $X$ and $Y$ preserves absolute integrability and the inequality below. It remains to show $\mathbb{E}[Y]-\mathbb{E}[X]\le|\mathbb{E}[X]|+|\mathbb{E}[Y]|$. The triangle inequality yields this bound, and therefore
$$
|\mathbb{E}[X]-\mathbb{E}[Y]|=\mathbb{E}[Y]-\mathbb{E}[X]\le|\mathbb{E}[X]|+|\mathbb{E}[Y]|\le\mathbb{E}|X|+\mathbb{E}|Y|.
$$

Separately, let $x_1,\ldots,x_n$ be a nonconstant real sample. Compute its original mean $\bar x$ and standard deviation $s>0$. Standardize $x_i\leftarrow(x_i-\bar x)/s$ for all $i$; from here on $x_i$ denotes the standardized value. Then
$$
\frac{1}{n}\sum_{i=1}^n x_i=0.
$$
