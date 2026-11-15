---
name: statement-before-proof
description: "State a precise numbered or named theorem, proposition, lemma, or corollary before its proof, and put remarks after the proof. Use when drafting or reviewing a proof, a formal derivation, or a cited result that is proved on the page. Not for pure definitions, citation-only results, or informal motivation."
license: MIT
---

# Statement before proof

Before proving or deriving a mathematical claim, state it as a numbered or named **Theorem**, **Proposition**, **Lemma**, or **Corollary**. Do not bury the claim inside the proof narrative.

Apply this rule even when the claim comes from a source such as a book section and the page supplies its proof or derivation. Pure definitions and informal motivation do not need result labels. Clearly mark results cited without proof as cited and identify their source; do not imply that the page proves them.

## Choose the result type

- **Theorem:** a principal result of the exposition.
- **Proposition:** a substantive result that does not need the prominence of a theorem.
- **Lemma:** a supporting result used to prove another result.
- **Corollary:** a direct consequence of an established result; identify that dependency in the proof.

Choose by the result's role, not the length or difficulty of its proof. Use the consuming project's documented conventions for numbering, names, cross-references, and rendering.

## Statement and proof audit

1. Identify each claim established by a proof or formal derivation, including claims adapted from cited sources. Preserve attribution and the source's theorem or section identifier when available.
2. Write the complete statement first: define its objects and domains, make quantifiers and hypotheses explicit, and give the precise conclusion. Include any regularity, positivity, finiteness, boundary, or unit conditions needed for validity. The reader must be able to interpret the statement without reading its proof.
3. Place the proof after the statement and clearly mark its beginning and end. Check that it establishes exactly the stated claim. Resolve missing assumptions or unsupported conclusions explicitly; do not silently strengthen or weaken the result during restructuring.
4. Put remarks, examples, unit comments, and out-of-scope notes after the proof. Keep essential hypotheses in the statement and reasoning needed to establish the claim in the proof; neither belongs only in an afterthought.
5. Reread in order: every proved claim has a preceding numbered or named statement, no hypothesis or part of the conclusion is first revealed in the proof, and labels, citations, and cross-references remain consistent.
