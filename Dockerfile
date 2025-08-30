# Use official n8n image
FROM n8nio/n8n:latest

# Switch to root to install bash
USER root

# Install bash
RUN apt-get update && apt-get install -y bash && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /home/node

# Copy workflow
COPY n8n-workflow.json /home/node/.n8n/workflows/n8n-workflow.json

# Create n8n directory if missing
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# Switch to node user
USER node

# Expose default port (optional)
EXPOSE 5678

# Use inline start script via bash -c
CMD ["bash", "-c", "\
  mkdir -p /home/node/.n8n && \
  if [ ! -f '/home/node/.n8n/.imported' ] && [ -f '/home/node/.n8n/workflows/n8n-workflow.json' ]; then \
    n8n import:workflow --input=/home/node/.n8n/workflows/n8n-workflow.json || true; \
    touch /home/node/.n8n/.imported; \
  fi; \
  n8n start --host 0.0.0.0 --port $PORT \
"]
