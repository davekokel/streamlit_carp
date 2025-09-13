set -euo pipefail
port="${1:-8501}"
pids="$(lsof -ti tcp:$port || true)"
[ -n "$pids" ] && echo "$pids" | xargs kill || true
