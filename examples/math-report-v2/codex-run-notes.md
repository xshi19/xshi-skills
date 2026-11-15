# Codex run notes

The problem and prompt are the same as in `examples/math-report/prompt.md`. `prompt.md` in this directory is a copy of that file. The prompt does not mention notation, style, or skills.

## Command

Both runs used `/home/box/.local/bin/codex` (OpenAI Codex v0.153.4):

```
HOME=/tmp/codex-math-iso-home-<run> \
CODEX_HOME=/tmp/codex-math-iso-home-<run>/.codex \
/home/box/.local/bin/codex exec \
  -m gpt-6-astra \
  -c model_reasoning_effort=xhigh \
  -s workspace-write \
  -C /tmp/codex-math-report-<run> \
  "$PROMPT" </dev/null
```

`$PROMPT` was the verbatim contents of `examples/math-report/prompt.md` (trailing newline stripped by the shell). The session header recorded: model `gpt-6-astra`, provider `openai`, approval `never`, sandbox `workspace-write [workdir, /tmp, $TMPDIR]`, reasoning effort `xhigh`, reasoning summaries `none`.

Each run had its own isolated `HOME` / `CODEX_HOME` containing only a copy of `auth.json` and this `config.toml`:

```
approval_policy = "never"
model = "gpt-6-astra"
model_reasoning_effort = "xhigh"
model_reasoning_summary = "none"

[projects."/tmp/codex-math-report-a"]
trust_level = "trusted"

[projects."/tmp/codex-math-report-b"]
trust_level = "trusted"
```

No skills directory and no `AGENTS.md` were present under those isolated homes. The box's `~/.agents/skills/math-notation` symlink and `~/.codex/skills` were therefore not visible to either process.

Skills copied into Run B were taken from `xshi19/xshi-skills` commit `13778cc` (`cursor/polish-readme-install-7287` at the start of the runs). That commit's `skills/statement-before-proof/SKILL.md` does not contain the sentence "The reader must be able to interpret the statement without reading its proof."

## Run A, without skills

- Workdir: `/tmp/codex-math-report-a`. Git repository containing only `.gitkeep`. No `.agents/skills`, no `.cursor/skills`, no `AGENTS.md`.
- Session id: `01a1dd72-fa65-7e32-95f7-9827e32167b2`.
- Exit code 0, elapsed 75797 ms, tokens used 6605.
- The log shows no reads of any `SKILL.md` or other skill file.
- Saved file: `examples/math-report-v2/codex-without-skill.md`, the unedited `report.md`.
- Lines (newline-terminated): 64. Whitespace-separated words: 307.

## Run B, with skills

- Workdir: `/tmp/codex-math-report-b`. Git repository containing `.gitkeep` plus every skill directory from the branch's `skills/` copied into `.agents/skills`. No `.cursor/skills`, no `AGENTS.md`.
- Installed skill directories: `benchmarking`, `decision-records`, `math-notation`, `mutation-testing`, `numerical-review`, `principle-choose-the-numerically-honest-formulation`, `principle-closed-form-over-general-case`, `principle-code-mirrors-the-math`, `principle-explicit-backend-no-silent-placement`, `principle-fail-loud-on-invalid-domain`, `principle-immutable-values-for-math-objects`, `principle-one-source-of-truth-derive-the-rest`, `statement-before-proof`.
- Session id: `01a1dd72-fd62-70e1-9f4a-f3e994a7f1f2`.
- Exit code 0, elapsed 101461 ms, tokens used 10493.
- The log shows these skill files opened, in order:
  1. `.agents/skills/statement-before-proof/SKILL.md`
  2. `.agents/skills/math-notation/SKILL.md`
  3. `.agents/skills/math-notation/references/reductions-and-transforms.md`
- The other installed skills were not opened. `math-notation/scripts/notation_audit.py` was not run.
- Saved file: `examples/math-report-v2/codex-with-skill.md`, the unedited `report.md`.
- Lines (newline-terminated): 69. Whitespace-separated words: 316.
