# Codex run notes

The prompt is the verbatim contents of `examples/math-report-v2/prompt.md` (trailing newline stripped by the shell). The prompt does not mention notation, style, or skills. This directory was given only the with-skill Codex report and these notes; other files in this folder, if present, were not modified.

## Command

The run used `/home/box/.local/bin/codex` (OpenAI Codex v0.153.4):

```
HOME=/tmp/codex-math-v5-iso-home \
CODEX_HOME=/tmp/codex-math-v5-iso-home/.codex \
/home/box/.local/bin/codex exec \
  -m gpt-6-astra \
  -c model_reasoning_effort=xhigh \
  -s workspace-write \
  -C /tmp/codex-math-report-v5 \
  "$PROMPT" </dev/null
```

The session header recorded: model `gpt-6-astra`, provider `openai`, approval `never`, sandbox `workspace-write [workdir, /tmp, $TMPDIR]`, reasoning effort `xhigh`, reasoning summaries `none`.

`HOME` and `CODEX_HOME` pointed at an isolated tree containing only a copy of `auth.json` and this `config.toml`:

```
approval_policy = "never"
model = "gpt-6-astra"
model_reasoning_effort = "xhigh"
model_reasoning_summary = "none"

[projects."/tmp/codex-math-report-v5"]
trust_level = "trusted"
```

No skills directory and no `AGENTS.md` were present under that isolated home. The box's `~/.agents/skills/math-notation` symlink and `~/.codex/skills` were not visible to the process.

## Skills in the workdir

The workdir was a fresh git repository containing `.gitkeep` plus skill directories under `.agents/skills`. No `.cursor/skills`, no `AGENTS.md`.

Skill directories copied from `xshi19/xshi-skills` commit `ef5364d` (`cursor/polish-readme-install-7287` after `git pull` at the start of the run), excluding `statement-before-proof` and `math-notation`: `benchmarking`, `decision-records`, `mutation-testing`, `numerical-review`, `principle-choose-the-numerically-honest-formulation`, `principle-closed-form-over-general-case`, `principle-code-mirrors-the-math`, `principle-explicit-backend-no-silent-placement`, `principle-fail-loud-on-invalid-domain`, `principle-immutable-values-for-math-objects`, `principle-one-source-of-truth-derive-the-rest`.

`.agents/skills/math-writing/` was added instead, with `/workspace/math-writing-draft/SKILL.md` copied verbatim, plus copies of `skills/math-notation/references/` and `skills/math-notation/scripts/` from that same commit.

## Run, with skills

- Session id: `01a1f69e-5339-7b81-afab-ec6b84a8cb3a`.
- Exit code 0, elapsed 67590 ms, tokens used 17348.
- The log shows these skill files opened, in order:
  1. `.agents/skills/math-writing/SKILL.md`
  2. `.agents/skills/math-writing/references/reductions-and-transforms.md`
- The other installed skills were not opened. `math-writing/scripts/notation_audit.py` was not run.
- Saved file: `examples/math-report-v5/codex-with-skill.md`, the unedited `report.md`.
- Lines (newline-terminated): 56. Whitespace-separated words: 304.
- Unique variables counted by `/tmp/syms.py`: 15 (`N_p` `N_p+q` `R` `T` `X` `Y` `\Sigma_XX` `\Sigma_XY` `\Sigma_YX` `\Sigma_YY` `\mu_X` `\mu_Y` `p` `q` `y`).
