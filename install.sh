#!/usr/bin/env bash
# Symlink every skill in ./skills into the agent skill directories that exist.
# Usage: ./install.sh [--copy] [--project DIR] [--all-targets] [skill ...]
#   default      user-level dirs that already exist: ~/.agents/skills (Cursor + Codex),
#                ~/.cursor/skills, ~/.codex/skills (legacy), ~/.claude/skills
#   --project D  install into D/.agents/skills (Cursor + Codex) and D/.claude/skills if D/.claude exists
#   --all-targets  create ~/.agents/skills and ~/.claude/skills if missing
#   --copy       copy instead of symlink
# Example: ./install.sh math-writing-notation-economy decision-records
# Existing entries with the same name are left untouched unless they are our symlinks.
set -euo pipefail
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills"
MODE=link; PROJECT=""; CREATE=0; PICK=()
while [ $# -gt 0 ]; do
  case "$1" in
    --copy) MODE=copy ;;
    --project) PROJECT="$2"; shift ;;
    --all-targets) CREATE=1 ;;
    -h|--help) sed -n '2,10p' "$0"; exit 0 ;;
    *) PICK+=("$1") ;;
  esac; shift
done
if [ ${#PICK[@]} -eq 0 ]; then for d in "$SRC"/*/; do PICK+=("$(basename "$d")"); done; fi

TARGETS=()
if [ -n "$PROJECT" ]; then
  mkdir -p "$PROJECT/.agents/skills"; TARGETS+=("$PROJECT/.agents/skills")
  [ -d "$PROJECT/.claude" ] && { mkdir -p "$PROJECT/.claude/skills"; TARGETS+=("$PROJECT/.claude/skills"); }
else
  [ $CREATE -eq 1 ] && mkdir -p "$HOME/.agents/skills" "$HOME/.claude/skills"
  # ~/.agents/skills is read by both Cursor and Codex. Create it if either tool is present.
  if [ -d "$HOME/.cursor" ] || [ -d "$HOME/.codex" ]; then mkdir -p "$HOME/.agents/skills"; fi
  for t in "$HOME/.agents/skills" "$HOME/.claude/skills"; do [ -d "$t" ] && TARGETS+=("$t"); done
  # Cursor also reads ~/.cursor/skills; skip it when ~/.agents/skills exists to avoid duplicates.
  if [ ! -d "$HOME/.agents/skills" ] && [ -d "$HOME/.cursor/skills" ]; then TARGETS+=("$HOME/.cursor/skills"); fi
fi
[ ${#TARGETS[@]} -eq 0 ] && { echo "No skill directories found. Re-run with --all-targets or --project DIR." >&2; exit 1; }

for t in "${TARGETS[@]}"; do
  for s in "${PICK[@]}"; do
    [ -f "$SRC/$s/SKILL.md" ] || { echo "skip: unknown skill $s" >&2; continue; }
    dest="$t/$s"
    if [ -L "$dest" ]; then
      case "$(readlink "$dest")" in "$SRC"/*) rm "$dest" ;; *) echo "skip: $dest is another symlink"; continue ;; esac
    elif [ -e "$dest" ]; then echo "skip: $dest exists"; continue; fi
    if [ "$MODE" = copy ]; then cp -R "$SRC/$s" "$dest"; else ln -s "$SRC/$s" "$dest"; fi
    echo "$MODE: $dest"
  done
done
echo "Done. Restart Cursor / Codex / Claude Code if a skill does not appear."
