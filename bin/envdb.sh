#!/usr/bin/env bash
# Read NAMED keys out of the credential store at run time. It never bulk-exports the file and
# never writes a value anywhere.
#
#   envdb.sh get CLOUDFLARE_API_TOKEN
#   envdb.sh has CLOUDFLARE_API_TOKEN          # exit 0 or 1, prints nothing
#   envdb.sh run CLOUDFLARE_API_TOKEN,CF_ACCOUNT_ID -- wrangler deploy
#
# env.db is a plain KEY=value file placed by hand and deliberately NOT in the brain repo.
# A missing key is a one-line report, never a reason to improvise one.
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ENVDB="$ROOT/env.db"
die() { echo "envdb: $*" >&2; exit 1; }
[[ -f $ENVDB ]] || die "no env.db at $ENVDB — place it by hand, chmod 600"

read_key() {
  local v
  v=$(grep -m1 "^$1=" "$ENVDB" | cut -d= -f2- | tr -d '"'"'"'\r')
  [[ -n $v ]] || return 1
  printf '%s' "$v"
}

case "${1:-}" in
  get) [[ $# -eq 2 ]] || die "usage: envdb.sh get <KEY>"
       read_key "$2" || die "$2 not found in env.db"; echo ;;
  has) [[ $# -eq 2 ]] || die "usage: envdb.sh has <KEY>"
       read_key "$2" >/dev/null 2>&1 ;;
  run) shift
       [[ ${1:-} ]] || die "usage: envdb.sh run KEY[,KEY...] -- <command>"
       keys=$1; shift
       [[ ${1:-} == -- ]] && shift
       [[ $# -gt 0 ]] || die "no command given"
       env_args=()
       IFS=',' read -ra names <<<"$keys"
       for k in "${names[@]}"; do
         val=$(read_key "$k") || die "$k not found in env.db"
         env_args+=("$k=$val")
       done
       exec env "${env_args[@]}" "$@" ;;
  *) die "usage: envdb.sh {get|has|run} ..." ;;
esac
