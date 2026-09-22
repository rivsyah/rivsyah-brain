#!/usr/bin/env bash
# install-project — scaffold the ai_context Framework into the current directory.
#
#   cd ~/dev/business/my-app
#   ~/claude/framework/install-project.sh              # slug comes from the folder name
#   PROJECT=my-app ~/claude/framework/install-project.sh
#
# It never overwrites an existing file. What it lays down:
#   CLAUDE.md  .gitignore
#   .claude/FRAMEWORK.md            the spec, plus your binding appendix if one exists
#   .claude/TEMPLATES/              the skeletons for new versions, bugs and components
#   .claude/ai_context/             the v1 tree: GRANDPLAN, implementation, bugs, reference
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
[ -d "$REPO/project-skeleton" ] || { echo "install-project: no project-skeleton in $REPO"; exit 1; }

PROJECT="${PROJECT:-$(basename "$PWD")}"
echo "==> Scaffolding the ai_context Framework into $PWD (slug: $PROJECT)"

subst() { sed -i.bak "s/{{project}}/${PROJECT}/g; s/{{PROJECT}}/${PROJECT^^}/g" "$1" 2>/dev/null && rm -f "$1.bak" || true; }

copy_if_missing() {
  local src="$1" dst="$2"
  if [ -e "$dst" ]; then echo "    skip $dst (exists)"; return; fi
  mkdir -p "$(dirname "$dst")"; cp "$src" "$dst"; subst "$dst"; echo "    +    $dst"
}

copy_tree() {
  local src="$1" dstroot="$2" f rel
  while IFS= read -r -d '' f; do
    rel="${f#"$src"/}"
    copy_if_missing "$f" "$dstroot/$rel"
  done < <(find "$src" -type f -print0)
}

copy_if_missing "$REPO/project-skeleton/CLAUDE.md"          "$PWD/CLAUDE.md"
copy_if_missing "$REPO/project-skeleton/gitignore.template" "$PWD/.gitignore"
copy_tree       "$REPO/project-skeleton/.claude"            "$PWD/.claude"
copy_if_missing "$REPO/FRAMEWORK.md"                        "$PWD/.claude/FRAMEWORK.md"
copy_tree       "$REPO/TEMPLATES"                           "$PWD/.claude/TEMPLATES"

# the binding appendix is yours and stays out of any public repo — append, never link
if [ -f "$REPO/BINDING.md" ]; then
  if ! grep -q "LOCAL BINDING" "$PWD/.claude/FRAMEWORK.md" 2>/dev/null; then
    printf '\n\n' >> "$PWD/.claude/FRAMEWORK.md"
    cat "$REPO/BINDING.md" >> "$PWD/.claude/FRAMEWORK.md"
    echo "    +    appended your local binding to .claude/FRAMEWORK.md"
  fi
else
  echo "    !    no BINDING.md yet — copy BINDING.template.md to BINDING.md and fill it in."
fi

cat <<EOF

==> Done. Resume order for any session:
    CLAUDE.md -> .claude/ai_context/development/v1/implementation/00_INDEX.md
    -> STATUS.md -> the build file it points to -> DECISIONS.md

Next, on a greenfield project:
  1. Fill CLAUDE.md with the project facts and its hard rules.
  2. Write .claude/ai_context/development/v1/GRANDPLAN.md — the vision, in full.
  3. Derive implementation/01_* from the GRANDPLAN. Tick the boxes and update STATUS as you build.
  ( Existing code? Scan it into GRANDPLAN + reference/ first, then derive the build files. )

Decisions are locked in implementation/DECISIONS.md, append-only.
Bugs become B<n> in .claude/ai_context/development/bug/ BEFORE they are fixed.
A new version copies fresh skeletons from .claude/TEMPLATES/ into development/vN/.

NOTE: the shipped .gitignore keeps .claude/ local-only. An untracked tree has no remote copy, so
arrange a backup, or track it instead and record that choice in ai_context/README.md.
EOF
