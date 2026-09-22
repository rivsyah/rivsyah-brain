#!/usr/bin/env bash
# brain-note — append one line to THIS machine's journal.
#
#   brain-note.sh "set up the staging worker; token is in env.db"
#
# No git. No commit. No network. It is a local append and nothing else, so it costs nothing to
# call and can never interrupt another machine.
#
# The journal is per-machine and append-only: memory/journal/<machine-id>.md, one writer each.
# Because no file has two writers, git has nothing to conflict on. That is the whole design.
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MACHINE="$(tr -d ' \r\n' < "$ROOT/.machine" 2>/dev/null || echo unknown)"
J="$ROOT/memory/journal/$MACHINE.md"

[ $# -gt 0 ] || { echo "usage: brain-note.sh \"what you did\"" >&2; exit 1; }

mkdir -p "$(dirname "$J")"
if [ ! -f "$J" ]; then
  {
    echo "# $MACHINE — journal"
    echo
    echo "Append-only. **Only $MACHINE writes here.** Another machine reads it to find out what"
    echo "changed without needing a synchronised history. Newest at the bottom."
    echo
  } > "$J"
fi

printf -- '- %s  %s\n' "$(date -u +%Y-%m-%dT%H:%MZ)" "$*" >> "$J"
echo "noted -> memory/journal/$MACHINE.md"
