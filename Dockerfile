FROM n8nio/n8n:latest

# Copy your workflow into the n8n data dir
COPY n8n-workflow.json /home/node/.n8n/workflows/n8n-workflow.json
COPY start.sh /docker-entrypoint-start.sh

# Make the script executable
RUN chmod +x /docker-entrypoint-start.sh

# Expose the n8n port (Railway will still set $PORT)
EXPOSE 5678

# Run our wrapper which imports then starts n8n
CMD ["/docker-entrypoint-start.sh"]
