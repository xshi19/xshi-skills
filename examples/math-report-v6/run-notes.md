# math-report-v6

Two fresh Cursor sessions on Grok 4.7 (Fast off). Each checkout started from `cursor/math-report-v6-isolation-7287`, whose only file was `.agents/skills/math-writing/SKILL.md`. The prompt is `prompt.md`. The reports are the committed `report.md` blobs.

## Run 1

- Agent: `bc-0d2d1050-b707-5ffd-8ed4-a7d1a4b28fc3`
- `wc -w`: 388
- Opened, in order:
  1. `.agents/skills/math-writing/SKILL.md`
  2. `report.md` (after writing it)
- A workspace search found only that skill file. No other skill was opened.

## Run 2

- Agent: `bc-b1c348f9-7c09-5699-97db-91f5ca0ec232`
- `wc -w`: 320
- Opened, in order:
  1. `.agents/skills/math-writing/SKILL.md`
  2. `report.md` (after writing it)
- A workspace search found only that skill file. The session then listed every path on `master` and printed the first 100 lines of `master:README.md`. `git show master:.agents/skills/math-writing/SKILL.md` returned nothing. No other `SKILL.md` was opened.
