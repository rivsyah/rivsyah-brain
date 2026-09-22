#!/usr/bin/env bash
# brain-pull — read-only refresh. Fetch, fast-forward when that is safe, and print what any other
# machine has been doing. Never commits. Never rebases. Never touches your work.
#
#   brain-pull.sh          fetch + fast-forward + show new journal lines from other machines
#   brain-pull.sh --quiet  same, minimal output (used by the session-start hook)
#
# It REPORTS divergence instead of silently rebasing, and it never claims "in sync" without having
# actually compared against the remote.
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
QUIET=0; [ "${1:-}" = "--quiet" ] && QUIET=1

say()  { [ "$QUIET" = 1 ] || echo "brain-pull: $*"; }
warn() { echo "brain-pull: $*" >&2; }
die()  { echo "brain-pull: $*" >&2; exit 1; }

[ -d "$ROOT/.git" ]        || die "$ROOT is not a git checkout"
[ -f "$ROOT/.brain-env" ]  || die "no .brain-env — run bin/brain-build.sh first"
# shellcheck disable=SC1091
. "$ROOT/.brain-env"
[ -n "${BRAIN_REPO:-}" ]   || die "BRAIN_REPO not set in .brain-env"
BRANCH="main"
MACHINE="$(tr -d ' \r\n' < "$ROOT/.machine" 2>/dev/null || echo unknown)"

ENVDB="$ROOT/env.db"
[ -f "$ENVDB" ] || die "no env.db at $ENVDB — it is placed by hand and deliberately never synced"
TOK="$(grep -m1 '^GITHUB_PAT=' "$ENVDB" | cut -d= -f2- | tr -d '"'"'"'\r')"
[ -n "$TOK" ] || die "GITHUB_PAT not found in $ENVDB"
URL="https://x-access-token:$TOK@github.com/$BRAIN_REPO.git"
G() { git -C "$ROOT" -c credential.helper= "$@"; }
scrub() { sed 's/x-access-token:[^@]*@/x-access-token:***@/g'; }

G fetch --quiet "$URL" "$BRANCH" 2>&1 | scrub || die "fetch failed"

AHEAD="$(G rev-list --count FETCH_HEAD..HEAD 2>/dev/null || echo 0)"
BEHIND="$(G rev-list --count HEAD..FETCH_HEAD 2>/dev/null || echo 0)"
DIRTY="$(G status --porcelain | wc -l | tr -d ' ')"

# what did any OTHER machine write since the commit we already had?
if [ "$BEHIND" != 0 ]; then
  NEW="$(G diff HEAD..FETCH_HEAD -- memory/journal 2>/dev/null \
         | grep '^+- ' | sed 's/^+//' || true)"
  if [ -n "$NEW" ]; then
    echo "brain-pull: what the other machine(s) did since you last looked —"
    echo "$NEW" | sed 's/^/  /'
  fi
fi

if [ "$BEHIND" = 0 ] && [ "$AHEAD" = 0 ]; then
  say "up to date with the remote"
elif [ "$BEHIND" != 0 ] && [ "$AHEAD" = 0 ]; then
  if G merge --ff-only FETCH_HEAD >/dev/null 2>&1; then
    say "fast-forwarded $BEHIND commit(s)"
  else
    warn "$BEHIND commit(s) behind but the fast-forward was refused."
    warn "Something in your working tree would be overwritten. Resolve by hand:"
    warn "  git -C $ROOT status"
  fi
elif [ "$AHEAD" != 0 ] && [ "$BEHIND" = 0 ]; then
  say "$AHEAD local commit(s) not yet pushed — run brain-push.sh when you are done"
else
  warn "DIVERGED: $AHEAD local commit(s) vs $BEHIND on the remote."
  warn "Nothing was changed. Reconcile by hand before pushing:"
  warn "  git -C $ROOT log --oneline HEAD..FETCH_HEAD"
fi

[ "$DIRTY" = 0 ] || say "$DIRTY uncommitted file(s) here (normal mid-session; brain-push.sh sends them)"
