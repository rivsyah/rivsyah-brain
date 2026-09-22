#!/usr/bin/env bash
# envdb-setup — walk through the services in keys.catalog and save the keys you have.
#
#   envdb-setup.sh            ask for every key that is not set yet
#   envdb-setup.sh --all      ask again for keys that ARE set, so you can replace one
#   envdb-setup.sh --check    print what is set and what is missing, ask nothing
#   envdb-setup.sh --guide    print where to get each key, ask nothing
#   envdb-setup.sh KEY [KEY]  ask only for the keys you name
#
# It writes to env.db in the brain root: one KEY=value per line, chmod 600, never committed.
# Values are typed with the screen blank and are never printed, logged or echoed back.
#
# RUN THIS IN A PLAIN TERMINAL, NOT INSIDE A CLAUDE CODE SESSION. Anything you type inside a
# session becomes part of that session's transcript. This script exists so a key reaches the file
# without passing through a conversation.
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CAT="$ROOT/bin/keys.catalog"
ENVDB="$ROOT/env.db"

die() { echo "envdb-setup: $*" >&2; exit 1; }
[ -f "$CAT" ] || die "no catalogue at $CAT"

MODE="new"; ONLY=""
for a in "$@"; do
  case "$a" in
    --all)   MODE="all" ;;
    --check) MODE="check" ;;
    --guide) MODE="guide" ;;
    -h|--help) sed -n '2,16p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    -*)      die "unknown option: $a" ;;
    *)       ONLY="$ONLY $a"; MODE="named" ;;
  esac
done

# asking for a value needs a real terminal: the prompt and the hidden input both go to /dev/tty
case "$MODE" in
  new|all|named)
    if ! { : < /dev/tty; } 2>/dev/null; then
      echo "envdb-setup: no terminal available, so nothing can be typed in." >&2
      echo "Run this from a plain terminal:  $ROOT/bin/envdb-setup.sh" >&2
      echo "To see what is needed without typing anything: $ROOT/bin/envdb-setup.sh --guide" >&2
      exit 1
    fi
    ;;
esac

if [ ! -f "$ENVDB" ]; then
  : > "$ENVDB"; chmod 600 "$ENVDB"
  echo "envdb-setup: created $ENVDB (chmod 600, never committed)"
fi
chmod 600 "$ENVDB" 2>/dev/null

has_key() { grep -q "^$1=" "$ENVDB" 2>/dev/null; }

set_key() {   # set_key KEY VALUE — replaces any existing line, keeps the rest of the file
  local k="$1" v="$2" tmp
  tmp="$(mktemp)"; chmod 600 "$tmp"
  grep -v "^$k=" "$ENVDB" > "$tmp" 2>/dev/null
  printf '%s=%s\n' "$k" "$v" >> "$tmp"
  mv "$tmp" "$ENVDB"; chmod 600 "$ENVDB"
}

wrapped() { printf '%s\n' "$1" | fold -s -w 76 | sed 's/^/     /'; }

show_guide() {   # show_guide KEY REQ SERVICE WHAT URL STEPS
  local k="$1" req="$2" svc="$3" what="$4" url="$5" steps="$6" n=1 s
  echo
  echo "  ── $svc — $k  [${req}]"
  wrapped "$what"
  echo "     Get it at: $url"
  printf '%s' "$steps" | tr '\n' ' ' | awk -F ' :: ' '{ for (i=1; i<=NF; i++) print $i }' \
    | while IFS= read -r s; do
        [ -n "$s" ] || continue
        printf '     %d. %s\n' "$n" "$s"
        n=$((n + 1))
      done
}

count_set=0; count_missing=0; missing_list=""

while IFS='|' read -r KEY REQ SVC WHAT URL STEPS; do
  case "$KEY" in ''|'#'*) continue ;; esac
  KEY="$(printf '%s' "$KEY" | tr -d ' \r')"
  [ -n "$KEY" ] || continue

  if [ "$MODE" = "named" ]; then
    case " $ONLY " in *" $KEY "*) ;; *) continue ;; esac
  fi

  if has_key "$KEY"; then
    count_set=$((count_set + 1))
    [ "$MODE" = "check" ] && printf '  set      %-24s %s\n' "$KEY" "$SVC"
    [ "$MODE" = "new" ] && continue
  else
    count_missing=$((count_missing + 1))
    missing_list="$missing_list $KEY"
    [ "$MODE" = "check" ] && printf '  MISSING  %-24s %s (%s)\n' "$KEY" "$SVC" "$REQ"
  fi
  [ "$MODE" = "check" ] && continue

  show_guide "$KEY" "$REQ" "$SVC" "$WHAT" "$URL" "$STEPS"
  [ "$MODE" = "guide" ] && continue

  if has_key "$KEY"; then
    printf '     This key is already set. Replace it? [y/N] '
    read -r yn </dev/tty || yn=""
    case "$yn" in y|Y|yes|YES) ;; *) echo "     kept the existing value"; continue ;; esac
  fi

  printf '     Paste %s (input is hidden), or press Enter to skip: ' "$KEY"
  val=""
  read -rs val </dev/tty || val=""
  echo
  val="$(printf '%s' "$val" | tr -d ' \r\n')"
  if [ -z "$val" ]; then
    echo "     skipped — run this again any time: bin/envdb-setup.sh $KEY"
    continue
  fi
  set_key "$KEY" "$val"
  echo "     saved to env.db (${#val} characters, not shown)"
done < "$CAT"

echo
case "$MODE" in
  check)
    echo "  $count_set set, $count_missing missing in $ENVDB"
    [ "$count_missing" = 0 ] || echo "  Fill them in with: bin/envdb-setup.sh"
    ;;
  guide)
    echo "  Nothing was written. To fill them in: bin/envdb-setup.sh"
    ;;
  *)
    echo "  Done. Check any time with: bin/envdb-setup.sh --check"
    echo "  Read one back with:        bin/envdb.sh get GITHUB_PAT"
    echo "  Run a command with keys:   bin/envdb.sh run CLOUDFLARE_API_TOKEN -- wrangler deploy"
    echo
    echo "  A service that is not in the list yet: add a line to bin/keys.catalog, then run this"
    echo "  again. Or write the key straight into env.db as KEY=value, one per line."
    ;;
esac
