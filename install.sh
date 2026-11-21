#!/usr/bin/env bash
# Install, list, or remove skills from this repository.
# Usage: ./install.sh --help
set -euo pipefail
shopt -s nullglob

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills"

usage() {
  cat <<'EOF'
Usage:
  ./install.sh [--copy] [--project DIR] [--all-targets] [skill ...]
  ./install.sh --list [skill ...]
  ./install.sh --uninstall [--project DIR] [skill ...]

Install skills from this repo. The default is a symlink of every skill.
Name skills to limit the set.

  --project DIR   install into DIR/.agents/skills
                  (and DIR/.claude/skills when DIR/.claude already exists)
  --all-targets   create ~/.agents/skills and ~/.claude/skills if missing
  --copy          copy skill directories instead of symlinking
  --list          print skill names and exit
  --uninstall     remove symlinks that point at this clone
                  (copied directories are left in place)
  -h, --help      show this message

Without --project, install writes to user directories that already exist:
  ~/.agents/skills   created when ~/.cursor or ~/.codex exists (Cursor and Codex)
  ~/.claude/skills   when that directory exists, or with --all-targets
  ~/.cursor/skills   only when ~/.agents/skills does not exist

--uninstall searches those directories and also ~/.codex/skills, without
creating anything. Pass the same --project DIR you installed into.
EOF
}

die() {
  echo "install.sh: $*" >&2
  echo >&2
  usage >&2
  exit 1
}

MODE="link"
PROJECT=""
CREATE=0
ACTION="install"
LIST=0
UNINSTALL=0
PICK=()

while [ $# -gt 0 ]; do
  case "$1" in
    --copy) MODE="copy" ;;
    --project)
      if [ $# -lt 2 ] || [ -z "${2:-}" ]; then
        die "--project requires a directory"
      fi
      case "$2" in
        -*) die "--project requires a directory, not an option ($2)" ;;
      esac
      PROJECT=$2
      shift
      ;;
    --all-targets) CREATE=1 ;;
    --list)
      if [ "$UNINSTALL" -eq 1 ]; then
        die "--list and --uninstall cannot be combined"
      fi
      LIST=1
      ACTION="list"
      ;;
    --uninstall)
      if [ "$LIST" -eq 1 ]; then
        die "--list and --uninstall cannot be combined"
      fi
      UNINSTALL=1
      ACTION="uninstall"
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --)
      shift
      while [ $# -gt 0 ]; do
        PICK+=("$1")
        shift
      done
      break
      ;;
    -*) die "unknown option: $1" ;;
    *) PICK+=("$1") ;;
  esac
  shift
done

if [ "$ACTION" = list ]; then
  if [ -n "$PROJECT" ] || [ "$MODE" = copy ] || [ "$CREATE" -eq 1 ]; then
    die "--list does not take install options"
  fi
fi
if [ "$ACTION" = uninstall ] && [ "$MODE" = copy ]; then
  die "--copy cannot be combined with --uninstall (copied directories are left in place)"
fi
if [ "$ACTION" = uninstall ] && [ "$CREATE" -eq 1 ]; then
  die "--all-targets cannot be combined with --uninstall"
fi
if [ -n "$PROJECT" ] && [ -e "$PROJECT" ] && [ ! -d "$PROJECT" ]; then
  die "--project path is not a directory: $PROJECT"
fi

# Print selected skill names, one per line. Return 1 if a name is unknown
# or the repo has no skills. Call only when PICK is non-empty inside the loop.
selected_skills() {
  local d base s ok
  if [ ${#PICK[@]} -eq 0 ]; then
    ok=1
    for d in "$SRC"/*/; do
      [ -f "${d}SKILL.md" ] || continue
      base=$(basename "$d")
      printf '%s\n' "$base"
      ok=0
    done
    return "$ok"
  fi
  ok=0
  for s in "${PICK[@]}"; do
    if [ -f "$SRC/$s/SKILL.md" ]; then
      printf '%s\n' "$s"
    else
      echo "install.sh: unknown skill: $s" >&2
      ok=1
    fi
  done
  return "$ok"
}

if [ "$ACTION" = list ]; then
  if ! selected_skills; then
    if [ ${#PICK[@]} -eq 0 ]; then
      echo "install.sh: no skills found in $SRC" >&2
    fi
    exit 1
  fi
  exit 0
fi

SKILL_LIST=$(mktemp "${TMPDIR:-/tmp}/xshi-skills.XXXXXX")
cleanup() {
  rm -f "$SKILL_LIST"
}
trap cleanup EXIT

if ! selected_skills >"$SKILL_LIST"; then
  if [ ${#PICK[@]} -eq 0 ]; then
    echo "install.sh: no skills found in $SRC" >&2
  fi
  exit 1
fi

TARGETS=()

add_if_dir() {
  if [ -d "$1" ]; then
    TARGETS+=("$1")
  fi
}

if [ "$ACTION" = uninstall ]; then
  if [ -n "$PROJECT" ]; then
    add_if_dir "$PROJECT/.agents/skills"
    add_if_dir "$PROJECT/.claude/skills"
    add_if_dir "$PROJECT/.cursor/skills"
  else
    add_if_dir "$HOME/.agents/skills"
    add_if_dir "$HOME/.claude/skills"
    add_if_dir "$HOME/.codex/skills"
    add_if_dir "$HOME/.cursor/skills"
  fi
  if [ ${#TARGETS[@]} -eq 0 ]; then
    echo "install.sh: no skill directories to search. Pass --project DIR if you installed into a project." >&2
    exit 1
  fi
  while IFS= read -r s; do
    [ -n "$s" ] || continue
    found=0
    for t in "${TARGETS[@]}"; do
      dest="$t/$s"
      if [ -L "$dest" ]; then
        link=$(readlink "$dest")
        if [ "$link" = "$SRC/$s" ]; then
          rm "$dest"
          echo "removed: $dest"
        else
          echo "skip: $dest points to $link" >&2
        fi
        found=1
      elif [ -e "$dest" ]; then
        echo "skip: $dest is not a symlink to this repo" >&2
        found=1
      fi
    done
    if [ "$found" -eq 0 ]; then
      echo "absent: $s"
    fi
  done <"$SKILL_LIST"
  exit 0
fi

if [ -n "$PROJECT" ]; then
  mkdir -p "$PROJECT/.agents/skills"
  TARGETS+=("$PROJECT/.agents/skills")
  if [ -d "$PROJECT/.claude" ]; then
    mkdir -p "$PROJECT/.claude/skills"
    TARGETS+=("$PROJECT/.claude/skills")
  fi
else
  if [ "$CREATE" -eq 1 ]; then
    mkdir -p "$HOME/.agents/skills" "$HOME/.claude/skills"
  fi
  if [ -d "$HOME/.cursor" ] || [ -d "$HOME/.codex" ]; then
    mkdir -p "$HOME/.agents/skills"
  fi
  if [ -d "$HOME/.agents/skills" ]; then
    TARGETS+=("$HOME/.agents/skills")
  fi
  if [ -d "$HOME/.claude/skills" ]; then
    TARGETS+=("$HOME/.claude/skills")
  fi
  if [ ! -d "$HOME/.agents/skills" ] && [ -d "$HOME/.cursor/skills" ]; then
    TARGETS+=("$HOME/.cursor/skills")
  fi
fi

if [ ${#TARGETS[@]} -eq 0 ]; then
  echo "install.sh: no skill directories found. Re-run with --all-targets or --project DIR." >&2
  exit 1
fi

while IFS= read -r s; do
  [ -n "$s" ] || continue
  for t in "${TARGETS[@]}"; do
    dest="$t/$s"
    if [ -L "$dest" ]; then
      case "$(readlink "$dest")" in
        "$SRC/$s") rm "$dest" ;;
        *)
          echo "skip: $dest is another symlink" >&2
          continue
          ;;
      esac
    elif [ -e "$dest" ]; then
      echo "skip: $dest exists" >&2
      continue
    fi
    if [ "$MODE" = copy ]; then
      cp -R "$SRC/$s" "$dest"
    else
      ln -s "$SRC/$s" "$dest"
    fi
    echo "$MODE: $dest"
  done
done <"$SKILL_LIST"

echo "Done. Restart Cursor, Codex, or Claude Code if a skill does not appear."
