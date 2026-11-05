---
name: math-notation
description: "Use when finalizing notation in mathematical writing: audit symbols, case reductions, and notation after transformations while preserving the full claim. Not for scratch work or unfinished derivations."
---

# Math notation

Apply to the **final draft** of math exposition, after claims and proofs have settled. Scratch work and intermediate derivations may use any helpful notation. Audit only what the reader will see.

## When a symbol earns its place

- Prefer the project's notation canon, then established notation from a relevant textbook or paper; record the source and mapping when conventions differ. Standard usage elsewhere does not by itself justify an alias here.
- Introduce an auxiliary symbol only if it names a meaningful object used substantively later, or substantially shortens or clarifies otherwise unwieldy formulas. Recurrence alone is not enough: a letter standing for a short, readable expression still costs the reader a lookup.
- Judge the rendered formula plus the cost of remembering the definition, not LaTeX characters saved. Prefer an explicit indicator or survival probability when its event is the point.
- Keep necessary primary variables, parameters, bound indices, and named objects. This is an audit of avoidable notation, not a symbol quota. A proof-local abbreviation may stay in the proof without entering the statement.
- Define retained symbols near first substantive use, with meaning and scope. No alias chains or decorative subscripts.

## Final-draft audit

1. Inventory introduced symbols. Read the whole page (and related pages) before calling anything redundant; separate substantive uses from definitions, restatements, and unrelated reuse of a letter.
2. Apply the [symbol criteria](#when-a-symbol-earns-its-place) to each auxiliary symbol: keep, inline, or defer its definition. Scrutinize symbols used once or twice; a count is a signal, never a deletion rule. Never add uses to meet a threshold.
3. If the draft carries general-case notation or introduces transformed objects, read [reductions and transformed symbols](references/reductions-and-transforms.md) and apply the relevant principle.
4. Compare revision with original claim by claim. Preserve assumptions, quantifiers, domains, units, parameter dependence, conditional vs unconditional quantities, strict vs non-strict events, endpoint atoms, positivity/finiteness conditions, and possibly infinite expectations. Do not create undefined products, quotients, or ∞ − ∞.
5. Lose no fact, caveat, attribution, or proof dependency along with its shorthand. Update all affected uses, captions, labels, and cross-references. If meaning or scope is unclear, settle it before simplifying.
6. Reread in order and check the rendered formulas. The result should reduce lookup effort without creating long unreadable expansions. Record non-obvious decisions in the review, not as a notation table on the page.

## Optional audit script

[`scripts/notation_audit.py`](scripts/notation_audit.py) (Python 3, stdlib only) reports introductions and later in-page counts; findings exit 0 without edits. It misses prose-only uses, macros, and cross-page use, and cannot judge frequently used aliases, valid reductions, or symbol scope after transformations. Treat its output as candidates for human judgment; use `--help` for recognition details and limitations.

From this skill's directory:

```bash
python3 scripts/notation_audit.py path/to/page.md   # files or directories (*.md)
```
