FROM n8nio/n8n:latest

# Switch to root to copy + chmod
USER root

# Copy workflow and script
COPY n8n-workflow.json /home/node/.n8n/workflows/n8n-workflow.json
COPY start.sh /home/node/start.sh

# Make the script executable
RUN chmod +x /home/node/start.sh && chown node:node /home/node/start.sh

# Switch back to node user
USER node

# Expose port
EXPOSE 5678

# Run wrapper
CMD ["sh", "/home/node/start.sh"]
