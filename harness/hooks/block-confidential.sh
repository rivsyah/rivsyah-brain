#!/usr/bin/env bash
# PreToolUse guard — block any SHELL command that references a confidential directory.
#
# The list comes from CONFIDENTIAL_DIRS in agent.conf, carried into the brain's .brain-env by
# brain-build.sh. An empty list means this guard allows everything, which is the correct default
# for someone who has not named a confidential path yet.
#
# File tools (Read, Edit, Write, Glob, Grep) are blocked declaratively by the permissions.deny
# globs in settings.json. Those match PATHS, not content, so writing the NAME of a confidential
# directory into a rules file stays allowed — that is deliberate. It is how this rule gets
# documented at all.
#
# Strategy: normalise the command first, then match. Matching literal spellings is defeated by
# simply quoting the path. Normalising collapses every spelling into one form.
#
# Fails CLOSED on a match, and OPEN when there is no list to enforce.
set -uo pipefail

input="$(cat)"

ROOT=""
for cand in "$HOME/claude" "$HOME/.claude/brain" "/c/claude" "C:/claude"; do
  [ -f "$cand/.brain-env" ] && ROOT="$cand" && break
done
[ -n "$ROOT" ] || exit 0
# shellcheck disable=SC1091
. "$ROOT/.brain-env" 2>/dev/null || exit 0
[ -n "${CONFIDENTIAL_DIRS:-}" ] || exit 0

# lowercase; drop quotes and backticks that split a path; backslashes to slashes;
# collapse repeated slashes so //x/ and /x// converge
norm="$(printf '%s' "$input" \
  | tr 'A-Z' 'a-z' \
  | sed -e "s/[\"'\`]//g" \
        -e 's/\\\\/\//g' \
        -e 's/\\/\//g' \
        -e 's|/\{2,\}|/|g')"

deny() {
  printf '%s\n' "{\"hookSpecificOutput\":{\"hookEventName\":\"PreToolUse\",\"permissionDecision\":\"deny\",\"permissionDecisionReason\":\"BLOCKED: '$1' is a confidential path. Never read, write, list, grep or cd into it without explicit direction in this chat. If you are only writing documentation that quotes the path, use the Write tool instead of a shell command.\"}}"
  exit 0
}

IFS=',' read -ra dirs <<< "$CONFIDENTIAL_DIRS"
for d in "${dirs[@]}"; do
  d="$(printf '%s' "$d" | sed 's/^ *//; s/ *$//' | tr 'A-Z' 'a-z')"
  [ -n "$d" ] || continue
  d="$(printf '%s' "$d" | sed -e 's/\\/\//g' -e 's|/\{2,\}|/|g' -e 's|/*$||')"
  # a trailing character class keeps a sibling like "private-old" out of scope
  esc="$(printf '%s' "$d" | sed 's/[][\.^$*+?(){}|]/\\&/g')"
  if printf '%s' "$norm" | grep -Eq "(^|[^a-z0-9_-])${esc}([^a-z0-9_-]|\$)"; then
    deny "$d"
  fi
done
exit 0
