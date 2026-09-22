#!/usr/bin/env bash
# brain-push — the ONLY thing in the brain that commits. Run it once, when the work is done.
#
#   brain-push.sh                 commit everything as ONE commit, then push
#   brain-push.sh "message"       same, with your own summary line
#   brain-push.sh --dry-run       show what would be committed, change nothing
#
# One commit per session, on purpose. A push after every card produces a dozen commits a session,
# and the moment a second machine exists they race each other into rejected pushes. Use
# brain-note.sh during the session: it is free and needs no network.
#
# It refuses to push a diverged branch instead of rebasing behind your back, and it never reports
# success without having compared against the remote afterwards.
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

DRY=0; MSG=""
case "${1:-}" in
  --dry-run) DRY=1 ;;
  "")        ;;
  *)         MSG="$1" ;;
esac

say() { echo "brain-push: $*"; }
die() { echo "brain-push: $*" >&2; exit 1; }

[ -d "$ROOT/.git" ]       || die "$ROOT is not a git checkout"
[ -f "$ROOT/.brain-env" ] || die "no .brain-env — run bin/brain-build.sh first"
# shellcheck disable=SC1091
. "$ROOT/.brain-env"
[ -n "${BRAIN_REPO:-}" ]  || die "BRAIN_REPO not set in .brain-env"
BRANCH="main"
MACHINE="$(tr -d ' \r\n' < "$ROOT/.machine" 2>/dev/null || echo unknown)"

ENVDB="$ROOT/env.db"
[ -f "$ENVDB" ] || die "no env.db at $ENVDB — it is placed by hand and deliberately never synced"
TOK="$(grep -m1 '^GITHUB_PAT=' "$ENVDB" | cut -d= -f2- | tr -d '"'"'"'\r')"
[ -n "$TOK" ] || die "GITHUB_PAT not found in $ENVDB"
URL="https://x-access-token:$TOK@github.com/$BRAIN_REPO.git"
G() { git -C "$ROOT" -c credential.helper= "$@"; }
scrub() { sed 's/x-access-token:[^@]*@/x-access-token:***@/g'; }

SECRETS='env\.db|\.credentials\.json|\.(pem|key|gpg)$'

LEAK="$(G status --porcelain | grep -E "$SECRETS" || true)"
[ -z "$LEAK" ] || die "REFUSING — a secret is not ignored:
$LEAK"

G add -A
LEAK="$(G diff --cached --name-only | grep -E "$SECRETS" || true)"
if [ -n "$LEAK" ]; then G reset -q; die "REFUSING — staged a secret: $LEAK"; fi

N="$(G diff --cached --name-only | wc -l | tr -d ' ')"
if [ "$DRY" = 1 ]; then
  say "would commit $N file(s):"
  G diff --cached --name-only | sed 's/^/  /'
  G reset -q
  exit 0
fi

if G diff --cached --quiet; then
  say "nothing local to commit"
else
  [ -n "$MSG" ] || MSG="$N file(s)"
  G -c user.name="${OWNER_NAME:-brain}" -c user.email="${OWNER_EMAIL:-brain@localhost}" \
    commit -q -m "brain($MACHINE): $MSG @ $(date -u +%Y-%m-%dT%H:%M:%SZ)" || die "commit failed"
  say "committed $N file(s)"
fi

# Repo yang baru dibuat masih KOSONG: tidak ada branch untuk di-fetch, dan itu bukan error —
# itu justru push pertama yang disuruh SETUP.md. Tanpa cabang ini skrip mati sebelum push.
if ! G fetch --quiet "$URL" "$BRANCH" 2>&1 | scrub; then
  if [ -z "$(G ls-remote --heads "$URL" 2>/dev/null)" ]; then
    say "remote masih kosong — ini push pertama"
    G push "$URL" "HEAD:$BRANCH" 2>&1 | scrub || die "push failed"
    G fetch --quiet "$URL" "$BRANCH" 2>&1 | scrub || true
    [ "$(G rev-list --count FETCH_HEAD..HEAD)" = 0 ] || die "push reported success but the remote does not have it"
    say "pushed and verified"
    exit 0
  fi
  die "fetch failed"
fi
AHEAD="$(G rev-list --count FETCH_HEAD..HEAD)"
BEHIND="$(G rev-list --count HEAD..FETCH_HEAD)"

if [ "$AHEAD" = 0 ] && [ "$BEHIND" = 0 ]; then
  say "already in sync with the remote — nothing to push"
  exit 0
fi

if [ "$BEHIND" != 0 ]; then
  if [ "$AHEAD" = 0 ]; then
    die "you are $BEHIND commit(s) behind. Run brain-pull.sh first."
  fi
  die "DIVERGED: $AHEAD local vs $BEHIND remote commit(s). NOT pushing, NOT rebasing.
Look at what the other machine did, then reconcile by hand:
  git -C $ROOT log --oneline HEAD..FETCH_HEAD
  git -C $ROOT rebase FETCH_HEAD"
fi

say "pushing $AHEAD commit(s)…"
G push "$URL" "HEAD:$BRANCH" 2>&1 | scrub || die "push failed"
G fetch --quiet "$URL" "$BRANCH" 2>&1 | scrub || true

if [ "$(G rev-list --count FETCH_HEAD..HEAD)" = 0 ]; then
  say "pushed and verified"
else
  die "push reported success but the remote does not have it — check by hand"
fi

# index hygiene: the union merge driver can leave a line twice
IDX="$ROOT/memory/MEMORY.md"
if [ -f "$IDX" ]; then
  DUP="$(grep -n '^- \[' "$IDX" | sed 's/^[0-9]*://' | sort | uniq -d | head -5)"
  [ -z "$DUP" ] || say "⚠ duplicate index lines in MEMORY.md — dedupe them:
$DUP"
fi
