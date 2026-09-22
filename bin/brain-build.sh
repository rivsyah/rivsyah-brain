#!/usr/bin/env bash
# brain-build — assemble this machine's rulebook, safety net, harness hooks and pointer memory
# from the sources in this repo. Run it after ANY edit to rules/.
#
#   rules/CLAUDE.core.md            the shared body, identical on every machine you own
#   rules/machines/<id>.md          this machine: identity, bare metal, paths.
#                                     <!--@CORE@-->     marks where the core body is spliced in
#                                     <!--@AUTONOMY@--> marks the autonomy fragment
#                                     <!--@OSNOTES@-->  marks the OS fragment
#                                     <!--@VARS@ ... @VARS--> defines every {{TOKEN}} value
#   rules/fragments/                 autonomy-{normal,high}.md, os-{linux,macos,windows}.md
#   rules/safety-net.md              the short always-loads file
#
# Usage:  brain-build.sh [machine-id] [--dry-run] [--force-settings]
#         machine-id is read from .machine when omitted.
#         --dry-run prints to stdout and writes nothing.
#         --force-settings overwrites ~/.claude/settings.json (a backup is kept).
#
# Never hand-edit a built file. The next build overwrites it.
set -uo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$HERE/.." && pwd)"
RULES="$ROOT/rules"

die() { echo "brain-build: $*" >&2; exit 1; }

DRY=0; FORCE_SETTINGS=0; MACHINE=""
for a in "$@"; do
  case "$a" in
    --dry-run|-n)     DRY=1 ;;
    --force-settings) FORCE_SETTINGS=1 ;;
    *)                MACHINE="$a" ;;
  esac
done

[ -n "$MACHINE" ] || MACHINE="$(tr -d ' \r\n' < "$ROOT/.machine" 2>/dev/null)"
[ -n "$MACHINE" ] || die "no machine id — pass one, or run bootstrap.sh first"

SKEL="$RULES/machines/$MACHINE.md"
[ -f "$SKEL" ]                 || die "no machine skeleton at $SKEL"
[ -f "$RULES/CLAUDE.core.md" ] || die "no core at $RULES/CLAUDE.core.md"
[ "$DRY" = 1 ] || echo "$MACHINE" > "$ROOT/.machine"

# ---------- read the VARS block ----------
declare -A V
in_vars=0
while IFS= read -r line; do
  case "$line" in
    *'<!--@VARS@'*) in_vars=1; continue ;;
    *'@VARS-->'*)   in_vars=0; continue ;;
  esac
  if [ "$in_vars" = 1 ] && [ -n "$line" ]; then
    key="${line%%=*}"; val="${line#*=}"
    key="$(printf '%s' "$key" | tr -d ' \r')"
    val="${val%$'\r'}"
    [ -n "$key" ] && V["$key"]="$val"
  fi
done < "$SKEL"
[ -n "${V[RULEBOOK]:-}" ]  || die "VARS block in $SKEL has no RULEBOOK"
[ -n "${V[SAFETYNET]:-}" ] || die "VARS block in $SKEL has no SAFETYNET"

# values are written portably with a leading ~ or $HOME; expand at build time
expand() {
  case "$1" in
    "~/"*)      printf '%s' "$HOME/${1#\~/}" ;;
    "~")        printf '%s' "$HOME" ;;
    '$HOME/'*)  printf '%s' "$HOME/${1#\$HOME/}" ;;
    '$HOME')    printf '%s' "$HOME" ;;
    *)          printf '%s' "$1" ;;
  esac
}

# substitute every {{TOKEN}} on stdin — pure bash, so a backslash in a path cannot break sed
subst() {
  local line k
  while IFS= read -r line || [ -n "$line" ]; do
    # dua lintasan: sebuah nilai (mis. CONFIDENTIAL_BLOCK) bisa memuat token lain di dalamnya
    for pass in 1 2; do for k in "${!V[@]}"; do line="${line//\{\{$k\}\}/${V[$k]}}"; done; done
    printf '%s\n' "$line"
  done
}

# ---------- pick the fragments ----------
AUTO_FRAG="$RULES/fragments/autonomy-${V[AUTONOMY]:-normal}.md"
[ -f "$AUTO_FRAG" ] || die "no autonomy fragment for '${V[AUTONOMY]:-normal}' at $AUTO_FRAG"
OS_FRAG="$RULES/fragments/os-${V[MACHINE_OS]:-linux}.md"
[ -f "$OS_FRAG" ] || die "no OS fragment for '${V[MACHINE_OS]:-linux}' at $OS_FRAG"

# ---------- assemble ----------
# Markers are matched as WHOLE lines only. They also appear as prose inside the skeleton's own
# authoring note, and a substring match would splice the core into the middle of that comment.
TMP="$(mktemp)"; TMP2="$(mktemp)"; trap 'rm -f "$TMP" "$TMP2"' EXIT
in_vars=0; in_doc=0
while IFS= read -r line || [ -n "$line" ]; do
  case "$line" in
    *'<!--@VARS@'*) in_vars=1; continue ;;
    *'@VARS-->'*)   in_vars=0; continue ;;
    *'<!--@DOC@'*)  in_doc=1;  continue ;;
    *'@DOC-->'*)    in_doc=0;  continue ;;
  esac
  { [ "$in_vars" = 1 ] || [ "$in_doc" = 1 ]; } && continue
  case "$(printf '%s' "$line" | tr -d '[:space:]')" in
    '<!--@CORE@-->')     sed '1,/^$/{/^<!-- GENERATED BODY/,/-->$/d;}' "$RULES/CLAUDE.core.md" ;;
    '<!--@AUTONOMY@-->') cat "$AUTO_FRAG" ;;
    '<!--@OSNOTES@-->')  cat "$OS_FRAG" ;;
    *)                   printf '%s\n' "$line" ;;
  esac
done < "$SKEL" > "$TMP"

# the core carries the AUTONOMY marker too, so resolve it in a second pass
if grep -q '^[[:space:]]*<!--@AUTONOMY@-->[[:space:]]*$' "$TMP"; then
  while IFS= read -r line || [ -n "$line" ]; do
    if [ "$(printf '%s' "$line" | tr -d '[:space:]')" = '<!--@AUTONOMY@-->' ]; then
      cat "$AUTO_FRAG"
    else
      printf '%s\n' "$line"
    fi
  done < "$TMP" > "$TMP2"
  mv "$TMP2" "$TMP"
fi

OUTBUF="$(mktemp)"
{
  printf '%s\n' "<!-- BUILT FILE — do not edit. Source: rules/CLAUDE.core.md +"
  printf '%s\n' "     rules/machines/$MACHINE.md. Edit those, then run: ${V[BUILD]:-brain-build.sh} -->"
  printf '\n'
  cat "$TMP"
} | subst > "$OUTBUF"

if [ "$DRY" = 1 ]; then
  echo "===== $MACHINE rulebook -> ${V[RULEBOOK]} (DRY RUN, nothing written) =====" >&2
  cat "$OUTBUF"
  echo "===== safety net -> ${V[SAFETYNET]} =====" >&2
  [ -f "$RULES/safety-net.md" ] && subst < "$RULES/safety-net.md"
  rm -f "$OUTBUF"
  exit 0
fi

# Backups live INSIDE the repo root (gitignored), never beside the built file: some systems
# refuse new files at the target's directory and the safety copy would silently not exist.
BK="$ROOT/.build-backups"; mkdir -p "$BK"
STAMP="$(date -u +%Y%m%d-%H%M%S)"

OUT="$(expand "${V[RULEBOOK]}")"
mkdir -p "$(dirname "$OUT")" 2>/dev/null
[ -f "$OUT" ] && cp "$OUT" "$BK/rulebook-$STAMP.md"
cat "$OUTBUF" > "$OUT" || die "cannot write $OUT"
rm -f "$OUTBUF"
echo "brain-build: rulebook      -> $OUT ($(wc -c < "$OUT") bytes)"

SN="$(expand "${V[SAFETYNET]}")"
if [ -f "$RULES/safety-net.md" ]; then
  mkdir -p "$(dirname "$SN")" 2>/dev/null
  [ -f "$SN" ] && cp "$SN" "$BK/safety-net-$STAMP.md"
  subst < "$RULES/safety-net.md" > "$SN" && echo "brain-build: safety net    -> $SN"
fi

# ---------- .brain-env: this machine's real values, for scripts that must not guess ----------
# SINGLE quotes deliberately: a Windows value ends in a backslash, and inside double quotes that
# backslash would escape the closing quote and the file would never parse.
for k in AGENT_NAME MACHINE_ID MACHINE_OS OWNER_NAME OWNER_SHORT OWNER_EMAIL BRAIN VAULT \
         VAULT_INDEX ENVDB PROJECTS RULEBOOK SYNC BUILD BRAIN_REPO CONFIDENTIAL_DIRS; do
  [ -n "${V[$k]:-}" ] && printf "%s='%s'\n" "$k" "$(printf '%s' "${V[$k]}" | sed "s/'/'\\\\''/g")"
done > "$ROOT/.brain-env"
# the confidential list lives in agent.conf, not in the VARS block — carry it across verbatim
if [ -f "$ROOT/agent.conf" ]; then
  CD="$(grep -m1 '^CONFIDENTIAL_DIRS=' "$ROOT/agent.conf" | cut -d= -f2- | tr -d '"' | tr -d "'")"
  printf "CONFIDENTIAL_DIRS='%s'\n" "$CD" >> "$ROOT/.brain-env"
fi
bash -n "$ROOT/.brain-env" 2>/dev/null || die ".brain-env is not sourceable — refusing to leave a broken one"

# ---------- harness pointer memory ----------
# Claude Code keeps a per-directory memory folder and injects it at session start. That injection
# is the only memory layer that is mechanical rather than prose, so the pointer to the real vault
# has to live there too. Directory name = the launch path with every non-alphanumeric character
# folded to "-":  /home/aldo -> -home-aldo ,  C:\ -> C--
PTPL="$ROOT/harness/pointer-memory/canonical-memory-store.md"
if [ -f "$PTPL" ]; then
  _sp="$(expand "${V[SPAWN]:-$HOME}")"
  # Windows: Claude Code membuat slug dari path NATIF (C:\Users\me -> C--Users-me),
  # bukan dari path MSYS (/c/Users/me). Tanpa ini pointer mendarat di folder yang tak pernah dibaca.
  command -v cygpath >/dev/null 2>&1 && _sp="$(cygpath -w "$_sp" 2>/dev/null || printf %s "$_sp")"
  SLUG="$(printf %s "$_sp" | sed -e 's/[^A-Za-z0-9-]/-/g')"
  PDIR="$HOME/.claude/projects/$SLUG/memory"
  mkdir -p "$PDIR"
  subst < "$PTPL" > "$PDIR/canonical-memory-store.md"
  LINE="- [CANONICAL memory store = ${V[VAULT]}](canonical-memory-store.md) — ALL durable memory lives there; this folder is a pointer only. Read its MEMORY.md at session start; write cards there, never here. Push with ${V[SYNC]}"
  touch "$PDIR/MEMORY.md"
  grep -v 'canonical-memory-store.md' "$PDIR/MEMORY.md" > "$PDIR/.m.tmp" 2>/dev/null || true
  { printf '%s\n' "$LINE"; cat "$PDIR/.m.tmp" 2>/dev/null; } > "$PDIR/MEMORY.md"
  rm -f "$PDIR/.m.tmp"
  echo "brain-build: pointer memory-> $PDIR"
fi

# ---------- harness hooks ----------
HDIR="$HOME/.claude/hooks"
mkdir -p "$HDIR"
for h in session-start.sh block-confidential.sh; do
  [ -f "$ROOT/harness/hooks/$h" ] || continue
  cp "$ROOT/harness/hooks/$h" "$HDIR/$h" && chmod +x "$HDIR/$h"
done
echo "brain-build: hooks         -> $HDIR"

# ---------- harness settings ----------
SFILE="$HOME/.claude/settings.json"
STPL="$ROOT/harness/settings.template.json"
if [ -f "$STPL" ]; then
  if [ ! -f "$SFILE" ] || [ "$FORCE_SETTINGS" = 1 ]; then
    [ -f "$SFILE" ] && cp "$SFILE" "$BK/settings-$STAMP.json"
    MODE="default"; [ "${V[AUTONOMY]:-normal}" = "high" ] && MODE="bypassPermissions"
    # one deny entry per line, joined with commas afterwards so the JSON stays valid when the
    # confidential list is empty (the array is then simply empty)
    DENYF="$(mktemp)"
    if [ -n "${CD:-}" ]; then
      IFS=',' read -ra dirs <<< "$CD"
      for d in "${dirs[@]}"; do
        d="$(printf '%s' "$d" | sed 's/^ *//; s/ *$//; s|/*$||')"
        [ -n "$d" ] || continue
        case "$d" in
          /*) g="$d" ;;
          *)  g="**/$d" ;;
        esac
        for t in Read Edit Write Glob Grep; do
          printf '      "%s(%s)"\n      "%s(%s/**)"\n' "$t" "$g" "$t" "$g" >> "$DENYF"
        done
      done
    fi
    [ "$MODE" = "bypassPermissions" ] && printf '      "EnterPlanMode"\n' >> "$DENYF"
    JOINED="$(awk 'NR>1{printf ",\n"} {printf "%s", $0} END{if (NR>0) printf "\n"}' "$DENYF")"
    rm -f "$DENYF"
    awk -v mode="$MODE" -v deny="$JOINED" '
      { gsub(/@@MODE@@/, mode)
        if ($0 ~ /@@DENY@@/) { if (length(deny) > 0) printf "%s", deny } else { print } }
    ' "$STPL" > "$SFILE"
    echo "brain-build: settings      -> $SFILE"
  else
    echo "brain-build: settings      -> $SFILE exists, left alone (--force-settings to rewrite)"
  fi
fi

ls -1t "$BK"/rulebook-*.md    2>/dev/null | tail -n +11 | xargs -r rm -f
ls -1t "$BK"/safety-net-*.md  2>/dev/null | tail -n +11 | xargs -r rm -f

echo "brain-build: done. Previous versions in $BK"
