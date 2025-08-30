FROM n8nio/n8n:latest

USER root

# Install bash since n8n image doesn't include it
RUN apk add --no-cache bash

# Copy workflow and script
COPY n8n-workflow.json /home/node/.n8n/workflows/n8n-workflow.json
COPY start.sh /home/node/start.sh

# Fix permissions
RUN chmod +x /home/node/start.sh && chown node:node /home/node/start.sh

USER node

EXPOSE 5678

# Use bash to run script
CMD ["bash", "/home/node/start.sh"]