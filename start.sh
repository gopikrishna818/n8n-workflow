#!/bin/sh
set -e

# Set port & host
export N8N_PORT="${PORT:-5678}"
export N8N_HOST="0.0.0.0"

# Import workflow if not already imported
if [ ! -f "/home/node/.n8n/.imported" ] && [ -f "/home/node/.n8n/workflows/n8n-workflow.json" ]; then
  n8n import:workflow --input=/home/node/.n8n/workflows/n8n-workflow.json || true
  touch /home/node/.n8n/.imported
fi

n8n start
