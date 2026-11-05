# Reductions and transformed symbols

## Without loss of generality

When symmetry, translation, scaling, reordering, or relabeling preserves the
domain and conclusion, write "Without loss of generality, assume ..." and
briefly name the invariance. Every omitted case must follow from the retained
case; never use WLOG to discard cases or change the conclusion. State the
qualifications needed to recover the general case: handle zero or degenerate
cases separately, require nonzero scales, account for signs and reversed
inequalities, and explain how to restore original units or parameters.

For real $a,b$, to prove $|a-b|\le |a|+|b|$:

> Without loss of generality, assume $a\le b$, since swapping $a,b$ preserves
> the domain and inequality. It remains to show $b-a\le |a|+|b|$.

This avoids introducing names for the minimum and maximum. Assuming $a>0$
for an arbitrary real $a$ would instead exclude zero and negative values
unless they are separately handled or related by a valid invariance.

## Reuse a symbol after a transformation

After normalizing, standardizing, centering, or rescaling an object, keep its
original symbol when only the transformed values are used afterward. Announce
the change of meaning and its scope. Introduce a new symbol only when both
versions remain needed, such as for comparison or a later formula relating
them. Retain transformation parameters needed to recover original units, and
check that the transformation is defined, such as nonzero variance for
standardization.

For a nonconstant real sample $x_1,\ldots,x_n$, compute its original mean
$\bar x$ and standard deviation $s>0$ first:

> Standardize $x_i\leftarrow(x_i-\bar x)/s$ for all $i$; from here on $x_i$
> denotes the standardized value.

Apply the same rule to code variable names: rebind the local name and announce
its new meaning in a comment or docstring. Name reuse does not require in-place
mutation of the original object. For example, with the original mean and scale
already computed, `x = (x - mean) / scale` keeps the name for the standardized
array.

Changing a symbol's meaning does not itself justify a
[WLOG reduction](#without-loss-of-generality).
