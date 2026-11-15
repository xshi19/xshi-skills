# Notes

The problem is: derive the conditional distribution of a partitioned multivariate normal, and explain why it is Gaussian.

That problem is a formal derivation with a single principal claim. A careful write-up has to decide where the claim sits, which block symbols belong in the statement, and which abbreviations belong only in the proof. Those are the decisions `statement-before-proof` and `math-notation` are about. The earlier demo polished an already-clean paragraph, and the two replies stayed close. This one starts from the problem.

## Setup

Both runs received the prompt in `prompt.md`. The first sentence is the task. The second sentence is the same operational constraint on both runs: write only `report.md`, and do not open a pull request. It does not mention notation, style, or skills.

- Run A, without skills: a fresh Cursor cloud agent on `cursor/math-report-empty-7287`. The tree was `.gitkeep` only. No `.agents/skills` and no `.cursor/skills`. Agent `bc-c4853d5e-7ae9-55bd-9cd1-b1acdf08a536`. Committed report `51a29ba`.
- Run B, with skills: a fresh Cursor cloud agent on `cursor/math-report-skills-7287`. The tree was `.gitkeep` plus every skill from this repo copied under `.agents/skills`. No `.cursor/skills`. Agent `bc-f65ea0de-1065-5913-834b-9ffc76fca3fc`. Committed report `c813f43`.

Both were started with model `inherit` from this session, whose model is Grok 4.7 and not a fast variant. The child-run metadata did not record a separate model name. Neither run opened a pull request. Each committed `report.md` on its scratch branch. The files here are those committed blobs, including the trailing newline. They are not edited.

Run B opened, in order, `math-notation/SKILL.md`, `statement-before-proof/SKILL.md`, `math-notation/references/reductions-and-transforms.md`, and `math-notation/scripts/notation_audit.py`. It ran that audit script and revised the draft. It did not open the other installed skills (`decision-records`, `numerical-review`, `mutation-testing`, `benchmarking`, or the `principle-*` skills). Run A had no skill files to open. Both sessions still had this environment's plugin skills available. Neither report uses them.

## Differences

The difference is not small. Both reach the same classical formula: the conditional law is normal, with mean \(\mu_1+\Sigma_{12}\Sigma_{22}^{-1}(x_2-\mu_2)\) and covariance \(\Sigma_{11}-\Sigma_{12}\Sigma_{22}^{-1}\Sigma_{21}\) (Run B writes \(\Sigma_{12}^\top\)). The exposition is not the same.

1. **Where the claim sits.** Run A is a narrative: Problem, Joint density, The conditional law, Why the conditional distribution is Gaussian, then a closing Result. The displayed law is the last block. Run B states Lemma 1 and Lemma 2 in full before each proof, then states Theorem 1 (Conditional Gaussian) before **Proof.**, marks **End of proof.**, and only then adds a Remark. The opening paragraph of Run B also states why the law is Gaussian, before the lemmas.

2. **Which symbols are in the main line.** Run A introduces the precision matrix \(\Lambda=\Sigma^{-1}\), centered aliases \(y_i\), a quadratic form \(Q\), and a residual \(Z\) in the body, then converts the precision blocks back to \(\Sigma\). Run B's theorem names only the conditional mean \(\mu_{1\mid 2}(x_2)\) and covariance \(\Sigma_{1\mid 2}\). Inside the proof it says "In this proof, write" and defines the coefficient \(C=\Sigma_{12}\Sigma_{22}^{-1}\) and the residual \(R\). There is no precision matrix.

3. **What comes after the proof.** Run A assumes the whole covariance is positive definite at the start and keeps both explanations in the narrative. Run B's theorem assumes only that \(\Sigma_{22}\) is positive definite. The Schur complement, the uniqueness of \(C\), and the case where the conditional covariance is singular sit in the Remark after the proof.

4. **Length.** Run A is 167 lines and about 580 words. Run B is 263 lines and about 2,300 words. Run B is the longer report. It builds the Gaussian family from characteristic functions before the conditional law. That machinery is the extra length.

5. **Delimiters.** Run A uses `\(...\)` and `\[...\]`. Run B rewrote those to `$` and `$$` while running `notation_audit.py`, which only sees dollar math. That is a mechanical side effect of the audit, not a change in the mathematics.

The figure in `docs/assets/math-report-before-after.png` shows the precision-matrix passage and the closing Result from Run A beside Theorem 1 and the proof-local \(C\) from Run B. It is a selection. These markdown files are the full reports.
