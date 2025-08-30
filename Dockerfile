FROM n8nio/n8n:latest

# Switch to root to copy workflow and script
USER root

COPY n8n-workflow.json /home/node/.n8n/workflows/n8n-workflow.json
COPY start.sh /home/node/start.sh

RUN chmod +x /home/node/start.sh && chown node:node /home/node/start.sh

USER node

CMD ["/home/node/start.sh"]
