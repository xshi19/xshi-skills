---
name: principle-code-mirrors-the-math
description: "Keep each implemented quantity traceable to the governing equations, including units, shapes, and coordinate changes. Use when translating a derivation or formula into code, or when the code exposes more than one coordinate system or parametrization."
license: MIT
disable-model-invocation: true
---

# Code Mirrors the Math

Make each implemented quantity traceable to its role in the governing equations. Keep coordinate changes, units, and parameter conventions visible where values are constructed and consumed.

**Why:** Two coordinate systems can share an array shape while assigning different meanings to every entry. A mistaken conversion can survive type checks and round-trip tests, yet produce plausible likelihoods or gradients for the wrong model and corrupt fitted parameters without an exception.

**Pattern:**

- Preserve the governing specification's notation within a clear scope; disambiguate conflicting symbols rather than enforcing Greek names everywhere.
- Make units, shapes, ordering, and coordinates visible: two incompatible representations can have identical array types.
- Use named constructors for alternative parametrizations; each owns its conversion and validity contract.
- Keep normalization factors, sign changes, and coordinate Jacobians identifiable where they enter the computation.
- Check conversions against independently known values; a successful round-trip can hide matching conversion errors.
- During review, match arguments and outputs to the derivation at each call site, including reduction axes and parameter ordering.
