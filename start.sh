#!/bin/sh
set -e

# Let Railway choose the port; default to 5678 for local runs
export N8N_PORT="${PORT:-5678}"
export N8N_HOST="0.0.0.0"

# Import the workflow once (idempotent)
if [ ! -f "/home/node/.n8n/.imported" ] && [ -f "/home/node/.n8n/workflows/n8n-workflow.json" ]; then
  n8n import:workflow --input=/home/node/.n8n/workflows/n8n-workflow.json || true
  touch /home/node/.n8n/.imported
fi

exec n8n start
