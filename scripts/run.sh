set -euo pipefail
port="${1:-8501}"
eval "$(/Users/davekokel/miniconda3/bin/conda shell.zsh hook)"
conda activate streamlit_py312
./scripts/check_supabase.py
pids="$(lsof -ti tcp:$port || true)"
[ -n "$pids" ] && echo "$pids" | xargs kill || true
streamlit run app.py --server.port "$port"
