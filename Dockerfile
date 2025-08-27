FROM n8nio/n8n:latest

# Copy workflow into n8n's data dir
COPY n8n-workflow.json /home/node/.n8n/workflows/n8n-workflow.json

# Copy start script into /home/node/
COPY start.sh /home/node/start.sh

# Ensure script is executable
RUN chmod +x /home/node/start.sh

# Expose default n8n port
EXPOSE 5678

# Run our wrapper
CMD ["/home/node/start.sh"]
