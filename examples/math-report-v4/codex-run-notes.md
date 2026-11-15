# Codex run notes

The prompt is the verbatim contents of `examples/math-report-v2/prompt.md` (trailing newline stripped by the shell). The prompt does not mention notation, style, or skills. This directory was given only the with-skill Codex report and these notes; other files in this folder, if present, were not modified.

## Command

The run used `/home/box/.local/bin/codex` (OpenAI Codex v0.153.4):

```
HOME=/tmp/codex-math-v4-iso-home \
CODEX_HOME=/tmp/codex-math-v4-iso-home/.codex \
/home/box/.local/bin/codex exec \
  -m gpt-6-astra \
  -c model_reasoning_effort=xhigh \
  -s workspace-write \
  -C /tmp/codex-math-report-v4 \
  "$PROMPT" </dev/null
```

The session header recorded: model `gpt-6-astra`, provider `openai`, approval `never`, sandbox `workspace-write [workdir, /tmp, $TMPDIR]`, reasoning effort `xhigh`, reasoning summaries `none`.

`HOME` and `CODEX_HOME` pointed at an isolated tree containing only a copy of `auth.json` and this `config.toml`:

```
approval_policy = "never"
model = "gpt-6-astra"
model_reasoning_effort = "xhigh"
model_reasoning_summary = "none"

[projects."/tmp/codex-math-report-v4"]
trust_level = "trusted"
```

No skills directory and no `AGENTS.md` were present under that isolated home. The box's `~/.agents/skills/math-notation` symlink and `~/.codex/skills` were not visible to the process.

Skills copied into the workdir were taken from `xshi19/xshi-skills` commit `18fa428` (`cursor/polish-readme-install-7287` at the start of the run; message: "Restore the citation sentence and shorten audit step 2."). That commit's `skills/statement-before-proof/SKILL.md` contains the sentence "Clearly mark results cited without proof as cited and identify their source; do not imply that the page proves them." and does not contain the sentence "Include any regularity, positivity, finiteness, boundary, or unit conditions needed for validity."

## Run, with skills

- Workdir: `/tmp/codex-math-report-v4`. Git repository containing `.gitkeep` plus every skill directory from that commit's `skills/` copied into `.agents/skills`. No `.cursor/skills`, no `AGENTS.md`.
- Installed skill directories: `benchmarking`, `decision-records`, `math-notation`, `mutation-testing`, `numerical-review`, `principle-choose-the-numerically-honest-formulation`, `principle-closed-form-over-general-case`, `principle-code-mirrors-the-math`, `principle-explicit-backend-no-silent-placement`, `principle-fail-loud-on-invalid-domain`, `principle-immutable-values-for-math-objects`, `principle-one-source-of-truth-derive-the-rest`, `statement-before-proof`.
- Session id: `01a1dfe1-e062-7ae2-80e7-a720dc4833a7`.
- Exit code 0, elapsed 98665 ms, tokens used 15272.
- The log shows these skill files opened, in order:
  1. `.agents/skills/statement-before-proof/SKILL.md`
  2. `.agents/skills/math-notation/SKILL.md`
  3. `.agents/skills/math-notation/references/reductions-and-transforms.md`
- The other installed skills were not opened. `math-notation/scripts/notation_audit.py` was not run.
- Saved file: `examples/math-report-v4/codex-with-skill.md`, the unedited `report.md`.
- Lines (newline-terminated): 61. Whitespace-separated words: 339.
