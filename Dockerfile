# Use the official n8n image as base
FROM n8nio/n8n:latest

# Switch to root to copy files and set permissions
USER root

# Set working directory
WORKDIR /home/node

# Copy workflow and start script
COPY n8n-workflow.json /home/node/.n8n/workflows/n8n-workflow.json
COPY start.sh .

# Make the start script executable and set ownership
RUN chmod +x start.sh && chown node:node start.sh

# Switch back to node user
USER node

# Expose default n8n port
EXPOSE 5678

# Set default command to run the start script
CMD ["sh", "/home/node/start.sh"]
