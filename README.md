# xshi-skills

English | [中文](#中文)

Agent skills by Xiang Shi ([@xshi19](https://github.com/xshi19)) for mathematical writing, engineering decision records, and scientific / numerical computing. Each skill is a folder with a `SKILL.md` that follows the open [Agent Skills](https://agentskills.io) format, so the same files load in **Cursor**, **Codex**, and **Claude Code**.

> Install only what you need. Every installed skill adds its name and description to the agent's context.

## Skills

### Math writing

| Skill | Use it when |
|---|---|
| [`math-writing-notation-economy`](skills/math-writing-notation-economy/SKILL.md) | Finalizing reader-facing math exposition: audit notation, case reductions, and transformed symbols. Includes an optional [report-only audit script](skills/math-writing-notation-economy/scripts/notation_audit.py) (Python 3, stdlib only). |

### Decision records

| Skill | Use it when |
|---|---|
| [`decision-records`](skills/decision-records/SKILL.md) | Recording a consequential choice or an inconclusive alternative (ADR), or recovering prior decisions before proposing a design change. Ships a minimal [template](skills/decision-records/references/template.md). |

### Science stack

Seven numerical design principles plus three review workflows. Backend-specific notes (JAX, PyTorch CUDA) live in `references/` and load only when relevant.

| Skill | Use it when | Invocation |
|---|---|---|
| [`principle-code-mirrors-the-math`](skills/principle-code-mirrors-the-math/SKILL.md) | Translating notation, parameterizations, or coordinates into code. | explicit |
| [`principle-closed-form-over-general-case`](skills/principle-closed-form-over-general-case/SKILL.md) | Choosing between a specialized formula and a general algorithm. | explicit |
| [`principle-one-source-of-truth-derive-the-rest`](skills/principle-one-source-of-truth-derive-the-rest/SKILL.md) | Keeping values, derivatives, and inverse maps consistent. | explicit |
| [`principle-explicit-backend-no-silent-placement`](skills/principle-explicit-backend-no-silent-placement/SKILL.md) | Changing device/backend execution contracts. | explicit |
| [`principle-immutable-values-for-math-objects`](skills/principle-immutable-values-for-math-objects/SKILL.md) | Designing mathematical values, fit results, reusable artifacts. | explicit |
| [`principle-fail-loud-on-invalid-domain`](skills/principle-fail-loud-on-invalid-domain/SKILL.md) | Handling invalid inputs, failed solves, infinities, clamps. | explicit |
| [`principle-choose-the-numerically-honest-formulation`](skills/principle-choose-the-numerically-honest-formulation/SKILL.md) | Choosing representations, formulations, or precision. | explicit |
| [`benchmarking`](skills/benchmarking/SKILL.md) | Measuring speedups, regressions, or tradeoffs. | explicit |
| [`mutation-testing`](skills/mutation-testing/SKILL.md) | Checking whether numerical tests would catch plausible regressions. | auto |
| [`numerical-review`](skills/numerical-review/SKILL.md) | Reviewing formulas, derivative rules, solvers, execution changes. | auto |

"explicit" skills set `disable-model-invocation: true` (Cursor / Claude Code) and `agents/openai.yaml` → `allow_implicit_invocation: false` (Codex). Invoke them by name: `/principle-...` in Cursor or Claude Code, `$principle-...` in Codex. "auto" skills are picked up from their description.

Some skills mention optional companions from [pstack](https://cursor.com/marketplace) (`why`, `benchmark-checklist`, `principle-explain-the-number`). They are not required.

## Install

### Quick install (script)

```bash
git clone https://github.com/xshi19/xshi-skills.git
cd xshi-skills
./install.sh                         # all skills, user level
./install.sh math-writing-notation-economy decision-records   # only some skills
./install.sh --project /path/to/repo # project level (.agents/skills)
./install.sh --copy                  # copy instead of symlink
```

`install.sh` symlinks each skill into the user-level directories that exist:

- `~/.agents/skills` — read by **both Cursor and Codex** (created if `~/.cursor` or `~/.codex` exists). This is the recommended single location.
- `~/.claude/skills` — Claude Code (only if it exists, or with `--all-targets`).
- `~/.cursor/skills` — used only when `~/.agents/skills` is absent, to avoid duplicate skills in Cursor.

Symlinks keep skills updated with `git pull`. Use `--copy` if a tool or sync setup does not follow symlinks (for example, Cursor's *Sync Skills for Cloud Agents* only syncs `~/.cursor/skills`).

### Cursor

Cursor loads skills from `~/.agents/skills/`, `~/.cursor/skills/` (user) and `.agents/skills/`, `.cursor/skills/` (project). It also reads `~/.claude/skills/` and `~/.codex/skills/` for compatibility.

```bash
ln -s "$PWD/skills/math-writing-notation-economy" ~/.cursor/skills/math-writing-notation-economy   # user level
mkdir -p .cursor/skills && cp -R /path/to/xshi-skills/skills/decision-records .cursor/skills/   # project level
```

Check under **Customize → Skills**. Invoke with `/skill-name` or let the agent choose.

### Codex

Codex scans `.agents/skills` from the current directory up to the repository root, plus `$HOME/.agents/skills` (user) and `/etc/codex/skills` (admin). It follows symlinked skill folders. See the [Codex skills docs](https://developers.openai.com/codex/skills).

```bash
mkdir -p ~/.agents/skills
ln -s "$PWD/skills/decision-records" ~/.agents/skills/decision-records       # user level
mkdir -p .agents/skills && cp -R /path/to/xshi-skills/skills/math-writing-notation-economy .agents/skills/   # project level
```

Run `/skills` or type `$` to mention a skill. Restart Codex if a new skill does not appear. Older Codex builds read `~/.codex/skills`; link there too if you use one.

**Cursor + Codex together:** put skills in `~/.agents/skills` (user) or `<repo>/.agents/skills` (project). Both tools load that one copy.

### Claude Code

```bash
mkdir -p ~/.claude/skills
ln -s "$PWD/skills/numerical-review" ~/.claude/skills/numerical-review   # user level
# project level: <repo>/.claude/skills/<skill>
```

## Layout

```text
skills/<skill-name>/
  SKILL.md              # YAML frontmatter: name, description (+ optional disable-model-invocation)
  agents/openai.yaml    # optional Codex policy (explicit-only skills)
  references/           # optional, loaded on demand
  scripts/              # optional helpers
```

## License

[MIT](LICENSE) © Xiang Shi (xshi19)

---

## 中文

Xiang Shi（[@xshi19](https://github.com/xshi19)）编写的 Agent Skills：数学写作、工程决策记录（ADR）、科学计算/数值方法。每个 skill 是 `skills/<名称>/SKILL.md`，遵循开放的 Agent Skills 格式，**Cursor、Codex、Claude Code** 都能加载。

- **数学写作**：[`math-writing-notation-economy`](skills/math-writing-notation-economy/SKILL.md)，定稿时审查符号、情形归约与变换后的记号。
- **决策记录**：`decision-records`，记录重要技术决策及备选方案，改设计前先查已有决策。
- **Science stack**：7 条数值设计原则 + `benchmarking`、`mutation-testing`、`numerical-review`。原则类与 benchmarking 需要显式调用（Cursor/Claude Code 用 `/名称`，Codex 用 `$名称`）。

### 安装

```bash
git clone https://github.com/xshi19/xshi-skills.git && cd xshi-skills
./install.sh                 # 全部安装到用户目录
./install.sh math-writing-notation-economy decision-records   # 只装部分
./install.sh --project 仓库路径  # 装到项目的 .agents/skills
```

- **Cursor + Codex 通用**：放在 `~/.agents/skills`（用户级）或项目的 `.agents/skills`，两者都会读取，只需一份。
- **Cursor**：也可用 `~/.cursor/skills` 或项目 `.cursor/skills`。
- **Codex**：`~/.agents/skills`、项目 `.agents/skills`（旧版本用 `~/.codex/skills`）。
- **Claude Code**：`~/.claude/skills`。

建议只安装需要的 skill，以减少上下文占用。许可证：MIT。
