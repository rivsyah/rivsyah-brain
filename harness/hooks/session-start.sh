#!/usr/bin/env bash
# SessionStart hook — mechanise the two things the rulebook asks for and that a session has been
# observed to skip:
#
#   1. pull the brain, so the vault this session reads is not stale
#   2. inject a pointer to the vault index, so "first action" does not depend on the model
#      choosing to obey prose
#
# ASCII ONLY in the emitted context. A non-ASCII dash here has come back as mojibake through the
# JSON encoder on Windows; ASCII sidesteps that everywhere.
#
# Fails OPEN and SILENT: a broken sync must never stop the owner from working. Failures are
# reported INSIDE the injected context instead, so the session knows what it is missing.
set -uo pipefail

for cand in "$HOME/claude" "$HOME/.claude/brain" "/c/claude" "C:/claude"; do
  [ -f "$cand/.brain-env" ] && ROOT="$cand" && break
done

note=""; AGENT_NAME="your agent"; VAULT_INDEX="the vault index"
SYNC="brain-push.sh"; ENVDB="env.db"; OWNER_SHORT="the owner"

if [ -z "${ROOT:-}" ]; then
  note="WARNING: the brain repo was not found. Memory may be stale and cannot be synced."
else
  # shellcheck disable=SC1091
  . "$ROOT/.brain-env"
  if [ -f "$ROOT/env.db" ]; then
    if out="$(timeout 45 bash "$ROOT/bin/brain-pull.sh" --quiet 2>&1)"; then
      note="Brain pulled clean - the vault is current."
    else
      note="WARNING: the brain pull FAILED, so the vault may be behind the remote. Resolve by hand, never force. Detail: $(printf '%s' "$out" | tr -d '\r' | tail -1)"
    fi
  else
    note="$ENVDB is not on this machine yet. It is placed by hand on purpose, so credentials never ride a git remote. Do not hunt for keys elsewhere, do not improvise one. If a task needs a credential, say plainly that it is not available yet and get on with everything that does not. (The brain was not pulled this session because the sync reads the token from that file.)"
  fi
fi

ctx="You are $AGENT_NAME, $OWNER_SHORT's agent on this machine.
FIRST ACTION: read $VAULT_INDEX before responding. It is the canonical index; open a card before acting on its topic.
Write a card, then note it: brain-note.sh \"what you did\" - free, local, no commit, no network. Push ONCE with $SYNC when the work is done, not after every card.
$note"

esc="$(printf '%s' "$ctx" | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' | awk 'BEGIN{ORS=""}{print (NR>1 ? "\\n" : "") $0}')"
printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}\n' "$esc"
exit 0
